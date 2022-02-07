CREATE TABLE `profiles` (

	`uid`    int       UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `profilemeta` (

	`meta_id`    bigint       UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`upload`     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`uid`        int          UNSIGNED NOT NULL,
	`meta_key`   varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
	`meta_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `profilemeta` ADD FOREIGN KEY ( `uid` ) REFERENCES `profiles` ( `uid` );

INSERT INTO `profiles` ( `uid`, `upload`              ) VALUES
                       (  1024, '2022-02-01 12:00:00' );

INSERT INTO `profilemeta` ( `meta_id`,              `upload`, `uid`,                 `meta_key`, `meta_value`                                   ) VALUES
                          (         1, '2022-02-01 12:00:00',  1024,                'last_name', 'Megszentségteleníthetetlenségeskedéseitekért' ),
                          (         2, '2022-02-01 12:00:00',  1024, 'profile_photo_remote_url', 'https://*/mezga.jpeg'                         ),
                          (         3, '2022-02-01 12:00:00',  1024,                     'tags', '{ "Budapest": 1, "Debrecen": 2 }'             ),
                          (         4, '2022-02-01 12:00:00',  1024,                    'score', '100'                                          ),
                          (         5, '2022-02-01 12:00:00',  1024,                 'location', 'Hungary'                                      ),
                          (         6, '2022-02-01 12:00:00',  1024,                     'date', '1455-11-12'                                   ),
                          (         7, '2022-02-01 12:00:00',  1024,                 'position', '1'                                            ),
                          (         8, '2022-02-01 12:00:00',  1024,           'total_articles', '5'                                            ),
                          (         9, '2022-02-01 12:00:00',  1024,   'total_private_articles', '10'                                           ),
                          (        10, '2022-02-01 12:00:00',  1024,                      'url', 'https://*/mezga'                              ),
                          (        11, '2022-02-01 12:00:00',  1024,                        'a', '50'                                           ),
                          (        12, '2022-02-01 12:00:00',  1024,                        'b', NULL                                           ),
                          (        13, '2022-02-01 12:00:00',  1024,                        'c', NULL                                           ),
                          (        14, '2022-02-01 12:00:00',  1024,                        'd', NULL                                           ),
                          (        15, '2022-02-01 12:00:00',  1024,                  'type_id', '1'                                            ),
                          (        16, '2022-02-01 12:00:00',  1024,               'first_name', 'Aladár'                                       ),
                          (        17, '2022-02-01 12:00:00',  1024,                 'username', 'M. Aladár'                                    );

INSERT INTO `profilemeta` ( `meta_id`,              `upload`, `uid`,                 `meta_key`, `meta_value` ) VALUES
                          (        18, '2022-02-02 12:00:00',  1024,                'last_name', 'Mézga'      );
