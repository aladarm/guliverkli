CREATE TABLE `profiles` (

	`uid` int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `profilemeta` (

	`meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`uid` int UNSIGNED NOT NULL,
	`meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
	`meta_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `profilemeta` ADD FOREIGN KEY( `uid` ) REFERENCES `profiles`( `uid` );
