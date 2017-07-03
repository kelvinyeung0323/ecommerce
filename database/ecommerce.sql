CREATE TABLE `pd_brands` (
`ID` int NULL,
`cid` int NULL COMMENT '分类ID',
`cn_name` varchar(255) NULL COMMENT '品牌中文名',
`en_name` varchar(255) NULL COMMENT '品牌英文名',
`desc` varchar(255) NULL COMMENT '描述',
`logo` varchar(255) NULL COMMENT '品牌logo',
`status` varchar(255) NULL COMMENT '状态',
`official_link` varchar(255) NULL COMMENT '品牌官方地址',
`story` varchar(255) NULL COMMENT '品牌故事',
`create_time` datetime NULL ON UPDATE CURRENT_TIMESTAMP
)
COMMENT = '品牌系列表';

CREATE TABLE `pd_catalogs` (
`id` int(11) NOT NULL,
`name` varchar(255) NULL COMMENT '类目名称',
`parent_id` int(11) NULL COMMENT '类目父ID',
`is_parent` int(255) NULL COMMENT '是否父级 0 false 1 true',
`sort_order` int(11) NULL COMMENT '排序ID',
PRIMARY KEY (`id`) 
)
COMMENT = '类目表';

CREATE TABLE `pd_prop_keys` (
`pid` int(11) NOT NULL,
`name` varchar(255) NULL,
`cid` int(11) NULL,
`is_allow_alias` int(255) NULL COMMENT '是否允许别名 0 false 1 true',
`parent_pid` int(11) NULL COMMENT '父属性ID',
`is_color_prop` varchar(255) NULL COMMENT '是否颜属性',
`is_enum_prop` int NULL COMMENT '是否枚举性性',
`is_input_prop` varchar(255) NULL COMMENT '是否输入属性',
`is_key_prop` varchar(255) NULL COMMENT '是否关键属性true or false',
`is_sale_prop` varchar(255) NULL COMMENT '是否销售属性',
`is_item_prop` varchar(255) NULL COMMENT '是否商品属性',
`is_search` varchar(255) NULL,
`must` varchar(255) NULL COMMENT '是否必须',
`multi` varchar(255) NULL COMMENT '是否多选',
`status` varchar(255) NULL,
`sort_order` int(11) NULL,
`create_time` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`pid`) 
)
COMMENT = '属性键表';

CREATE TABLE `pd_prop_values` (
`vid` int(11) NOT NULL COMMENT '属性值ID',
`name` varchar(255) NULL COMMENT '属性值名',
`name_alias` varchar(255) NULL COMMENT '属性值别名',
`pid` int(11) NULL COMMENT '属性ID',
`status` int(255) NULL COMMENT '1 normal, 2 deleted',
`cid` int(11) NULL COMMENT '类目ID',
`sort_order` int(11) NULL,
`create_time` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`vid`) 
)
COMMENT = '属性值表';

CREATE TABLE `pd_products` (
`id` int(11) NOT NULL,
`name` varchar(255) NULL,
`brand_id` int(11) NULL,
`price` decimal(10,2) NULL,
`create_time` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`) 
)
COMMENT = '商品表';

CREATE TABLE `pd_product_images` (
`id` int(11) NOT NULL,
`img_link` varchar(255) NULL,
`product_id` int(11) NULL,
`img_location` varchar(255) NULL,
`is_default` int(255) NULL COMMENT '0 false 1 true',
`create_time` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`) 
)
COMMENT = '商品图片表';

CREATE TABLE `pd_product_sku` (
`sku_Id` int(11) NOT NULL,
`product_id` int(11) NULL,
`qty` int NULL COMMENT '数量',
`price` decimal(10,2) NULL COMMENT '价格',
`sn_no` int(11) NULL COMMENT '外部编码',
`status` int(255) NULL COMMENT '状态:1上架，2下架，3删除',
`sku_name` varchar(255) NULL COMMENT 'SKU名称',
`prop_string` varchar(255) NULL COMMENT '属性字符串',
`BarCode` varchar(255) NULL COMMENT '条形码',
`product_code` varchar(255) NULL,
`create_time` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`sku_Id`) 
)
COMMENT = 'SKU表';

CREATE TABLE `pd_prop_key_values` (
`id` int(11) NOT NULL,
`product_id` int(11) NULL COMMENT '商品id',
`prop_key_id` int(11) NULL COMMENT '属性ID',
`prop_value_id` int(255) NULL COMMENT '属性值ID',
`is_sku` int(255) NULL COMMENT '0 false 1 true',
`sku_id` int(11) NULL,
`create_time` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`) 
)
COMMENT = '属性键值表';

CREATE TABLE `pd_spec_tpls` (
`ID` int NULL,
`cid` int NULL COMMENT '类目ID',
`spec_tpl` text NULL COMMENT '参数数据,json格式',
`create_at` date NULL,
`update_at` date NULL
)
COMMENT = '商品规格参数';

CREATE TABLE `pd_product_specs` (
`id` int(11) NOT NULL,
`sku_id` int NULL,
`specs` text NULL,
`create_at` date NULL,
`update_at` date NULL,
PRIMARY KEY (`id`) 
)
COMMENT = '商品规格
';


ALTER TABLE `pd_prop_keys` ADD CONSTRAINT `fk_pd_prop_keys_pd_prop_keys_1` FOREIGN KEY (`cid`) REFERENCES `pd_catalogs` (`id`);
ALTER TABLE `pd_prop_values` ADD CONSTRAINT `fk_pd_prop_values_pd_prop_keys_1` FOREIGN KEY (`pid`) REFERENCES `pd_prop_keys` (`pid`);
ALTER TABLE `pd_prop_key_values` ADD CONSTRAINT `fk_pd_prop_key_value_pd_products_1` FOREIGN KEY (`prop_key_id`) REFERENCES `pd_products` (`id`);
ALTER TABLE `pd_product_images` ADD CONSTRAINT `fk_pro_product_images_pd_products_1` FOREIGN KEY (`product_id`) REFERENCES `pd_products` (`id`);
ALTER TABLE `pd_prop_key_values` ADD CONSTRAINT `fk_pd_prop_key_value_pd_prop_values_1` FOREIGN KEY (`prop_key_id`) REFERENCES `pd_prop_values` (`pid`);
ALTER TABLE `pd_product_sku` ADD CONSTRAINT `fk_pd_product_sku_pd_products_1` FOREIGN KEY (`product_id`) REFERENCES `pd_products` (`id`);
ALTER TABLE `pd_catalogs` ADD CONSTRAINT `fk_pd_catalog_pd_brand_1` FOREIGN KEY (`id`) REFERENCES `pd_brands` (`cid`);
ALTER TABLE `pd_product_specs` ADD CONSTRAINT `fk_pd_product_specs_pd_product_sku_1` FOREIGN KEY (`sku_id`) REFERENCES `pd_product_sku` (`sku_Id`);
ALTER TABLE `pd_spec_tpls` ADD CONSTRAINT `fk_pd_spec_tpls_pd_catalogs_1` FOREIGN KEY (`cid`) REFERENCES `pd_catalogs` (`id`);

