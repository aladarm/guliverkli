<?php

// <mysqli_connect>

	$mysqli = mysqli_connect( "localhost", "my_user", "my_password", "my_db" );

// </mysqli_connect>

// <$_POST>

	$_POST = array(

		'order_by'=> 'position',
		'order'=> 'DESC',

		'type_id'=> 1, // 1|2|3|4 lehet vagy 0. 0 esetén lásd a 73. sort

		'max_rows'=> 25, // egy oldalon maximum ennyi sor
		'page'=> 1, // hanyadik oldalt kérdezzük le

		// <like>		

			'last_name',
			'tags',
			'score',
			'location',
			'date',
			'position',
			'total_articles',
			'total_private_articles',
			'prev_a',
			'fa',     // a
			'prev_b',
			'fb',     // b
			'prev_c',
			'fc',     // c
			'prev_d',
			'fd',     // d
			'username'

		// </like>

	);

// </$_POST>

// <order_by>

	if( in_array( $_POST [ 'order_by' ], array( 'score', 'position', 'total_articles', 'total_private_articles', 'prev_a', 'a', 'prev_b', 'b', 'prev_c', 'c', 'prev_d', 'd',  ) ) ) {

		// ha a string-ként tárolt szám szerint szeretnénk rendezni:

		$order_by = "cast( `" . $_POST [ 'order_by' ] . "` as UNSIGNED )";

	} else {

		$order_by = "`" . $_POST [ 'order_by' ] . "`";

	}

// </order_by>

// <type_id>

	/*

		4 típus van és van egy (0) amikor az összes típust lekérdezzük:

		- $_POST [ 'type_id' ] = 1
		- $_POST [ 'type_id' ] = 2
		- $_POST [ 'type_id' ] = 3
		- $_POST [ 'type_id' ] = 4
		- $_POST [ 'type_id' ] = 0

		Az összes típus lekérdezésénél csak azokra a profilokra vagyunk kíváncsiak, ahol az aktuális a|b|c|d adatok, oszlopok értékei csökkentek az előző adatokhoz képest.

	*/

	$type_id = " `p2`.`type_id`='" . $_POST [ 'type_id' ] . "'";

	if( $_POST [ 'type_id' ] == '0' ) {

		// ha van korábbi a|b|c|d adat:
		$type_id = ' ( `prev_a_date` IS NOT NULL OR `prev_b_date` IS NOT NULL OR `prev_c_date` IS NOT NULL OR `prev_d_date` IS NOT NULL )';

		// és ha a korábbi adat nagyobb az aktuálisnál, tehát csökkenés van az előző adathoz képest
		// vagy korábban volt érték, de már nincs.
		$type_id.= ' AND ( `a` < `prev_a` OR `b` < `prev_b` OR `c` < `prev_c` OR `d` < `prev_d` OR ( `a` IS NULL AND `prev_a` IS NOT NULL ) OR ( `b` IS NULL AND `prev_b` IS NOT NULL ) OR ( `c` IS NULL AND `prev_c` IS NOT NULL ) OR ( `d` IS NULL AND `prev_d` IS NOT NULL ) )';

	} else {}

// </type_id>

// <like>

	// szűrő/filter

	$like = array();

	foreach( array(

		'last_name',
		'tags',
		'score',
		'location',
		'date',
		'position',
		'total_articles',
		'total_private_articles',
		'prev_a',
		'fa',     // a
		'prev_b',
		'fb',     // b
		'prev_c',
		'fc',     // c
		'prev_d',
		'fd',     // d
		'username'
		
		// nem kellenek:
		// - profile_photo_remote_url
		// - url
		// - type_id
		// - first_name

	) as $v ) {

		if( ! is_null( $_POST [ $v ] ) ) {

			if( substr( $v, 0, 1 ) == 'f' ) {
				
				// A $_POST tömbben nem a|b|c|d van, hanem fa|fb|fc|fd, erre azért van szükség:

				$like [ substr( $v, 1 ) ] = $_POST [ $v ];

			} else {

				$like [ $v ] = $_POST [ $v ];

			}

		} else {}

	}

	$l_sql = '';

	if( count( $like ) > 0 ) {

		foreach( $like as $lk=> $lv ) {

			$l_sql.= " AND `p2`.`" . $lk . "` LIKE '%" . $lv . "%'";

		}

	} else {}

// </like>

// <1_sql>

	// ez a lekérdezés azért kell, hogy megtudjuk az összes érintett sorok számát

	$sql = "SELECT `p2`.* FROM (
	
	) `p2` WHERE" . $type_id . $l_sql . " ORDER BY " . $order_by . " " . $_POST [ 'order' ];

	$result = mysqli_query( $mysqli, $sql );

	$rowcount = mysqli_num_rows( $result );

// </1_sql>

// <limit>

	// ez a második SQL lekérdezéshez kell mert itt már nem az összes sorra vagyunk kíváncsiak, hanem csak az aktuális oldal soraira

	if( $_POST [ 'page' ] == '1' ) {

		$limit = $_POST [ 'max_rows' ];

	} else {

		$p = $_POST [ 'page' ] - 1;

		$m = $p * $_POST [ 'max_rows' ];

		$limit = $m . ', ' . $_POST [ 'max_rows' ];

	}

// </limit>

// <2_sql>

	// kiegészítve a LIMIT-tel az első SQL

	$result = mysqli_query( $mysqli, $sql . " LIMIT " . $limit );

	$profiles = array();

	while( $row = mysqli_fetch_assoc( $result ) ) {

		$profiles [] = $row;

	}

// </2_sql>

// <output>

	print $rowcount;      // összesen hány sor van az adatbázisban
	print_r( $profiles ); // az aktuális oldal sorainak tömbje

// </output>

?>
