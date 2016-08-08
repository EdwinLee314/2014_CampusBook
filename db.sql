create database bookshop;

use bookshop;
create table users(
	`users_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
	
	`nickname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `surname` varchar(32) NOT NULL,
	
  `postcode` smallint(6) NOT NULL,
  `phone` int(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
	`register_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table books(
	`book_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `isbn` varchar(15) NOT NULL,
  `unit_code` varchar(15) NOT NULL,
	`title` varchar(50) NOT NULL,
  `author` varchar(32) NOT NULL,
 
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

create table copies(

	`copy_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
	`book_id` smallint(6) unsigned NOT NULL,
	`seller_id` smallint(6) unsigned NOT NULL,
	`buyer_id` smallint(6) unsigned DEFAULT 0,
	
  `price` varchar(15) NOT NULL,
	`description` varchar(50) NOT NULL,
  `conditions` varchar(20) NOT NULL,
 
  PRIMARY KEY (`copy_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

