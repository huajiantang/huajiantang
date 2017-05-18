DROP DATABASE IF EXISTS `flower`;


CREATE DATABASE IF NOT EXISTS `flower`;

--用户表
CREATE TABLE IF NOT EXISTS `flower_user`(
	`user_id` int(11) unsigned not null auto_increment primary key,
	`user_name` char(50) not null check(user_name !=''),
	`user_sex` enum('1','2') not null default '1' COMMENT '1：男,2：女',
	`wechat_openid` int(11) not null,
	`wechat_nickname` varchar(255) not null,
	`wechat_avatar` varchar(255) not null,
	`wechat_province` varchar(255) not null,
	`wechat_city` varchar(255) not null,
	`phone` int(25) unsigned default null ,
	`password` varchar(25) default null,
	`reg_ip` varchar(11) not null,
	`reg_time` int(11) not null，
	`integral`  int(11) default null comment '积分',
	`receive_address` varchar(255) default null '收货地址'
)engine=InnoDB DEFAULT CHARSET=utf8;

-- 订单表
CREATE TABLE IF NOT EXISTS `flower_user_order`(
	`id` int(11) unsigned not null auto_increment primary key,
	`user_id` int(11) not null,
	`product_id` int(11) not null comment '商品id',
	`receive_address` varchar(255) not null comment '收货地址',
	`receive_phone_call` int(11) not null,
	`email_code` int(6) default null,
	`add_time` int(11) not null,
	`coupon_id` int(11) default null comment '优惠券id',
	`is_paid` tinyint(1) default 0 comment '是否支付',
	`is_send` tinyint(1) default 0 comment '是否发货',
	`is_succeed` tinyint(1) default 0 comment '交易成功',
	`express_id` int(11) not null comment '物流id'
)engine=InnoDB DEFAULT CHARSET=utf8;

--购物车
CREATE TABLE IF NOT EXISTS `flower_user_shopcar`(
	`id` int(11) unsigned not null auto_increment primary key,
	`user_id` int(11) not null,
	`product_id` int(11) not null,
	`produce_num` int(11) not null default 1,
	`product_price` float(11) not null,
	`add_time` int(11) not null,
	`is_deleted` tinyint(1) default 0,
	`is_paid` tinyint(1) default 0
)engine=InnoDB DEFAULT CHARSET=utf8;



--物流
CREATE TABLE  IF NOT EXISTS `flower_user_express`(
	`express_id` int(11) unsigned not null auto_increment primary key,
	`express_name` varchar(255) not null unique COMMENT '圆通..',
	`comment`  varchar(255) default null comment '备注',
	`add_time` int(11) not null,
	`is_disabled` tinyint(1) not null default 0
)engine=MyIsam default CHARSET=utf8;

--我的会员卡
CREATE TABLE IF NOT EXISTS `flower_user_clubcard`(
	`card_id` int(11) unsigned not null auto_increment primary key,
	`title` varchar(255) default null,
	`content` varchar(255) default null comment '内容',
	`add_time` int(11) not null,
	`start_time` int(11) not null,
	`end_time` int(11) not null,
	`status` tinyint(1) default 0 comment '状态'
)engine=InnoDB default CHARSET=utf8;


--我的优惠卷
CREATE TABLE IF NOT EXISTS `flower_user_coupon`(
	`coupon_id` int(11) unsigned not null auto_increment primary key,
	`coupon_name` varchar(255) not null,
	`coupon_type` enum(1,2,3) not null default 1 comment '1:无门槛 ，2:满减',
	`coupon_price` float(11) not null comment '100',
	`coupon_max_price` float(11) default null comment '500  500-100',
	`start_time` int(11) not null,
	`end_time` int(11) not null,
	`is_used` tinyint(1) not null default 0,
	`used_time` int(11) not null
)engine=InnoDB default CHARSET=utf8;



--admin
CREATE TABLE IF NOT EXISTS `flower_admin` (
	`id` int(11) unsigned not null auto_increment primary key,
	`admin_name` varchar(255) not null,
	`password` varchar(255) not null,
	`salt` char(50) not null,
	`role` tinyint(1) not null default 1,
	`reg_ip` char(50) not null,
	`reg_time`  int(11) not  null,
	`is_disabled` tinyint(1) not null default 0,
	`is_deleted` tinyint(1) not null default 0
)engine=InnoDB default CHARSET=utf8;


-- MySQL Script generated by MySQL Workbench
-- Sun May 14 17:11:24 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '产品表\n',
  `name` VARCHAR(120) NOT NULL COMMENT '产品名称',
  `price` FLOAT(10,2) NOT NULL,
  `intro` VARCHAR(45) NOT NULL COMMENT '详情',
  `market_price` FLOAT(10,2) NOT NULL COMMENT '市场价格',
  `mont_num` TINYINT(1) NOT NULL COMMENT '一个月多少束',
  `type` TINYINT(1) NULL COMMENT '产品类型',
  `freight` TINYINT(3) NULL COMMENT '运费',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product_banner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product_banner` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT(11) NULL,
  `image` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '产品图片表—详情轮播';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

