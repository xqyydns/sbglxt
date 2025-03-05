-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.34 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 导出  表 syssbglxt.abandon 结构
CREATE TABLE IF NOT EXISTS `abandon` (
  `id` int NOT NULL COMMENT '编号',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型',
  `equipName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '设备名',
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '型号',
  `quantity` int NOT NULL COMMENT '数量',
  `uniqueCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标准码',
  `abandonDate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日期',
  `state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '待审核' COMMENT '审核中，审核不通过，审核通过'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='设备报废表';

-- 正在导出表  syssbglxt.abandon 的数据：~12 rows (大约)
INSERT INTO `abandon` (`id`, `type`, `equipName`, `model`, `quantity`, `uniqueCode`, `abandonDate`, `state`) VALUES
	(1, '1', '1', '1', 1, '1', '2024-01-13   19:10', '审核通过'),
	(3, '实验用品', '烧杯', '江玻', 3, '111119419341', '2024-01-13 19:29', '审核通过'),
	(4, '实验用品', '量杯', '惠利得', 5, '358110453408', '2024-01-13 19:20', '审核通过'),
	(5, '实验用品', '培养皿', '江玻', 30, '496968755714', '2024-01-13 19:35', '审核通过'),
	(6, '实验用品', '酒精灯', '香波', 1, '796400146664', '2024-01-13 19:35', '审核通过'),
	(7, '实验用品', '烧杯', '江玻', 4, '633690983472', '2024-01-13 20:00', '审核通过'),
	(8, '实验用品', '玻璃滴定管', '8LABSHARK', 1, '113721191073', '2024-01-13 20:00', '审核通过'),
	(9, '实验用品', '锥形瓶', '江玻', 2, '301071265701', '2024-01-17 11:42', '审核通过'),
	(10, '实验用品', '移液器', 'BKMAMLAB', 2, '617986526061', '2024-01-17 11:42', '审核通过'),
	(11, '实验用品', '缓冲液', '比克曼', 2, '428615504280', '2023-08-11 11:11', '审核通过'),
	(12, '实验用品', '培养皿', '垒固', 4, '817472290817', '', '审核不通过'),
	(13, '实验用品', '量杯', '惠利得', 1, '213335100552', '2024-01-18 10:52', '审核通过'),
	(99, '实验用品', 'ph计', '海斯迪克', 2, '831578252293', '2024-01-19 11:44', '审核通过');

-- 导出  表 syssbglxt.apply 结构
CREATE TABLE IF NOT EXISTS `apply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型',
  `deviceName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '设备名',
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '型号',
  `onePrice` int NOT NULL COMMENT '单价',
  `quantity` int NOT NULL COMMENT '数量',
  `expirationDate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '保质期',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '负责人',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备图片',
  `time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '申请时间',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '待审核' COMMENT '待审核，审核不通过，审核通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='申请添加表';

-- 正在导出表  syssbglxt.apply 的数据：~6 rows (大约)
INSERT INTO `apply` (`id`, `type`, `deviceName`, `model`, `onePrice`, `quantity`, `expirationDate`, `user`, `img`, `time`, `state`) VALUES
	(1, '实验用品', '一次性棉棒', '江玻', 1, 100, '30天', 'zzz', 'http://localhost:9090/file/45e5b87240054f35928c624a2da6b862.jpg', '2024-01-13 13:51', '审核通过'),
	(2, '实验用品', '玻璃滴定管', 'LABSHARK', 61, 50, '30天', 'admin', 'http://localhost:9090/file/45e5b87240054f35928c624a2da6b862.jpg', '2024-01-12 19:52', '待审核'),
	(3, '实验用品', '霉菌培养箱', 'SPX-460B', 5770, 1, '2年', 'zzz', 'http://localhost:9090/file/45e5b87240054f35928c624a2da6b862.jpg', '2024-01-13 13:48', '待审核'),
	(4, '实验用品', '计量杯', '惠利得', 14, 50, '30天', 'zzz', 'http://localhost:9090/file/45e5b87240054f35928c624a2da6b862.jpg', '2024-01-13 13:52', '待审核'),
	(5, '实验用品', '塑料漏斗', 'YIKEYI', 1, 50, '30天', 'zzz', 'http://localhost:9090/file/45e5b87240054f35928c624a2da6b862.jpg', '2024-01-13 13:49', '审核通过'),
	(6, '实验用品', '玻璃蓝盖', '蜀牛', 3, 50, '30天', 'admin', 'http://localhost:9090/file/45e5b87240054f35928c624a2da6b862.jpg', '2024-01-12 16:05', '审核通过'),
	(27, '实验用品', '烧杯', '江玻', 7, 50, '保修两年', 'mms', 'http://localhost:9090/file/2a8bd5b42bb94beba61bcdc5916a7ce6.png', '2024-01-13 21:50', '审核不通过'),
	(28, '实验用品', '培养皿', '江玻', 13, 50, '2年保修', 'mms', 'http://localhost:9090/file/d174e30f90754c31ae8fd812d0bd4ff7.jfif', '2024-01-18 10:58', '审核通过'),
	(29, '实验用品', '酒精', '99%', 25, 50, '7天', 'mms', NULL, '2024-01-20 13:39', '审核不通过'),
	(30, '实验用品', '擦镜纸', '比克曼', 17, 50, '30天', 'mujie', 'http://localhost:9090/file/ba738d096584418eb413118850eb9287.png', '2024-02-25 12:12', '审核通过');

-- 导出  表 syssbglxt.device 结构
CREATE TABLE IF NOT EXISTS `device` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类别',
  `deviceName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备名称',
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '型号',
  `onePrice` double(10,2) DEFAULT NULL COMMENT '单价',
  `quantity` int DEFAULT NULL COMMENT '数量',
  `buyDate` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '购买日期',
  `uniqueCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expirationDate` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '保质期',
  `user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '经办人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='设备管理表';

-- 正在导出表  syssbglxt.device 的数据：~19 rows (大约)
INSERT INTO `device` (`id`, `type`, `deviceName`, `model`, `onePrice`, `quantity`, `buyDate`, `uniqueCode`, `expirationDate`, `user`) VALUES
	(1, '实验用品', '吸水纸', '比克曼', 2.90, 50, '2024-01-13 23:09:46', '574597722421', '30天', 'admin'),
	(2, '实验器械', '真空过滤装置', 'JOANLAB', 158.00, 30, '2024-01-13 23:10:36', '808922115793', '30天', 'admin'),
	(3, '实验用品', '酒精灯', '香波', 3.80, 200, '2024-01-13 23:14:26', '359774018094', '30天', 'admin'),
	(4, '实验用品', '稀盐酸', 'XCY', 28.00, 40, '2024-01-13 23:15:16', '373519783004', '2年', 'admin'),
	(5, '实验器械', '离心机', 'JOANLAB', 779.00, 4, '2024-01-13 23:19:09', '650416701463', '1年', 'admin'),
	(6, '实验用品', 'ph计', '海斯迪克', 29.00, 9, '2024-01-17 14:28:19', '054762136273', '30天', 'admin'),
	(7, '实验器械', '台式酸度计', '雷磁', 918.00, 6, '2024-01-17 14:31:24', '879674684001', '2年', 'admin'),
	(8, '实验器械', '搅拌器', '群安', 99.00, 4, '2024-01-17 14:40:27', '565462516353', '30天', 'admin'),
	(9, '实验器械', '旋转蒸发仪', '尚仪', 2052.00, 5, '2024-01-17 14:42:04', '124265496409', '2年', 'admin'),
	(10, '实验用品', '工业酒精', '西陇', 20.00, 50, '2024-01-17 15:06:09', '430921843970', '2年', 'admin'),
	(11, '实验用品', '封口膜', '比克曼', 9.90, 100, '2024-01-17 15:22:47', '815021122929', '30天', 'admin'),
	(12, '实验器械', '量筒', '江玻', 17.80, 100, '2024-01-17 15:23:16', '014253101241', '30天', 'admin'),
	(13, '实验器械', '培养皿', '江玻', 7.70, 55, '2024-01-17 15:26:09', '191535848949', '2年保修', 'admin'),
	(14, '实验器械', '托盘', '江玻', 12.40, 60, '2024-01-12 16:16:41', '874784304961', '2年保修', 'admin'),
	(15, '实验用品', '滤纸', '比克曼', 6.25, 100, '2024-01-13 20:30:17', '611068229344', '2年保修', 'admin'),
	(16, '实验器械', '量杯', '惠利得', 9.00, 50, '2024-01-13 20:32:27', '337264333030', '30天', 'admin'),
	(21, '实验用品', '一次性手套', '英科', 0.20, 200, '2024-01-13 22:35:34', '545975401620', '7天', 'admin'),
	(22, '实验器械', '烧杯', '江玻', 4.50, 30, '2024-01-17 16:00:38', '077151016402', '7天', 'admin'),
	(26, '实验器械', '实验室工作台', '爱迪生1.0', 3259.00, 6, '2024-01-17 17:00:38', '205733219251', '1年保修', 'admin');

-- 导出  表 syssbglxt.notice 结构
CREATE TABLE IF NOT EXISTS `notice` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布人',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面',
  `type` int DEFAULT NULL COMMENT '1-简单的公告，2富文本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='公告表';

-- 正在导出表  syssbglxt.notice 的数据：~2 rows (大约)
INSERT INTO `notice` (`id`, `name`, `content`, `time`, `user`, `img`, `type`) VALUES
	(9, '测试标题', '<p>测试内容</p>', '2024-01-13 15:38:53', '管理员', 'http://localhost:9090/file/8e4fe8ab422c423a924ff7cca85fc336.png', 2),
	(10, '测试-', '<p>😚测试表情<br/></p>', '2024-01-13 15:40:11', '管理员', 'http://localhost:9090/file/2a8bd5b42bb94beba61bcdc5916a7ce6.png', 2),
	(11, '--测试', '<h1 id="ug4rg"><i><u><font color="#c24f4a">H1加粗斜体带下划线红色</font></u></i></h1><p><a target="_blank" href="https://yz.chsi.com.cn/" style="font-weight: normal;">中国研究生招生信息网</a>&nbsp; （链接）</p><ol><li><strike></strike>大盘鸡<br/></li><li>王婆大虾</li><li>比格&nbsp; &nbsp; &nbsp; &nbsp;（ 有序列表 ）</li></ol><p><span contenteditable="false"><input type="checkbox"/></span>&nbsp; 待办事项</p><blockquote><p>懒惰行动得如此缓慢，贫穷很快就能超过它。——富兰克林&nbsp; &nbsp; &nbsp;（引用）<br/></p></blockquote><p>😀&nbsp; 表情<br/></p><p data-we-empty-p="" style="text-align:center;">5*5 表格</p><table border="0" width="100%" cellpadding="0" cellspacing="0"><tbody><tr><th>id</th><th>设备名</th><th>型号</th><th>价格</th><th>数量</th></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;华为</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mate60</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6000&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1</td></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;iphone</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6000</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1</td></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Xiaomi</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pad6</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2000</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1</td></tr><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;vivo</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IQOO neo5</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1500</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1</td></tr></tbody></table><pre style="text-align:left;"><p><br/></p><p>插入代码：</p><code class="Java">  public static void main(String[] args) {\n    System.out.println("插入代码");\n  }<br/></code></pre><p><br/></p>分割线&nbsp;<hr/>', '2024-01-13 15:59:45', '管理员', 'http://localhost:9090/file/9209797e459445a7b014f6d33c8d089b.png', 2);

-- 导出  表 syssbglxt.repair 结构
CREATE TABLE IF NOT EXISTS `repair` (
  `fixDate` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修理日期',
  `deviceName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备名',
  `id` int NOT NULL COMMENT '编号',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别',
  `uniqueCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标准码',
  `money` double(10,2) NOT NULL COMMENT '修理费用',
  `responsib` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '责任人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='设备修理表';

-- 正在导出表  syssbglxt.repair 的数据：~5 rows (大约)
INSERT INTO `repair` (`fixDate`, `deviceName`, `id`, `type`, `uniqueCode`, `money`, `responsib`) VALUES
	('2024-01-13', '清洗机', 1, '实验器械', '562992029241', 184.00, '老王'),
	('2023-08-11', '戴尔g15 5511', 2, '笔记本', '409769498791', 200.00, '小刚'),
	('2024-01-13', 'mate60', 3, '手机', '299777716641', 87.50, '小强'),
	('2023-01-11', '安吉尔', 5, '饮水机', '434848137755', 300.00, '校长'),
	('2023-05-26', '美利达', 4, '自行车', '726346240032', 100.00, '小王');

-- 导出  表 syssbglxt.sys_dict 结构
CREATE TABLE IF NOT EXISTS `sys_dict` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='el图形字典表';

-- 正在导出表  syssbglxt.sys_dict 的数据：~280 rows (大约)
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`) VALUES
	(1, 'user', 'el-icon-user', 'icon'),
	(2, 'house', 'el-icon-house', 'icon'),
	(3, 'menu', 'el-icon-menu', 'icon'),
	(4, 's-custom', 'el-icon-s-custom', 'icon'),
	(5, 's-grid', 'el-icon-s-grid', 'icon'),
	(6, 'document', 'el-icon-document', 'icon'),
	(7, 'coffee', 'el-icon-coffee\r\n', 'icon'),
	(8, 's-marketing', 'el-icon-s-marketing', 'icon'),
	(9, 'phone-outline', 'el-icon-phone-outline', 'icon'),
	(10, 'platform-eleme', 'el-icon-platform-eleme', 'icon'),
	(11, 'eleme', 'el-icon-eleme', 'icon'),
	(12, 'delete-solid', 'el-icon-delete-solid', 'icon'),
	(13, 'delete', 'el-icon-delete', 'icon'),
	(14, 's-tools', 'el-icon-s-tools', 'icon'),
	(15, 'setting', 'el-icon-setting', 'icon'),
	(16, 'user-solid', 'el-icon-user-solid', 'icon'),
	(17, 'phone', 'el-icon-phone', 'icon'),
	(18, 'more', 'el-icon-more', 'icon'),
	(19, 'more-outline', 'el-icon-more-outline', 'icon'),
	(20, 'star-on', 'el-icon-star-on', 'icon'),
	(21, 'star-off', 'el-icon-star-off', 'icon'),
	(22, 's-goods', 'el-icon-s-goods', 'icon'),
	(23, 'goods', 'el-icon-goods', 'icon'),
	(24, 'warning', 'el-icon-warning', 'icon'),
	(25, 'warning-outline', 'el-icon-warning-outline', 'icon'),
	(26, 'question', 'el-icon-question', 'icon'),
	(27, 'info', 'el-icon-info', 'icon'),
	(28, 'remove', 'el-icon-remove', 'icon'),
	(29, 'circle-plus', 'el-icon-circle-plus', 'icon'),
	(30, 'success', 'el-icon-success', 'icon'),
	(31, 'error', 'el-icon-error', 'icon'),
	(32, 'zoom-in', 'el-icon-zoom-in', 'icon'),
	(33, 'zoom-out', 'el-icon-zoom-out', 'icon'),
	(34, 'remove-outline', 'el-icon-remove-outline', 'icon'),
	(35, 'circle-plus-outline', 'el-icon-circle-plus-outline', 'icon'),
	(36, 'circle-check', 'el-icon-circle-check', 'icon'),
	(37, 'circle-close', 'el-icon-circle-close', 'icon'),
	(38, 's-help', 'el-icon-s-help', 'icon'),
	(39, 'help', 'el-icon-help', 'icon'),
	(40, 'minus', 'el-icon-minus', 'icon'),
	(41, 'plus', 'el-icon-plus', 'icon'),
	(42, 'check', 'el-icon-check', 'icon'),
	(43, 'close', 'el-icon-close', 'icon'),
	(44, 'picture', 'el-icon-picture', 'icon'),
	(45, 'picture-outline', 'el-icon-picture-outline', 'icon'),
	(46, 'picture-outline-round', 'el-icon-picture-outline-round', 'icon'),
	(47, 'upload', 'el-icon-upload', 'icon'),
	(48, 'upload2', 'el-icon-upload2', 'icon'),
	(49, 'download', 'el-icon-download', 'icon'),
	(50, 'camera-solid', 'el-icon-camera-solid', 'icon'),
	(51, 'camera', 'el-icon-camera', 'icon'),
	(52, 'video-camera-solid', 'el-icon-video-camera-solid', 'icon'),
	(53, 'video-camera', 'el-icon-video-camera', 'icon'),
	(54, 'message-solid', 'el-icon-message-solid', 'icon'),
	(55, 'bell', 'el-icon-bell', 'icon'),
	(56, 's-cooperation', 'el-icon-s-cooperation', 'icon'),
	(57, 's-order', 'el-icon-s-order', 'icon'),
	(58, 's-platform', 'el-icon-s-platform', 'icon'),
	(59, 's-fold', 'el-icon-s-fold', 'icon'),
	(60, 's-unfold', 'el-icon-s-unfold', 'icon'),
	(61, 's-operation', 'el-icon-s-operation', 'icon'),
	(62, 's-promotion', 'el-icon-s-promotion', 'icon'),
	(63, 's-home', 'el-icon-s-home', 'icon'),
	(64, 's-release', 'el-icon-s-release', 'icon'),
	(65, 's-ticket', 'el-icon-s-ticket', 'icon'),
	(66, 's-management', 'el-icon-s-management', 'icon'),
	(67, 's-open', 'el-icon-s-open', 'icon'),
	(68, 's-shop', 'el-icon-s-shop', 'icon'),
	(69, 's-flag', 'el-icon-s-flag', 'icon'),
	(70, 's-comment', 'el-icon-s-comment', 'icon'),
	(71, 's-finance', 'el-icon-s-finance', 'icon'),
	(72, 's-claim', 'el-icon-s-claim', 'icon'),
	(73, 's-opportunity', 'el-icon-s-opportunity', 'icon'),
	(74, 's-data', 'el-icon-s-data', 'icon'),
	(75, 's-check', 'el-icon-s-check', 'icon'),
	(76, 'share', 'el-icon-share', 'icon'),
	(77, 'd-caret', 'el-icon-d-caret', 'icon'),
	(78, 'caret-left', 'el-icon-caret-left', 'icon'),
	(79, 'caret-right', 'el-icon-caret-right', 'icon'),
	(80, 'caret-bottom', 'el-icon-caret-bottom', 'icon'),
	(81, 'caret-top', 'el-icon-caret-top', 'icon'),
	(82, 'bottom-left', 'el-icon-bottom-left', 'icon'),
	(83, 'bottom-right', 'el-icon-bottom-right', 'icon'),
	(84, 'back', 'el-icon-back', 'icon'),
	(85, 'right', 'el-icon-right', 'icon'),
	(86, 'bottom', 'el-icon-bottom', 'icon'),
	(87, 'top', 'el-icon-top', 'icon'),
	(88, 'top-left', 'el-icon-top-left', 'icon'),
	(89, 'top-right', 'el-icon-top-right', 'icon'),
	(90, 'arrow-left', 'el-icon-arrow-left', 'icon'),
	(91, 'arrow-right', 'el-icon-arrow-right', 'icon'),
	(92, 'arrow-down', 'el-icon-arrow-down', 'icon'),
	(93, 'arrow-up', 'el-icon-arrow-up', 'icon'),
	(94, 'd-arrow-left', 'el-icon-d-arrow-left', 'icon'),
	(95, 'd-arrow-right', 'el-icon-d-arrow-right', 'icon'),
	(96, 'video-pause', 'el-icon-video-pause', 'icon'),
	(97, 'video-play', 'el-icon-video-play', 'icon'),
	(98, 'refresh', 'el-icon-refresh', 'icon'),
	(99, 'refresh-right', 'el-icon-refresh-right', 'icon'),
	(100, 'refresh-left', 'el-icon-refresh-left', 'icon'),
	(101, 'finished', 'el-icon-finished', 'icon'),
	(102, 'sort', 'el-icon-sort', 'icon'),
	(103, 'sort-up', 'el-icon-sort-up', 'icon'),
	(104, 'sort-down', 'el-icon-sort-down', 'icon'),
	(105, 'rank', 'el-icon-rank', 'icon'),
	(106, 'loading', 'el-icon-loading', 'icon'),
	(107, 'view', 'el-icon-view', 'icon'),
	(108, 'c-scale-to-original', 'el-icon-c-scale-to-original', 'icon'),
	(109, 'date', 'el-icon-date', 'icon'),
	(110, 'edit', 'el-icon-edit', 'icon'),
	(111, 'edit-outline', 'el-icon-edit-outline', 'icon'),
	(112, 'folder', 'el-icon-folder', 'icon'),
	(113, 'folder-opened', 'el-icon-folder-opened', 'icon'),
	(114, 'folder-add', 'el-icon-folder-add', 'icon'),
	(115, 'folder-remove', 'el-icon-folder-remove', 'icon'),
	(116, 'folder-delete', 'el-icon-folder-delete', 'icon'),
	(117, 'folder-checked', 'el-icon-folder-checked', 'icon'),
	(118, 'tickets', 'el-icon-tickets', 'icon'),
	(119, 'document-remove', 'el-icon-document-remove', 'icon'),
	(120, 'document-delete', 'el-icon-document-delete', 'icon'),
	(121, 'document-copy', 'el-icon-document-copy', 'icon'),
	(122, 'document-checked', 'el-icon-document-checked', 'icon'),
	(123, 'document-add', 'el-icon-document-add', 'icon'),
	(124, 'printer', 'el-icon-printer', 'icon'),
	(125, 'paperclip', 'el-icon-paperclip', 'icon'),
	(126, 'takeaway-box', 'el-icon-takeaway-box', 'icon'),
	(127, 'search', 'el-icon-search', 'icon'),
	(128, 'monitor', 'el-icon-monitor', 'icon'),
	(129, 'attract', 'el-icon-attract', 'icon'),
	(130, 'mobile', 'el-icon-mobile', 'icon'),
	(131, 'scissors', 'el-icon-scissors', 'icon'),
	(132, 'umbrella', 'el-icon-umbrella', 'icon'),
	(133, 'headset', 'el-icon-headset', 'icon'),
	(134, 'brush', 'el-icon-brush', 'icon'),
	(135, 'mouse', 'el-icon-mouse', 'icon'),
	(136, 'coordinate', 'el-icon-coordinate', 'icon'),
	(137, 'magic-stick', 'el-icon-magic-stick', 'icon'),
	(138, 'reading', 'el-icon-reading', 'icon'),
	(139, 'data-line', 'el-icon-data-line', 'icon'),
	(140, 'data-board', 'el-icon-data-board', 'icon'),
	(141, 'pie-chart', 'el-icon-pie-chart', 'icon'),
	(142, 'data-analysis', 'el-icon-data-analysis', 'icon'),
	(143, 'collection-tag', 'el-icon-collection-tag', 'icon'),
	(144, 'film', 'el-icon-film', 'icon'),
	(145, 'suitcase', 'el-icon-suitcase', 'icon'),
	(146, 'suitcase-1', 'el-icon-suitcase-1', 'icon'),
	(147, 'receiving', 'el-icon-receiving', 'icon'),
	(148, 'collection', 'el-icon-collection', 'icon'),
	(149, 'files', 'el-icon-files', 'icon'),
	(150, 'notebook-1', 'el-icon-notebook-1', 'icon'),
	(151, 'notebook-2', 'el-icon-notebook-2', 'icon'),
	(152, 'toilet-paper', 'el-icon-toilet-paper', 'icon'),
	(153, 'office-building', 'el-icon-office-building', 'icon'),
	(154, 'school', 'el-icon-school', 'icon'),
	(155, 'table-lamp', 'el-icon-table-lamp', 'icon'),
	(156, 'no-smoking', 'el-icon-no-smoking', 'icon'),
	(157, 'smoking', 'el-icon-smoking', 'icon'),
	(158, 'shopping-cart-full', 'el-icon-shopping-cart-full', 'icon'),
	(159, 'shopping-cart-1', 'el-icon-shopping-cart-1', 'icon'),
	(160, 'shopping-cart-2', 'el-icon-shopping-cart-2', 'icon'),
	(161, 'shopping-bag-1', 'el-icon-shopping-bag-1', 'icon'),
	(162, 'shopping-bag-2', 'el-icon-shopping-bag-2', 'icon'),
	(163, 'sold-out', 'el-icon-sold-out', 'icon'),
	(164, 'sell', 'el-icon-sell', 'icon'),
	(165, 'present', 'el-icon-present', 'icon'),
	(166, 'box', 'el-icon-box', 'icon'),
	(167, 'bank-card', 'el-icon-bank-card', 'icon'),
	(168, 'money', 'el-icon-money', 'icon'),
	(169, 'coin', 'el-icon-coin', 'icon'),
	(170, 'wallet', 'el-icon-wallet', 'icon'),
	(171, 'discount', 'el-icon-discount', 'icon'),
	(172, 'price-tag', 'el-icon-price-tag', 'icon'),
	(173, 'news', 'el-icon-news', 'icon'),
	(174, 'guide', 'el-icon-guide', 'icon'),
	(175, 'male', 'el-icon-male', 'icon'),
	(176, 'female', 'el-icon-female', 'icon'),
	(177, 'thumb', 'el-icon-thumb', 'icon'),
	(178, 'cpu', 'el-icon-cpu', 'icon'),
	(179, 'link', 'el-icon-link', 'icon'),
	(180, 'connection', 'el-icon-connection', 'icon'),
	(181, 'open', 'el-icon-open', 'icon'),
	(182, 'turn-off', 'el-icon-turn-off', 'icon'),
	(183, 'set-up', 'el-icon-set-up', 'icon'),
	(184, 'chat-round', 'el-icon-chat-round', 'icon'),
	(185, 'chat-line-round', 'el-icon-chat-line-round', 'icon'),
	(186, 'chat-square', 'el-icon-chat-square', 'icon'),
	(187, 'chat-dot-round', 'el-icon-chat-dot-round', 'icon'),
	(188, 'chat-dot-square', 'el-icon-chat-dot-square', 'icon'),
	(189, 'chat-line-square', 'el-icon-chat-line-square', 'icon'),
	(190, 'message', 'el-icon-message', 'icon'),
	(191, 'postcard', 'el-icon-postcard', 'icon'),
	(192, 'position', 'el-icon-position', 'icon'),
	(193, 'turn-off-microphone', 'el-icon-turn-off-microphone', 'icon'),
	(194, 'microphone', 'el-icon-microphone', 'icon'),
	(195, 'close-notification', 'el-icon-close-notification', 'icon'),
	(196, 'bangzhu', 'el-icon-bangzhu', 'icon'),
	(197, 'time', 'el-icon-time', 'icon'),
	(198, 'odometer', 'el-icon-odometer', 'icon'),
	(199, 'crop', 'el-icon-crop', 'icon'),
	(200, 'aim', 'el-icon-aim', 'icon'),
	(201, 'switch-button', 'el-icon-switch-button', 'icon'),
	(202, 'full-screen', 'el-icon-full-screen', 'icon'),
	(203, 'copy-document', 'el-icon-copy-document', 'icon'),
	(204, 'mic', 'el-icon-mic', 'icon'),
	(205, 'stopwatch', 'el-icon-stopwatch', 'icon'),
	(206, 'medal-1', 'el-icon-medal-1', 'icon'),
	(207, 'medal', 'el-icon-medal', 'icon'),
	(208, 'trophy', 'el-icon-trophy', 'icon'),
	(209, 'trophy-1', 'el-icon-trophy-1', 'icon'),
	(210, 'first-aid-kit', 'el-icon-first-aid-kit', 'icon'),
	(211, 'discover', 'el-icon-discover', 'icon'),
	(212, 'place', 'el-icon-place', 'icon'),
	(213, 'location', 'el-icon-location', 'icon'),
	(214, 'location-outline', 'el-icon-location-outline', 'icon'),
	(215, 'location-information', 'el-icon-location-information', 'icon'),
	(216, 'add-location', 'el-icon-add-location', 'icon'),
	(217, 'delete-location', 'el-icon-delete-location', 'icon'),
	(218, 'map-location', 'el-icon-map-location', 'icon'),
	(219, 'alarm-clock', 'el-icon-alarm-clock', 'icon'),
	(220, 'timer', 'el-icon-timer', 'icon'),
	(221, 'watch-1', 'el-icon-watch-1', 'icon'),
	(222, 'watch', 'el-icon-watch', 'icon'),
	(223, 'lock', 'el-icon-lock', 'icon'),
	(224, 'unlock', 'el-icon-unlock', 'icon'),
	(225, 'key', 'el-icon-key', 'icon'),
	(226, 'service', 'el-icon-service', 'icon'),
	(227, 'mobile-phone', 'el-icon-mobile-phone', 'icon'),
	(228, 'bicycle', 'el-icon-bicycle', 'icon'),
	(229, 'truck', 'el-icon-truck', 'icon'),
	(230, 'ship', 'el-icon-ship', 'icon'),
	(231, 'basketball', 'el-icon-basketball', 'icon'),
	(232, 'football', 'el-icon-football', 'icon'),
	(233, 'soccer', 'el-icon-soccer', 'icon'),
	(234, 'baseball', 'el-icon-baseball', 'icon'),
	(235, 'wind-power', 'el-icon-wind-power', 'icon'),
	(236, 'light-rain', 'el-icon-light-rain', 'icon'),
	(237, 'lightning', 'el-icon-lightning', 'icon'),
	(238, 'heavy-rain', 'el-icon-heavy-rain', 'icon'),
	(239, 'sunrise', 'el-icon-sunrise', 'icon'),
	(240, 'sunrise-1', 'el-icon-sunrise-1', 'icon'),
	(241, 'sunset', 'el-icon-sunset', 'icon'),
	(242, 'sunny', 'el-icon-sunny', 'icon'),
	(243, 'cloudy', 'el-icon-cloudy', 'icon'),
	(244, 'partly-cloudy', 'el-icon-partly-cloudy', 'icon'),
	(245, 'cloudy-and-sunny', 'el-icon-cloudy-and-sunny', 'icon'),
	(246, 'moon', 'el-icon-moon', 'icon'),
	(247, 'moon-night', 'el-icon-moon-night', 'icon'),
	(248, 'dish', 'el-icon-dish', 'icon'),
	(249, 'dish-1', 'el-icon-dish-1', 'icon'),
	(250, 'food', 'el-icon-food', 'icon'),
	(251, 'chicken', 'el-icon-chicken', 'icon'),
	(252, 'fork-spoon', 'el-icon-fork-spoon', 'icon'),
	(253, 'knife-fork', 'el-icon-knife-fork', 'icon'),
	(254, 'burger', 'el-icon-burger', 'icon'),
	(255, 'tableware', 'el-icon-tableware', 'icon'),
	(256, 'sugar', 'el-icon-sugar', 'icon'),
	(257, 'dessert', 'el-icon-dessert', 'icon'),
	(258, 'ice-cream', 'el-icon-ice-cream', 'icon'),
	(259, 'hot-water', 'el-icon-hot-water', 'icon'),
	(260, 'water-cup', 'el-icon-water-cup', 'icon'),
	(261, 'coffee-cup', 'el-icon-coffee-cup', 'icon'),
	(262, 'cold-drink', 'el-icon-cold-drink', 'icon'),
	(263, 'goblet', 'el-icon-goblet', 'icon'),
	(264, 'goblet-full', 'el-icon-goblet-full', 'icon'),
	(265, 'goblet-square', 'el-icon-goblet-square', 'icon'),
	(266, 'goblet-square-full', 'el-icon-goblet-square-full', 'icon'),
	(267, 'refrigerator', 'el-icon-refrigerator', 'icon'),
	(268, 'grape', 'el-icon-grape', 'icon'),
	(269, 'watermelon', 'el-icon-watermelon', 'icon'),
	(270, 'cherry', 'el-icon-cherry', 'icon'),
	(271, 'apple', 'el-icon-apple', 'icon'),
	(272, 'pear', 'el-icon-pear', 'icon'),
	(273, 'orange', 'el-icon-orange', 'icon'),
	(274, 'ice-tea', 'el-icon-ice-tea', 'icon'),
	(275, 'ice-drink', 'el-icon-ice-drink', 'icon'),
	(276, 'milk-tea', 'el-icon-milk-tea', 'icon'),
	(277, 'potato-strips', 'el-icon-potato-strips', 'icon'),
	(278, 'lollipop', 'el-icon-lollipop', 'icon'),
	(279, 'ice-cream-square', 'el-icon-ice-cream-square', 'icon'),
	(280, 'ice-cream-round', 'el-icon-ice-cream-round', 'icon');

-- 导出  表 syssbglxt.sys_file 结构
CREATE TABLE IF NOT EXISTS `sys_file` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='文件表';

-- 正在导出表  syssbglxt.sys_file 的数据：~12 rows (大约)
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES
	(1, 'lufei.jpg', 'jpg', 76, 'http://localhost:9090/file/3b45e315a68943cc9123d4c51f607cd7.jpg', '02571394b041fd090e4c6fbeb60a8ecd', 1, 1),
	(2, 'lufei2.jpg', 'jpg', 94, 'http://localhost:9090/file/45e5b87240054f35928c624a2da6b862.jpg', '99ec8f01b53d02f25dce73f25740ee2d', 0, 1),
	(3, '6a17c887d6054e798c9c88f4ca76f932.jpg', 'jpg', 492, 'http://localhost:9090/file/a7cf1fb317df42dd8c86d7ea18be73d1.jpg', 'c97be9e12e32384b9dde48a0a985b75d', 0, 1),
	(4, '4eb52f1463ec497cbfee99ece5c07c23.png', 'png', 2114, 'http://localhost:9090/file/8e4fe8ab422c423a924ff7cca85fc336.png', '385f4438953d30a7a70653c4c7dad093', 0, 1),
	(5, 'lufei1.jpg', 'jpg', 217, 'http://localhost:9090/file/c44e10d321e741d9b3dc3b176f30ab99.jpg', '7aaf05a62798a994672935b040905f89', 0, 1),
	(6, '8e4fe8ab422c423a924ff7cca85fc336.png', 'png', 2114, 'http://localhost:9090/file/8e4fe8ab422c423a924ff7cca85fc336.png', '385f4438953d30a7a70653c4c7dad093', 0, 1),
	(7, '45e5b87240054f35928c624a2da6b862.jpg', 'jpg', 94, 'http://localhost:9090/file/45e5b87240054f35928c624a2da6b862.jpg', '99ec8f01b53d02f25dce73f25740ee2d', 0, 1),
	(8, 'b5c0868ca09e45ebacbab57bd4423d35.jpg', 'jpg', 5840, 'http://localhost:9090/file/f2d0e7992c0e45e389dc4d8f7aa9f411.jpg', 'd92327a4facb9eb1e06c0093e80d5552', 0, 1),
	(9, '8e4fe8ab422c423a924ff7cca85fc336.png', 'png', 2114, 'http://localhost:9090/file/8e4fe8ab422c423a924ff7cca85fc336.png', '385f4438953d30a7a70653c4c7dad093', 0, 0),
	(10, '45e5b87240054f35928c624a2da6b862.jpg', 'jpg', 94, 'http://localhost:9090/file/45e5b87240054f35928c624a2da6b862.jpg', '99ec8f01b53d02f25dce73f25740ee2d', 0, 1),
	(50, '4eb52f1463ec497cbfee99ece5c07c23.png', 'png', 2114, 'http://localhost:9090/file/8e4fe8ab422c423a924ff7cca85fc336.png', '385f4438953d30a7a70653c4c7dad093', 0, 1),
	(51, '4eb52f1463ec497cbfee99ece5c07c23.png', 'png', 2114, 'http://localhost:9090/file/8e4fe8ab422c423a924ff7cca85fc336.png', '385f4438953d30a7a70653c4c7dad093', 0, 1),
	(52, '45296e9c1c30425c9865fc35df9533ff.png', 'png', 2025, 'http://localhost:9090/file/2a8bd5b42bb94beba61bcdc5916a7ce6.png', '63bbdb5b76b8d349ad35ff4281efbd37', 0, 1),
	(53, 'be0906d922464f1c8585d232bc712a05.png', 'png', 272, 'http://localhost:9090/file/9209797e459445a7b014f6d33c8d089b.png', '7fe90391e81dbd5eedd7df38036e6a44', 0, 1),
	(54, '2a8bd5b42bb94beba61bcdc5916a7ce6.png', 'png', 2025, 'http://localhost:9090/file/2a8bd5b42bb94beba61bcdc5916a7ce6.png', '63bbdb5b76b8d349ad35ff4281efbd37', 0, 1),
	(55, 'OIP-C.jfif', 'jfif', 17, 'http://localhost:9090/file/d174e30f90754c31ae8fd812d0bd4ff7.jfif', '95143cb36649bbb034debb898feba6e5', 0, 1),
	(56, '未标题-1.png', 'png', 70, 'http://localhost:9090/file/ba738d096584418eb413118850eb9287.png', 'c1c4dc7cd06d82eeefe984b4244eabe0', 0, 1);

-- 导出  表 syssbglxt.sys_menu 结构
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `pid` int DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '页面路径',
  `sort_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='菜单表';

-- 正在导出表  syssbglxt.sys_menu 的数据：~16 rows (大约)
INSERT INTO `sys_menu` (`id`, `name`, `path`, `icon`, `description`, `pid`, `page_path`, `sort_num`) VALUES
	(4, '系统管理', NULL, 'el-icon-s-grid', NULL, NULL, NULL, 201),
	(5, '用户管理', '/user', 'el-icon-user', NULL, 4, 'User', 301),
	(6, '角色管理', '/role', 'el-icon-s-custom', NULL, 4, 'Role', 302),
	(7, '菜单管理', '/menu', 'el-icon-menu', NULL, 4, 'Menu', 303),
	(8, '文件管理', '/file', 'el-icon-document', NULL, 4, 'File', 304),
	(10, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home', 0),
	(15, '设备信息', '', 'el-icon-shopping-bag-1', NULL, NULL, '', 200),
	(16, '设备管理', '/device', 'el-icon-collection-tag', NULL, 15, 'Device', NULL),
	(19, '设备报废', '/abandon', 'el-icon-coffee\r\n', NULL, 15, 'Abandon', NULL),
	(23, '设备分类添加', '/categoryAdd', 'el-icon-circle-plus', NULL, 22, 'CategoryAdd', NULL),
	(24, '设备分类列表', '/catagoryList', 'el-icon-date', NULL, 22, 'CategoryList', NULL),
	(27, '设备添加', '/equipAdd', 'el-icon-circle-plus', NULL, 26, 'EquipAdd', NULL),
	(28, '设备列表', '/equipList', 'el-icon-document', NULL, 26, 'EquipList', NULL),
	(33, '申请购买', '/apply', 'el-icon-circle-plus', NULL, 15, 'Apply', NULL),
	(34, '设备修理', '/repair', 'el-icon-refresh', NULL, 15, 'Repair', NULL),
	(60, '公告信息', '/notice', 'el-icon-message', NULL, NULL, 'Notice', 600);

-- 导出  表 syssbglxt.sys_role 结构
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='权限划分表';

-- 正在导出表  syssbglxt.sys_role 的数据：~3 rows (大约)
INSERT INTO `sys_role` (`id`, `name`, `description`, `flag`) VALUES
	(1, '管理员', '管理员', 'ROLE_ADMIN'),
	(8, '普通学生', '学生', 'ROLE_STUDENT');

-- 导出  表 syssbglxt.sys_role_menu 结构
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单关系表（用于区分不同权限的不同页面）';

-- 正在导出表  syssbglxt.sys_role_menu 的数据：~31 rows (大约)
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 8),
	(1, 10),
	(1, 15),
	(1, 16),
	(1, 19),
	(1, 33),
	(1, 34),
	(1, 60),
	(6, 4),
	(6, 5),
	(6, 6),
	(6, 7),
	(6, 8),
	(6, 10),
	(6, 15),
	(6, 16),
	(6, 19),
	(6, 33),
	(6, 34),
	(8, 4),
	(8, 8),
	(8, 10),
	(8, 15),
	(8, 16),
	(8, 19),
	(8, 33),
	(8, 34);

-- 导出  表 syssbglxt.sys_user 结构
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- 正在导出表  syssbglxt.sys_user 的数据：~4 rows (大约)
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `role`) VALUES
	(1, 'admin', 'admin', '管理员', '222222222@qq.com', '19935441736', '明向', '2024-01-09 07:10:27', 'http://localhost:9090/file/493b61ea9bbb400b94ef5e928832bdd5.PNG', 'ROLE_ADMIN'),
	(14, 'zzz', '123', 'zzz', '3310305943@qq.com', NULL, '上海', '2024-01-09 11:26:51', NULL, 'ROLE_STUDENT'),
	(15, 'test', '202cb962ac59075b964b07152d234b70', 'cbx', '111111111@qq.com', '', '南极洲', '2024-01-12 04:12:32', NULL, 'ROLE_STUDENT'),
	(22, 'mms', '123', 'mms', '2162246325@qq.com', NULL, NULL, '2024-01-19 03:41:22', NULL, 'ROLE_STUDENT'),
	(23, 'mujie', 'mujie', 'mujie', '1029072090@qq.com', NULL, NULL, '2024-02-25 04:09:12', NULL, 'ROLE_STUDENT'),
	(24, 'test', 'test', 'test', '2418097466@qq.com', NULL, NULL, '2025-03-05 13:42:54', NULL, 'ROLE_STUDENT');

-- 导出  表 syssbglxt.validation 结构
CREATE TABLE IF NOT EXISTS `validation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '验证码',
  `type` int DEFAULT NULL COMMENT '验证类型',
  `time` timestamp NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='验证码表';

-- 正在导出表  syssbglxt.validation 的数据：~4 rows (大约)
INSERT INTO `validation` (`id`, `email`, `code`, `type`, `time`) VALUES
	(17, '3310305943@qq.com', '9179', 2, '2024-01-17 14:37:15'),
	(18, '3310305943@qq.com', '7548', 1, '2024-01-17 14:40:14'),
	(19, '2162246325@qq.com', '3280', 2, '2024-01-19 01:56:25'),
	(22, '2162246325@qq.com', '5617', 1, '2024-01-19 03:46:46'),
	(23, '1029072090@qq.com', '3775', 1, '2024-02-25 04:14:30'),
	(24, '2418097466@qq.com', '5277', 1, '2025-03-05 13:48:30');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
