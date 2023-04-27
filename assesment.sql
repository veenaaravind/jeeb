-- Adminer 4.7.6 PostgreSQL dump

DROP TABLE IF EXISTS "product";
DROP SEQUENCE IF EXISTS product_id_seq;
CREATE SEQUENCE product_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."product" (
    "id" integer DEFAULT nextval('product_id_seq') NOT NULL,
    "product_name" character varying(155) NOT NULL,
    "product_id" integer NOT NULL,
    "sub_category_id" integer NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "sub_category";
DROP SEQUENCE IF EXISTS "sub-category_id_seq";
CREATE SEQUENCE "sub-category_id_seq" INCREMENT  MINVALUE  MAXVALUE  START 1 CACHE ;

CREATE TABLE "public"."sub_category" (
    "id" integer DEFAULT nextval('"sub-category_id_seq"') NOT NULL,
    "name" character varying(255) NOT NULL,
    "sub_caegory_id" integer NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "user_data_set";
DROP SEQUENCE IF EXISTS user_data_set_id_seq;
CREATE SEQUENCE user_data_set_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."user_data_set" (
    "id" integer DEFAULT nextval('user_data_set_id_seq') NOT NULL,
    "date" character varying(155) NOT NULL,
    "time" character varying(155) NOT NULL,
    "user_id" integer NOT NULL,
    "product_id" integer NOT NULL,
    "intrest_point" integer NOT NULL
) WITH (oids = false);

INSERT INTO "user_data_set" ("id", "date", "time", "user_id", "product_id", "intrest_point") VALUES
(1,	'1/2/2023',	'12:12:12',	5,	1,	30),
(2,	'1/2/2023',	'12:12:12',	3,	3,	100),
(3,	'1/2/2023',	'12:12:12',	2,	7,	40),
(4,	'1/2/2023',	'12:12:12',	1,	3,	50),
(5,	'2/2/2023',	'12:12:12',	12,	9,	60),
(6,	'2/2/2023',	'12:12:12',	4,	2,	10),
(7,	'2/2/2023',	'12:12:12',	6,	7,	40),
(8,	'3/3/2023',	'12:12:12',	2,	5,	40),
(9,	'3/3/2023',	'12:12:12',	34,	3,	30),
(10,	'3/3/2023',	'12:12:12',	78,	10,	10),
(11,	'3/3/2023',	'12:12:12',	123,	1,	10),
(12,	'4/3/2023',	'12:12:12',	1234,	6,	60),
(13,	'4/3/2023',	'12:12:12',	45,	3,	70),
(14,	'5/3/2023',	'12:12:12',	67,	7,	20),
(15,	'5/3/2023',	'12:12:12',	89,	5,	40),
(16,	'5/3/2023',	'12:12:12',	9,	9,	60),
(17,	'5/3/2023',	'12:12:12',	65,	2,	100),
(18,	'5/3/2023',	'12:12:12',	33,	5,	30),
(19,	'6/3/2023',	'12:12:12',	223,	8,	70),
(20,	'6/3/2023',	'12:12:12',	44,	6,	80),
(21,	'7/3/2023',	'12:12:12',	553,	4,	20),
(22,	'7/3/2023',	'12:12:12',	324,	3,	40),
(23,	'7/3/2023',	'12:12:12',	2434,	7,	50),
(24,	'7/3/2023',	'12:12:12',	23445,	2,	50),
(25,	'7/3/2023',	'12:12:12',	25435,	4,	100),
(26,	'7/3/2023',	'12:12:12',	246,	10,	10),
(27,	'8/3/2023',	'12:12:12',	45,	9,	60),
(28,	'8/3/2023',	'12:12:12',	2342,	9,	40),
(29,	'8/3/2023',	'12:12:12',	234,	8,	50),
(30,	'8/3/2023',	'12:12:12',	234,	1,	70),
(31,	'8/3/2023',	'12:12:12',	343,	4,	80),
(32,	'8/3/2023',	'12:12:12',	324,	6,	10),
(33,	'8/3/2023',	'12:12:12',	346,	8,	90),
(34,	'8/3/2023',	'12:12:12',	234,	6,	60),
(35,	'8/3/2023',	'12:12:12',	232,	5,	80),
(36,	'8/3/2023',	'12:12:12',	4534,	3,	70),
(37,	'9/3/2023',	'12:12:12',	4564,	10,	50),
(38,	'9/3/2023',	'12:12:12',	565,	1,	10),
(39,	'9/3/2023',	'12:12:12',	786,	4,	70),
(40,	'9/3/2023',	'12:12:12',	897,	3,	40),
(41,	'9/3/2023',	'12:12:12',	97,	4,	20),
(42,	'9/3/2023',	'12:12:12',	867,	7,	30),
(43,	'9/3/2023',	'12:12:12',	6756,	8,	60),
(44,	'9/3/2023',	'12:12:12',	786,	6,	70),
(45,	'10/3/2023',	'12:12:12',	645,	4,	90),
(46,	'10/3/2023',	'12:12:12',	34,	6,	100),
(47,	'10/3/2023',	'12:12:12',	242,	8,	40),
(48,	'10/3/2023',	'12:12:12',	5675,	3,	10),
(49,	'10/3/2023',	'12:12:12',	5675,	3,	20),
(50,	'10/3/2023',	'12:12:12',	234235,	5,	40);

-- 2023-04-27 14:15:14.513556+05:30
