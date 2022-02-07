-- type_id=0

SELECT `p2`.* FROM (
		SELECT `p`.*,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='profile_photo_remote_url' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1) AS `profile_photo_remote_url`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='last_name'                AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1) AS `last_name`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='username'                 AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1) AS `username`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='total_articles'           AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1) AS `total_articles`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='total_private_articles'   AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1) AS `total_private_articles`,			
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='url'                      AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1) AS `url`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='tags'                     AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1) AS `tags`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='position'                 AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1) AS `position`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='score'                    AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1) AS `score`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='location'                 AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1) AS `location`,
			
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='a' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1,1) AS `prev_a`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='a' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1  ) AS      `a`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='b' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1,1) AS `prev_b`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='b' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1  ) AS      `b`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='c' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1,1) AS `prev_c`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='c' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1  ) AS      `c`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='d' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1,1) AS `prev_d`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='d' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1  ) AS      `d`,
			
			(SELECT `upload` FROM `profilemeta` WHERE `meta_key`='a' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1,1) AS `prev_a_date`,
			(SELECT `upload` FROM `profilemeta` WHERE `meta_key`='a' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1  ) AS      `a_date`,
			(SELECT `upload` FROM `profilemeta` WHERE `meta_key`='b' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1,1) AS `prev_b_date`,
			(SELECT `upload` FROM `profilemeta` WHERE `meta_key`='b' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1  ) AS      `b_date`,
			(SELECT `upload` FROM `profilemeta` WHERE `meta_key`='c' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1,1) AS `prev_c_date`,
			(SELECT `upload` FROM `profilemeta` WHERE `meta_key`='c' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1  ) AS      `c_date`,
			(SELECT `upload` FROM `profilemeta` WHERE `meta_key`='d' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1,1) AS `prev_d_date`,
			(SELECT `upload` FROM `profilemeta` WHERE `meta_key`='d' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1  ) AS      `d_date`,
			
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='date'    AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1) AS `date`,
			(SELECT `meta_value` FROM `profilemeta` WHERE `meta_key`='type_id' AND `uid`=`p`.`uid` ORDER BY `upload` DESC LIMIT 1) AS `type_id`
		FROM `profiles` AS `p`
	) `p2` WHERE ( `prev_a_date` IS NOT NULL OR `prev_b_date` IS NOT NULL OR `prev_c_date` IS NOT NULL OR `prev_d_date` IS NOT NULL ) AND ( `a` < `prev_a` OR `b` < `prev_b` OR `c` < `prev_c` OR `d` < `prev_d` OR ( `a` IS NULL AND `prev_a` IS NOT NULL ) OR ( `b` IS NULL AND `prev_b` IS NOT NULL ) OR ( `c` IS NULL AND `prev_c` IS NOT NULL ) OR ( `d` IS NULL AND `prev_d` IS NOT NULL ) ) AND `p2`.`last_name` LIKE '%Mézga%' ORDER BY `p2`.`position` ASC
