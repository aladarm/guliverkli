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
                          (         1, '2022-02-01 12:00:00',  1024,                'last_name', 'Megszentségteleníthetetlenségeskedéseitekért' ), -- string
                          (         2, '2022-02-01 12:00:00',  1024, 'profile_photo_remote_url', 'https://*/mezga.jpeg'                         ), -- string
                          (         3, '2022-02-01 12:00:00',  1024,                     'tags', '{ "Budapest": 1, "Debrecen": 2 }'             ), -- string (json)
                          (         4, '2022-02-01 12:00:00',  1024,                    'score', '100'                                          ), -- int
                          (         5, '2022-02-01 12:00:00',  1024,                 'location', 'Hungary'                                      ), -- string
                          (         6, '2022-02-01 12:00:00',  1024,                     'date', '1455-11-12'                                   ), -- string (date)
                          (         7, '2022-02-01 12:00:00',  1024,                 'position', '1'                                            ), -- int
                          (         8, '2022-02-01 12:00:00',  1024,           'total_articles', '5'                                            ), -- int
                          (         9, '2022-02-01 12:00:00',  1024,   'total_private_articles', '10'                                           ), -- int
                          (        10, '2022-02-01 12:00:00',  1024,                      'url', 'https://*/mezga'                              ), -- string
                          (        11, '2022-02-01 12:00:00',  1024,                        'a', '50'                                           ), -- int
                          (        12, '2022-02-01 12:00:00',  1024,                        'b', NULL                                           ), -- int
                          (        13, '2022-02-01 12:00:00',  1024,                        'c', NULL                                           ), -- int
                          (        14, '2022-02-01 12:00:00',  1024,                        'd', NULL                                           ), -- int
                          (        15, '2022-02-01 12:00:00',  1024,                  'type_id', '1'                                            ), -- int (1|2|3|4)
                          (        16, '2022-02-01 12:00:00',  1024,               'first_name', 'Aladár'                                       ), -- string
                          (        17, '2022-02-01 12:00:00',  1024,                 'username', 'M. Aladár'                                    ); -- string

INSERT INTO `profilemeta` ( `meta_id`,              `upload`, `uid`,                 `meta_key`, `meta_value` ) VALUES
                          (        18, '2022-02-02 12:00:00',  1024,                'last_name', 'Mézga'      );
