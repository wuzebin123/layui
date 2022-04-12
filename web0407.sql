/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : web0407

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-04-10 19:05:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin_info
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_info`;
CREATE TABLE "t_admin_info" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "f_admin_name" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理员名称',
  "f_admin_head" varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '',
  "f_admin_login" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理员登录密码账号',
  "f_admin_pwd" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理员登录密码',
  "f_admin_login_count" int(11) DEFAULT NULL COMMENT '登录次数',
  "f_status" int(1) DEFAULT 1 COMMENT '状态   1正常   0异常',
  "f_last_login_ip" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最后登录ip',
  "f_last_login_time" datetime DEFAULT NULL COMMENT '最后登录时间',
  "f_time" datetime DEFAULT current_timestamp() COMMENT '添加时间',
  "f_update_time" datetime DEFAULT NULL COMMENT '修改信息时间',
  PRIMARY KEY ("id")
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_admin_info
-- ----------------------------
INSERT INTO `t_admin_info` VALUES ('1', '武则斌', 'images/head/202cb962ac59075b964b07152d234b70.jpg', 'admin', '21232f297a57a5a743894a0e4a801fc3', null, '1', '192.168.1.42', '2022-04-10 13:11:12', '2022-04-07 11:14:43', null);

-- ----------------------------
-- Table structure for t_anchor
-- ----------------------------
DROP TABLE IF EXISTS `t_anchor`;
CREATE TABLE "t_anchor" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "f_user_id" bigint(10) DEFAULT 0 COMMENT 'user_id',
  "f_kwai_id" varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '快手ID',
  "f_head" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  "f_name" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  "f_sex" varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '性别  F 女  M 男',
  "f_region_name" varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '地区',
  "f_autograph" varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '签名',
  "f_money" double(12,1) DEFAULT 0.0 COMMENT '礼物金额',
  "f_liveimg1" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '直播图1',
  "f_liveimg2" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '直播图2',
  "f_liveimg3" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '直播图3',
  "f_status" int(1) DEFAULT 0 COMMENT '是否符合 1符合  0不符合',
  "f_time" datetime DEFAULT current_timestamp() COMMENT '添加时间',
  "f_update_time" datetime DEFAULT current_timestamp() COMMENT '更新时间',
  PRIMARY KEY ("id"),
  UNIQUE KEY "f_user_id" ("f_user_id") USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9949 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_anchor
-- ----------------------------
INSERT INTO `t_anchor` VALUES ('9803', '7360098', 'xiaobin707', 'http://p1.a.yximgs.com/uhead/AB/2020/10/21/15/BMjAyMDEwMjExNTU1MTZfNzM2MDA5OF8yX2hkMTUxXzEzMw==_s.jpg', '才艺小彬', 'M', '', '感谢您的关注\n每晚七点半直播', '4551.0', 'https://live4.static.yximgs.com/live/game/screenshot/A_AnUf2VhyE~1649567799135~1', 'https://live2.static.yximgs.com/live/game/screenshot/A_AnUf2VhyE~1649567293916~1', null, '0', '2022-04-10 13:08:13', '2022-04-10 13:16:39');
INSERT INTO `t_anchor` VALUES ('9804', '664298294', 'lyf664298294', 'http://tx6.a.kwimgs.com/uhead/AB/2022/03/02/17/BMjAyMjAzMDIxNzU4NDlfNjY0Mjk4Mjk0XzJfaGQyODZfNDI5_s.jpg', '黑米《段子手》', 'M', '', '兴趣爱好:', '4474.0', 'https://live3.static.yximgs.com/live/game/screenshot/yIpZM-Z5GUY~1649567799208~1', 'https://live4.static.yximgs.com/live/game/screenshot/yIpZM-Z5GUY~1649567293978~1', null, '0', '2022-04-10 13:08:13', '2022-04-10 13:16:39');
INSERT INTO `t_anchor` VALUES ('9805', '2500309838', '', 'http://p4.a.yximgs.com/uhead/AB/2021/12/14/09/BMjAyMTEyMTQwOTEwMjBfMjUwMDMwOTgzOF8yX2hkODhfOTA4_s.jpg', '海佛123321', 'F', '', '谢谢你的关注', '2891.0', 'https://live2.static.yximgs.com/live/game/screenshot/Hn4uncOVOuM~1649567799372~1', 'https://live3.static.yximgs.com/live/game/screenshot/Hn4uncOVOuM~1649567294033~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:39');
INSERT INTO `t_anchor` VALUES ('9806', '1636102323', 'X85237606', 'http://p2.a.yximgs.com/uhead/AB/2020/06/02/22/BMjAyMDA2MDIyMjQzMjdfMTYzNjEwMjMyM18yX2hkMzk3XzI4MQ==_s.jpg', '南关黑子', 'M', '', '中午12：00，晚上9：00两场直播，不主动+微不要红包，小店诚信第一，不接收恶意差评。\n主播亲身经历讲过往江湖事\n  感谢快手    感恩有你', '2122.0', 'https://live1.static.yximgs.com/live/game/screenshot/kFYkdSpNPbk~1649567799447~1', 'https://live1.static.yximgs.com/live/game/screenshot/kFYkdSpNPbk~1649567294089~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:39');
INSERT INTO `t_anchor` VALUES ('9807', '1470350258', '', 'http://p4.a.yximgs.com/uhead/AB/2022/02/04/17/BMjAyMjAyMDQxNzU4MjhfMTQ3MDM1MDI1OF8xX2hkNTA4Xzc3NQ==_s.jpg', 'SL新星才艺女团09', 'F', '', '', '3714.0', 'https://live1.static.yximgs.com/live/game/screenshot/C_3JpsaNWik~1649567799282~1', 'https://live2.static.yximgs.com/live/game/screenshot/C_3JpsaNWik~1649567294144~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:39');
INSERT INTO `t_anchor` VALUES ('9808', '1197010715', '', 'http://p2.a.yximgs.com/uhead/AB/2019/10/12/13/BMjAxOTEwMTIxMzM1MDlfMTE5NzAxMDcxNV8yX2hkODUwXzg4MQ==_s.jpg', '山西华姐夫', 'M', '', '山西省晋中市昔阳县', '1302.0', 'https://live3.static.yximgs.com/live/game/screenshot/6cMTM3BV0Vk~1649567799675~1', 'https://live1.static.yximgs.com/live/game/screenshot/6cMTM3BV0Vk~1649567294204~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:39');
INSERT INTO `t_anchor` VALUES ('9809', '511648284', 'fangnan1111', 'http://tx6.a.kwimgs.com/uhead/AB/2021/09/21/13/BMjAyMTA5MjExMzU2MjFfNTExNjQ4Mjg0XzJfaGQ4MzZfNTAz_s.jpg', 'LOL云顶之弈—方南', 'M', '', '每早8点直播\n赏金专场局局三星五费！(声法第一人)\n合作+v2040303131', '962.0', 'https://live4.static.yximgs.com/live/game/screenshot/J9zG7tMfCmQ~1649567800151~1', 'https://live3.static.yximgs.com/live/game/screenshot/J9zG7tMfCmQ~1649567294264~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:40');
INSERT INTO `t_anchor` VALUES ('9810', '889678301', 'hu889688301', 'http://p2.a.yximgs.com/uhead/AB/2021/09/07/23/BMjAyMTA5MDcyMzU3NDFfODg5Njc4MzAxXzJfaGQ0MzBfOTA=_s.jpg', '山西农民歌2', 'M', '', '兴趣爱好:唱歌！虽然歌唱的不是十分好，但是每次唱歌我都是用心去唱！感谢朋友们的关注和支持！！！！！！', '811.0', 'https://live1.static.yximgs.com/live/game/screenshot/Om24MjNZRWo~1649567800574~1', 'https://live3.static.yximgs.com/live/game/screenshot/Om24MjNZRWo~1649567294326~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:40');
INSERT INTO `t_anchor` VALUES ('9811', '1944123413', '', 'http://p2.a.yximgs.com/uhead/AB/2020/05/22/12/BMjAyMDA1MjIxMjA4MjRfMTk0NDEyMzQxM18xX2hkNzlfNTM=_s.jpg', '可爱的慧儿', 'F', '', '河南商丘市\n喜欢我就关注我', '757.0', 'https://live3.static.yximgs.com/live/game/screenshot/ngrV3AW17fQ~1649567800669~1', 'https://live3.static.yximgs.com/live/game/screenshot/ngrV3AW17fQ~1649567294388~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:40');
INSERT INTO `t_anchor` VALUES ('9812', '1402674400', '', 'http://p2.a.yximgs.com/uhead/AB/2022/04/03/05/BMjAyMjA0MDMwNTM2MjVfMTQwMjY3NDQwMF8yX2hkNzJfMjkw_s.jpg', '爱笑的《钰儿》', 'F', '', '我是农村人，喜欢歌声，用心唱歌，遇见更快乐的自己\n感恩快手感恩遇见，谢谢每一位支持我的人，也感谢那个一直不离不弃陪伴着我的那个你', '1215.0', 'https://live1.static.yximgs.com/live/game/screenshot/5rwM19UsMgo~1649567799748~1', 'https://live1.static.yximgs.com/live/game/screenshot/5rwM19UsMgo~1649567294462~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:39');
INSERT INTO `t_anchor` VALUES ('9813', '600045529', '', 'http://p2.a.yximgs.com/uhead/AB/2022/03/30/10/BMjAyMjAzMzAxMDUwMjBfNjAwMDQ1NTI5XzJfaGQzMzVfODU3_s.jpg', '好亲的猪猪3.1', 'F', '', '', '1710.0', 'https://live3.static.yximgs.com/live/game/screenshot/b0LWvhBIVfI~1649567799523~1', 'https://live2.static.yximgs.com/live/game/screenshot/b0LWvhBIVfI~1649567294524~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:39');
INSERT INTO `t_anchor` VALUES ('9814', '833745078', 'liu833745078', 'http://tx6.a.kwimgs.com/uhead/AB/2021/12/17/00/BMjAyMTEyMTcwMDQ0MTVfODMzNzQ1MDc4XzJfaGQ2OTRfMzY2_s.jpg', '放空自我华姐', 'F', '', '（找一个爱我的人）单身万岁，一个人挺累，\n你陪我一程，我伴你一生，\n白天不定时，晚上八点直播！', '558.0', 'https://live2.static.yximgs.com/live/game/screenshot/fzDywznzmiw~1649567801461~1', 'https://live2.static.yximgs.com/live/game/screenshot/fzDywznzmiw~1649567294578~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:41');
INSERT INTO `t_anchor` VALUES ('9815', '435409643', '', 'http://p4.a.yximgs.com/uhead/AB/2022/03/21/22/BMjAyMjAzMjEyMjAwMTJfNDM1NDA5NjQzXzFfaGQyNzVfODk1_s.jpg', '小七沓', 'F', '', '我承认我不是最好的，但我也敢肯定，我是你再也遇不到的……\n\n\n\n不定时直播  \n\n 希望你们陪我久一点', '522.0', 'https://live4.static.yximgs.com/live/game/screenshot/j26jKJbc8KU~1649567801619~1', 'https://live2.static.yximgs.com/live/game/screenshot/j26jKJbc8KU~1649567294639~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:41');
INSERT INTO `t_anchor` VALUES ('9816', '201665855', 'ZXLYHDYH', 'http://p4.a.yximgs.com/uhead/AB/2021/07/31/15/BMjAyMTA3MzExNTMwMzlfMjAxNjY1ODU1XzFfaGQ3NDlfNzM4_s.jpg', '一一小月亮', 'F', '', '我的2022一定很哇塞！', '508.0', 'https://live4.static.yximgs.com/live/game/screenshot/VHIxFs1dV-E~1649567294692~1', null, null, '0', '2022-04-10 13:08:14', '2022-04-10 13:08:14');
INSERT INTO `t_anchor` VALUES ('9817', '1195041276', '', 'http://tx6.a.kwimgs.com/uhead/AB/2022/04/06/08/BMjAyMjA0MDYwODM0MzlfMTE5NTA0MTI3Nl8yX2hkOTA4XzEy_s.jpg', '山西丫头', 'F', '', '', '1009.0', 'https://live2.static.yximgs.com/live/game/screenshot/wjvm1W4rqlI~1649567799883~1', 'https://live2.static.yximgs.com/live/game/screenshot/wjvm1W4rqlI~1649567294751~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:39');
INSERT INTO `t_anchor` VALUES ('9818', '1080640784', '', 'http://tx6.a.kwimgs.com/uhead/AB/2020/11/19/15/BMjAyMDExMTkxNTQ0NDZfMTA4MDY0MDc4NF8yX2hkNzI2XzUyNA==_s.jpg', '十字绣，钻石画648', 'F', '', '人和人相处，诚实善良是根本，我给你一颗真诚，你会给我一个信任，感恩每个遇见', '487.0', 'https://live3.static.yximgs.com/live/game/screenshot/UFfAUKSHY_w~1649567801839~1', 'https://live4.static.yximgs.com/live/game/screenshot/UFfAUKSHY_w~1649567294811~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:41');
INSERT INTO `t_anchor` VALUES ('9819', '383198838', '', 'http://p4.a.yximgs.com/uhead/AB/2022/03/05/03/BMjAyMjAzMDUwMzAxNThfMzgzMTk4ODM4XzJfaGQ5NzNfODE2_s.jpg', '荒芜世界', 'F', '', '其实人活着挺不易\n做什么哪有那么顺利啊\n越想要的越得不到\n放下了也许来到了。\n我想要我的世界，\n我的世界童话般的浪漫', '657.0', 'https://live1.static.yximgs.com/live/game/screenshot/sggKalaGgxg~1649567800999~1', 'https://live4.static.yximgs.com/live/game/screenshot/sggKalaGgxg~1649567294874~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:41');
INSERT INTO `t_anchor` VALUES ('9820', '1078973090', '', 'http://tx6.a.kwimgs.com/uhead/AB/2021/06/14/08/BMjAyMTA2MTQwODA0MDJfMTA3ODk3MzA5MF8yX2hkMTQzXzEwNg==_s.jpg', '丑妹晓丽', 'F', '', '兴趣爱好:喜欢唱歌，但不是专业歌手，传播正能量，，希望得到大家的支持和关注！！感谢快手为我们搭建的绿色平台！', '438.0', 'https://live2.static.yximgs.com/live/game/screenshot/OznrOpXP-_A~1649567802100~1', 'https://live3.static.yximgs.com/live/game/screenshot/OznrOpXP-_A~1649567294934~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:42');
INSERT INTO `t_anchor` VALUES ('9821', '592303544', '', 'http://p4.a.yximgs.com/uhead/AB/2019/04/20/14/BMjAxOTA0MjAxNDExNTRfNTkyMzAzNTQ0XzJfaGQyMzFfNDE4_s.jpg', '坚强的我170', 'F', '', '', '365.0', 'https://live4.static.yximgs.com/live/game/screenshot/oRZEFSKVkLs~1649567802364~1', 'https://live4.static.yximgs.com/live/game/screenshot/oRZEFSKVkLs~1649567294992~1', null, '0', '2022-04-10 13:08:14', '2022-04-10 13:16:42');
INSERT INTO `t_anchor` VALUES ('9822', '732160850', 'le236356', 'http://p4.a.yximgs.com/uhead/AB/2021/12/12/09/BMjAyMTEyMTIwOTAyNTBfNzMyMTYwODUwXzFfaGQ3NzNfOTUw_s.jpg', '男丫头（直播号）', 'F', '', '嗯.', '362.0', 'https://live1.static.yximgs.com/live/game/screenshot/dBhnJDTrDsc~1649567295044~1', null, null, '0', '2022-04-10 13:08:15', '2022-04-10 13:08:15');
INSERT INTO `t_anchor` VALUES ('9823', '1082963965', '', 'http://p4.a.yximgs.com/uhead/AB/2021/09/24/17/BMjAyMTA5MjQxNzA4MThfMTA4Mjk2Mzk2NV8xX2hkMzg3XzM3Mw==_s.jpg', '相遇4857', 'F', '', '寻找有缘人单身女人', '549.0', 'https://live1.static.yximgs.com/live/game/screenshot/-dwjHviXozk~1649567801537~1', 'https://live4.static.yximgs.com/live/game/screenshot/-dwjHviXozk~1649567295105~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:41');
INSERT INTO `t_anchor` VALUES ('9824', '1391931790', '', 'http://tx6.a.kwimgs.com/uhead/AB/2020/04/23/19/BMjAyMDA0MjMxOTM2MjRfMTM5MTkzMTc5MF8yX2hkMTAyXzY2OQ==_s.jpg', '牡丹迷人179', 'F', '', '感谢快手平台？让全国人民展示各种才艺', '360.0', 'https://live4.static.yximgs.com/live/game/screenshot/sgIWy1y6o3k~1649567802577~1', 'https://live1.static.yximgs.com/live/game/screenshot/sgIWy1y6o3k~1649567295165~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:42');
INSERT INTO `t_anchor` VALUES ('9825', '777803286', 'GPPN8888', 'http://tx6.a.kwimgs.com/uhead/AB/2022/02/28/15/BMjAyMjAyMjgxNTE3NTlfNzc3ODAzMjg2XzFfaGQ0MzFfNTYw_s.jpg', '高平胖妞（带货）', 'F', '', '近期不定时直播\n大概每天中午12点或者晚上8点\n最近比较忙，有事可留言', '363.0', 'https://live2.static.yximgs.com/live/game/screenshot/XKkIS3zvtqk~1649567802436~1', 'https://live3.static.yximgs.com/live/game/screenshot/XKkIS3zvtqk~1649567295222~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:42');
INSERT INTO `t_anchor` VALUES ('9826', '12961539', 'FF7777777777', 'http://p4.a.yximgs.com/uhead/AB/2017/12/06/15/BMjAxNzEyMDYxNTIwMjVfMTI5NjE1MzlfMV9oZDUyXzY4Nw==_s.jpg', '小虎牙.菲儿', 'F', '', '每天中午12点直播\n每天晚上8:30直播\n不会主动+微信或以任何方式索要红包\n既然关注了就不要取关……缘分让我们在这里相遇，请不要错过遇见，不要辜负缘分\n重要的人越来越少，留下来的越来越重要！\n感谢快手\n感谢官方', '338.0', 'https://live1.static.yximgs.com/live/game/screenshot/cLjnIPAq6H0~1649567802701~1', 'https://live2.static.yximgs.com/live/game/screenshot/cLjnIPAq6H0~1649567295275~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:42');
INSERT INTO `t_anchor` VALUES ('9827', '2306662570', '', 'http://p5.a.yximgs.com/uhead/AB/2022/01/26/17/BMjAyMjAxMjYxNzMyMTVfMjMwNjY2MjU3MF8xX2hkNDMxXzY2MA==_s.jpg', '爱唱歌的婷277', 'F', '', '一路的奔跑就为博得您的一个关注\n婷是一个喜欢唱歌，性格活泼开朗像你邻家小妹，感谢你的支持', '974.0', 'https://live4.static.yximgs.com/live/game/screenshot/b8bptsXfLhc~1649567800014~1', 'https://live1.static.yximgs.com/live/game/screenshot/b8bptsXfLhc~1649567295335~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:40');
INSERT INTO `t_anchor` VALUES ('9828', '385536300', 'jing385536300', 'http://p2.a.yximgs.com/uhead/AB/2022/03/23/16/BMjAyMjAzMjMxNjEyMjlfMzg1NTM2MzAwXzJfaGQzMDRfNTE3_s.jpg', '往后你可愿宠我', 'F', '', '兴趣爱好:听歌', '325.0', 'https://live2.static.yximgs.com/live/game/screenshot/0eQ10KtuAY0~1649567802824~1', 'https://live3.static.yximgs.com/live/game/screenshot/0eQ10KtuAY0~1649567295396~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:42');
INSERT INTO `t_anchor` VALUES ('9829', '1168202601', '', 'http://p2.a.yximgs.com/uhead/AB/2018/12/16/16/BMjAxODEyMTYxNjA3MzhfMTE2ODIwMjYwMV8yX2hkMjdfMjgy_s.jpg', '美好未来05885', 'M', '', '', '318.0', 'https://live4.static.yximgs.com/live/game/screenshot/Tq2QmPDNhEI~1649567802968~1', 'https://live2.static.yximgs.com/live/game/screenshot/Tq2QmPDNhEI~1649567295456~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:42');
INSERT INTO `t_anchor` VALUES ('9830', '2756855854', '', 'http://p4.a.yximgs.com/uhead/AB/2022/03/27/22/BMjAyMjAzMjcyMjMxMjdfMjc1Njg1NTg1NF8xX2hkMzYzXzg3Nw==_s.jpg', '单身果味纯氧', 'F', '', '谁喜欢我吱一声，我追你！', '322.0', 'https://live2.static.yximgs.com/live/game/screenshot/Zmypzhji3DA~1649567802896~1', 'https://live1.static.yximgs.com/live/game/screenshot/Zmypzhji3DA~1649567295517~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:42');
INSERT INTO `t_anchor` VALUES ('9831', '1448321685', 'fj-w----', 'http://tx6.a.kwimgs.com/uhead/AB/2021/10/23/07/BMjAyMTEwMjMwNzI4MTZfMTQ0ODMyMTY4NV8yX2hkMzUyXzU3_s.jpg', '佛-缘', 'F', '', '虎年吉祥如意！幸福安康！贵人相助！\n请帮助我谢谢！谢谢支持！', '302.0', 'https://live3.static.yximgs.com/live/game/screenshot/1t9si6Tbaj4~1649567803194~1', 'https://live3.static.yximgs.com/live/game/screenshot/1t9si6Tbaj4~1649567295572~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:43');
INSERT INTO `t_anchor` VALUES ('9832', '2342532385', '', 'http://tx6.a.kwimgs.com/uhead/AB/2022/03/07/11/BMjAyMjAzMDcxMTU5MjNfMjM0MjUzMjM4NV8yX2hkMTczXzI2_s.jpg', 'H.zy反派男主', 'M', '', '小哥哥+11769964\n语音交友厅\n二人世界 聊天互动 集体小游戏\n24小时开播', '600.0', 'https://live3.static.yximgs.com/live/game/screenshot/aPwdPOLT_Qw~1649567801244~1', 'https://live4.static.yximgs.com/live/game/screenshot/aPwdPOLT_Qw~1649567295633~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:41');
INSERT INTO `t_anchor` VALUES ('9833', '589533468', '', 'http://p5.a.yximgs.com/uhead/AB/2022/04/08/11/BMjAyMjA0MDgxMTMyMTdfNTg5NTMzNDY4XzJfaGQyNTdfNzcy_s.jpg', '冯建珍农村人', 'F', '', '感谢官方推送作品上热门，给了我们这么好的平台，在这个平台上认识了好多朋友，我是山西省，吕梁农村人，', '299.0', 'https://live1.static.yximgs.com/live/game/screenshot/MhcyO2GgSVk~1649567803540~1', 'https://live4.static.yximgs.com/live/game/screenshot/MhcyO2GgSVk~1649567295696~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:43');
INSERT INTO `t_anchor` VALUES ('9834', '440421643', '', 'http://p4.a.yximgs.com/uhead/AB/2022/03/16/08/BMjAyMjAzMTYwODE2MTJfNDQwNDIxNjQzXzJfaGQ1NjRfMjY3_s.jpg', '忘掉过去，期待（年红徒）', 'F', '', '爱玩', '298.0', 'https://live3.static.yximgs.com/live/game/screenshot/AI6StHTf6BU~1649567803612~1', 'https://live3.static.yximgs.com/live/game/screenshot/AI6StHTf6BU~1649567295750~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:43');
INSERT INTO `t_anchor` VALUES ('9835', '553066045', 'Y88YJF_201314qjf', 'http://p4.a.yximgs.com/uhead/AB/2022/04/05/00/BMjAyMjA0MDUwMDQ1NTRfNTUzMDY2MDQ1XzJfaGQzMV83NzI=_s.jpg', '同妞英英爱唱歌', 'F', '', '爱好唱歌，二人台，山曲，不求和人攀比《感谢大家》\n             \n\n         \n人生撑大了胃口，喂大了格局，希望我的余生能够遇到最好的，加油！', '297.0', 'https://live1.static.yximgs.com/live/game/screenshot/6AG6aGO65ig~1649567803868~1', 'https://live4.static.yximgs.com/live/game/screenshot/6AG6aGO65ig~1649567295807~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:43');
INSERT INTO `t_anchor` VALUES ('9836', '2000605511', '', 'http://p2.a.yximgs.com/uhead/AB/2022/03/10/02/BMjAyMjAzMTAwMjI4MDhfMjAwMDYwNTUxMV8yX2hkMTQ5Xzg0OQ==_s.jpg', '最靓 女友', 'M', '', '正能量娱乐直播间，每天中午十二点开播，晚十一点准时开播！都是成年人了严谨私下金钱往来，禁止未成年人刷礼物，感谢快手平台！', '6385.0', 'https://live2.static.yximgs.com/live/game/screenshot/y34IJy8xXvo~1649567799060~1', 'https://live3.static.yximgs.com/live/game/screenshot/y34IJy8xXvo~1649567295868~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:39');
INSERT INTO `t_anchor` VALUES ('9837', '2832852445', '', 'http://p4.a.yximgs.com/uhead/AB/2022/04/07/22/BMjAyMjA0MDcyMjU2MzBfMjgzMjg1MjQ0NV8yX2hkNTk5XzI1Mg==_s.jpg', 'Yx众里寻她你的女友', 'F', '', '', '251.0', 'https://live2.static.yximgs.com/live/game/screenshot/G_yscQnv7gU~1649567804147~1', 'https://live2.static.yximgs.com/live/game/screenshot/G_yscQnv7gU~1649567295929~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9838', '1168947202', '', 'http://p2.a.yximgs.com/uhead/AB/2021/10/30/16/BMjAyMTEwMzAxNjU3MDZfMTE2ODk0NzIwMl8yX2hkODIwXzUxOA==_s.jpg', '丽蛋', 'F', '', '感谢快手平台！ \n感谢遇到可爱的你们！\n风里雨里每天中午二点直播晚上九点半直播！等你们哟', '248.0', 'https://live3.static.yximgs.com/live/game/screenshot/vti5FKiHGh8~1649567804218~1', 'https://live1.static.yximgs.com/live/game/screenshot/vti5FKiHGh8~1649567295989~1', null, '0', '2022-04-10 13:08:15', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9839', '306497676', 'aoe518421', 'http://tx6.a.kwimgs.com/uhead/AB/2022/03/19/02/BMjAyMjAzMTkwMjUxNTlfMzA2NDk3Njc2XzJfaGQyNjJfOTcx_s.jpg', '吕梁老五:', 'M', '', '三十年河东，三十年河西！', '439.0', 'https://live3.static.yximgs.com/live/game/screenshot/1SmwaT8FJjg~1649567802025~1', 'https://live4.static.yximgs.com/live/game/screenshot/1SmwaT8FJjg~1649567296047~1', null, '0', '2022-04-10 13:08:16', '2022-04-10 13:16:42');
INSERT INTO `t_anchor` VALUES ('9840', '1495453835', 'p123456789wxy', 'http://p2.a.yximgs.com/uhead/AB/2022/03/01/21/BMjAyMjAzMDEyMTQ1NDZfMTQ5NTQ1MzgzNV8yX2hkNzQzXzQ3Nw==_s.jpg', '＠森屿初夏＠$＠', 'F', '', '本人喜欢安静', '213.0', 'https://live4.static.yximgs.com/live/game/screenshot/2Hj20beOKjo~1649567805111~1', 'https://live4.static.yximgs.com/live/game/screenshot/2Hj20beOKjo~1649567296108~1', null, '0', '2022-04-10 13:08:16', '2022-04-10 13:16:45');
INSERT INTO `t_anchor` VALUES ('9841', '1383586926', '', 'http://p2.a.yximgs.com/uhead/AB/2021/12/25/14/BMjAyMTEyMjUxNDM4MDZfMTM4MzU4NjkyNl8yX2hkOTEzXzc5Mg==_s.jpg', '朵颜521', 'F', '', '感谢所有支持过我的家人们，只等一人，每晚8点直播，才艺跳舞', '240.0', 'https://live2.static.yximgs.com/live/game/screenshot/Q2ScIp3fw8k~1649567804427~1', 'https://live4.static.yximgs.com/live/game/screenshot/Q2ScIp3fw8k~1649567296169~1', null, '0', '2022-04-10 13:08:16', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9842', '1319426603', '', 'http://p2.a.yximgs.com/uhead/AB/2022/01/14/18/BMjAyMjAxMTQxODQ3MThfMTMxOTQyNjYwM18yX2hkNzQ2XzI5NA==_s.jpg', '燕子飞《单身》999', 'F', '', '喜欢听歌 ，唱歌，跳舞', '215.0', 'https://live1.static.yximgs.com/live/game/screenshot/aBTMblicAk4~1649567805044~1', 'https://live3.static.yximgs.com/live/game/screenshot/aBTMblicAk4~1649567296229~1', null, '0', '2022-04-10 13:08:16', '2022-04-10 13:16:45');
INSERT INTO `t_anchor` VALUES ('9843', '1449396951', '', 'http://p4.a.yximgs.com/uhead/AB/2022/01/12/18/BMjAyMjAxMTIxODM4MjVfMTQ0OTM5Njk1MV8yX2hkMjQ3XzYwMw==_s.jpg', '幸福的平果', 'M', '', '', '218.0', 'https://live1.static.yximgs.com/live/game/screenshot/_wAbtIqwNfY~1649567804916~1', 'https://live4.static.yximgs.com/live/game/screenshot/_wAbtIqwNfY~1649567296290~1', null, '0', '2022-04-10 13:08:16', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9844', '472718234', 'XH392088', 'http://p2.a.yximgs.com/uhead/AB/2022/04/07/21/BMjAyMjA0MDcyMTEzMDhfNDcyNzE4MjM0XzJfaGQ5NDBfODIy_s.jpg', '慧兒oo', 'U', '', '念别人的好，修自己的心。', '208.0', 'https://live4.static.yximgs.com/live/game/screenshot/x4R7DFXFrN8~1649567296351~1', null, null, '0', '2022-04-10 13:08:16', '2022-04-10 13:08:16');
INSERT INTO `t_anchor` VALUES ('9845', '770773981', '', 'http://tx6.a.kwimgs.com/uhead/AB/2022/03/23/13/BMjAyMjAzMjMxMzU0NDNfNzcwNzczOTgxXzFfaGQ1NTNfODk2_s.jpg', '琳奴奴', 'F', '', '奴奴喜欢唱歌跳舞，纯属业余爱好。', '209.0', 'https://live4.static.yximgs.com/live/game/screenshot/E7XBKhXmdNc~1649567805433~1', 'https://live3.static.yximgs.com/live/game/screenshot/E7XBKhXmdNc~1649567296408~1', null, '0', '2022-04-10 13:08:16', '2022-04-10 13:16:45');
INSERT INTO `t_anchor` VALUES ('9846', '53721171', 'Xuziaixiao', 'http://p5.a.yximgs.com/uhead/AB/2019/04/27/11/BMjAxOTA0MjcxMTQzMThfNTM3MjExNzFfMV9oZDIzNl82OQ==_s.jpg', '萍宝……', 'F', '', '感谢快手官方\n       任何关系走到最后     都不过是相识一场    情出自愿    事过无悔     不谈亏欠     不负遇见\n         \n                   不定时直播', '211.0', 'https://live4.static.yximgs.com/live/game/screenshot/AJ9GWV4WBd0~1649567805303~1', 'https://live2.static.yximgs.com/live/game/screenshot/AJ9GWV4WBd0~1649567296468~1', null, '0', '2022-04-10 13:08:16', '2022-04-10 13:16:45');
INSERT INTO `t_anchor` VALUES ('9847', '640305664', '', 'http://p4.a.yximgs.com/uhead/AB/2021/09/02/20/BMjAyMTA5MDIyMDA3NDhfNjQwMzA1NjY0XzFfaGQyMzNfNzcz_s.jpg', '爱跳舞的倩儿', 'F', '', '她在关注你\n单身女人\n陪伴是最长情的告白！\n喜欢专一的男人\n性格直爽！比较性情！', '207.0', 'https://live2.static.yximgs.com/live/game/screenshot/pfQCkJb7b8E~1649567805827~1', 'https://live2.static.yximgs.com/live/game/screenshot/pfQCkJb7b8E~1649567296529~1', null, '0', '2022-04-10 13:08:16', '2022-04-10 13:16:45');
INSERT INTO `t_anchor` VALUES ('9848', '2816788404', '', 'http://p2.a.yximgs.com/uhead/AB/2022/03/22/16/BMjAyMjAzMjIxNjM5NThfMjgxNjc4ODQwNF8xX2hkNTk1Xzc2Mg==_s.jpg', '是CC呀', 'F', '', '单曲循环的歌曲里听的都是遗憾！', '256.0', 'https://live2.static.yximgs.com/live/game/screenshot/9kkC5DFQFdw~1649567804018~1', 'https://live1.static.yximgs.com/live/game/screenshot/9kkC5DFQFdw~1649567296589~1', null, '0', '2022-04-10 13:08:16', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9849', '141897570', 'VVOO0000', 'http://p5.a.yximgs.com/uhead/AB/2019/04/20/01/BMjAxOTA0MjAwMTU2MDdfMTQxODk3NTcwXzFfaGQzNzZfNTQ4_s.jpg', '云长77', 'M', '', '比特犬推广', '199.0', 'https://live2.static.yximgs.com/live/game/screenshot/2rzodBhiTqI~1649567296642~1', null, null, '0', '2022-04-10 13:08:16', '2022-04-10 13:08:16');
INSERT INTO `t_anchor` VALUES ('9850', '846069766', 'f9003261314', 'http://p5.a.yximgs.com/uhead/AB/2022/02/25/21/BMjAyMjAyMjUyMTI4NTFfODQ2MDY5NzY2XzFfaGQ3ODhfMzAz_s.jpg', '刘贵妃（加油）', 'F', '', '性格开朗的我有颗善良的心，你用真心对我，我定会用真心对你！随心所欲，开心就好！    \n\n\n才艺主播，业余爱好唱歌！\n\n\n直播时间晚8点，白天不定时，欢迎老铁们\n\n\n\n感谢官方平台让我们相遇，感谢老铁们的支持！', '194.0', 'https://live4.static.yximgs.com/live/game/screenshot/dc77Yy_jR3A~1649567296697~1', null, null, '0', '2022-04-10 13:08:16', '2022-04-10 13:08:16');
INSERT INTO `t_anchor` VALUES ('9851', '1760053966', '', 'http://p5.a.yximgs.com/uhead/AB/2021/09/02/17/BMjAyMTA5MDIxNzAwMjFfMTc2MDA1Mzk2Nl8yX2hkMzI5XzU4Mg==_s.jpg', '戏说平遥古城', 'F', '', '大家好！我是梓墨，居城一角，爱上一座城，本人喜欢山西的历史文化，热爱古建筑，喜欢旅行。\n每天上午户外直播美景，喜欢旅行的你，关注我吧\n感谢快手官方给我们提供一个绿色平台，使我们能够有一个展示自己的空间，传播正能量，永远支持快手', '232.0', 'https://live2.static.yximgs.com/live/game/screenshot/dfPWl4Fmn_8~1649567804616~1', 'https://live2.static.yximgs.com/live/game/screenshot/dfPWl4Fmn_8~1649567296752~1', null, '0', '2022-04-10 13:08:16', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9852', '939378265', '', 'http://p4.a.yximgs.com/uhead/AB/2021/03/16/22/BMjAyMTAzMTYyMjE2MjhfOTM5Mzc4MjY1XzJfaGQyMzlfMjA3_s.jpg', '善缘丽儿', 'F', '', '感谢快手官方给予的绿色平台，支持传递正能量。', '1317.0', 'https://live3.static.yximgs.com/live/game/screenshot/cpTeqgPJdNA~1649567799596~1', 'https://live1.static.yximgs.com/live/game/screenshot/cpTeqgPJdNA~1649567296813~1', null, '0', '2022-04-10 13:08:16', '2022-04-10 13:16:39');
INSERT INTO `t_anchor` VALUES ('9853', '426501568', 'txt950821', 'http://p5.a.yximgs.com/uhead/AB/2022/03/12/08/BMjAyMjAzMTIwODI5MzJfNDI2NTAxNTY4XzFfaGQzMDRfMzIw_s.jpg', '小七砥砺前行', 'F', '', '陪伴是最长情的告白', '150.0', 'https://live4.static.yximgs.com/live/game/screenshot/Hf62H9SgJKQ~1649567296876~1', null, null, '0', '2022-04-10 13:08:16', '2022-04-10 13:08:16');
INSERT INTO `t_anchor` VALUES ('9854', '631149458', 'Yeyi666123', 'http://p4.a.yximgs.com/uhead/AB/2021/04/19/16/BMjAyMTA0MTkxNjA1MjVfNjMxMTQ5NDU4XzJfaGQ0MDVfNTU1_s.jpg', '叶逸', 'M', '', '没关系，天空越黑，星星越亮\n粉丝群:695821225\n十级粉丝团联系我加超级群(福利多多)', '823.0', 'https://live1.static.yximgs.com/live/game/screenshot/aD9NefEZ7zU~1649567800415~1', 'https://live1.static.yximgs.com/live/game/screenshot/aD9NefEZ7zU~1649567296936~1', null, '0', '2022-04-10 13:08:16', '2022-04-10 13:16:40');
INSERT INTO `t_anchor` VALUES ('9855', '806873873', 'xwhgxj888', 'http://p5.a.yximgs.com/uhead/AB/2021/05/05/22/BMjAyMTA1MDUyMjA1NDNfODA2ODczODczXzJfaGQ3MTRfMzE=_s.jpg', '萍聚7804', 'M', '', '网络一线牵，珍惜这段缘', '142.0', 'https://live3.static.yximgs.com/live/game/screenshot/dPZImFcAoPA~1649567296994~1', null, null, '0', '2022-04-10 13:08:16', '2022-04-10 13:08:16');
INSERT INTO `t_anchor` VALUES ('9856', '379458271', 'Ting0217320', 'http://p5.a.yximgs.com/uhead/AB/2020/10/23/00/BMjAyMDEwMjMwMDI4MDhfMzc5NDU4MjcxXzJfaGQ2MjlfNzIx_s.jpg', 'M唯妮婷留', 'F', '', '新人求关照\n\n做最好的自己 其余的交给命运', '830.0', 'https://live4.static.yximgs.com/live/game/screenshot/Bv59nIkTbEE~1649567800342~1', 'https://live2.static.yximgs.com/live/game/screenshot/Bv59nIkTbEE~1649567297054~1', null, '0', '2022-04-10 13:08:17', '2022-04-10 13:16:40');
INSERT INTO `t_anchor` VALUES ('9857', '2387259530', '', 'http://p2.a.yximgs.com/uhead/AB/2021/12/22/13/BMjAyMTEyMjIxMzEyMjdfMjM4NzI1OTUzMF8yX2hkMjU0Xzc3Nw==_s.jpg', '英雄联盟手游-忆白剑姬', 'M', '', '全省第一榜首剑姬第一格雷福斯！\n直播时间：晚上七点--晚十二点！\n个人vx：yibai8127（备注来意）\n粉丝开黑交流群：3591859260', '130.0', 'https://live2.static.yximgs.com/live/game/screenshot/5dv3KSeRDl4~1649567297115~1', null, null, '0', '2022-04-10 13:08:17', '2022-04-10 13:08:17');
INSERT INTO `t_anchor` VALUES ('9858', '686534064', '', 'http://p4.a.yximgs.com/uhead/AB/2021/08/04/17/BMjAyMTA4MDQxNzQ2NThfNjg2NTM0MDY0XzJfaGQ3NjRfNzc=_s.jpg', '《孙家班》晋剧牛慧英', 'F', '', '本人阳泉盂县人，名牛慧英，师承国家一级演员孙红丽。通过平台认识更多戏曲朋友，学习更多戏曲知识，不忘初心。', '665.0', 'https://live3.static.yximgs.com/live/game/screenshot/7-2TaAoxJV8~1649567800864~1', 'https://live4.static.yximgs.com/live/game/screenshot/7-2TaAoxJV8~1649567297175~1', null, '0', '2022-04-10 13:08:17', '2022-04-10 13:16:40');
INSERT INTO `t_anchor` VALUES ('9859', '2403680666', '', 'http://p5.a.yximgs.com/uhead/AB/2022/03/11/14/BMjAyMjAzMTExNDE2NTdfMjQwMzY4MDY2Nl8yX2hkNjA3XzYzOQ==_s.jpg', '大同关老三小号', 'M', '', '', '122.0', 'https://live4.static.yximgs.com/live/game/screenshot/kubBwOZXHy8~1649567297232~1', null, null, '0', '2022-04-10 13:08:17', '2022-04-10 13:08:17');
INSERT INTO `t_anchor` VALUES ('9860', '117784929', 'cunhua9999', 'http://p2.a.yximgs.com/uhead/AB/2021/04/16/16/BMjAyMTA0MTYxNjM3MzZfMTE3Nzg0OTI5XzFfaGQ1MjFfMzc1_s.jpg', '奶茶和平精英（自定义）', 'M', '', 'MG俱乐部：MG33303\n冲刺200万。 感谢陪伴。 每天早上7.30到晚上12点全天带粉自定义', '121.0', 'https://live2.static.yximgs.com/live/game/screenshot/VR-meyt73Ek~1649567297292~1', null, null, '0', '2022-04-10 13:08:17', '2022-04-10 13:08:17');
INSERT INTO `t_anchor` VALUES ('9861', '474476873', 'mj666555mj', 'http://p5.a.yximgs.com/uhead/AB/2022/04/09/00/BMjAyMjA0MDkwMDQ0MzBfNDc0NDc2ODczXzJfaGQ0OV83Njc=_s.jpg', '代州毛姐《探店达人》', 'F', '', '路遥知马力-日久见人心！\n玩快手只为认识更多的朋友，多个朋友多条路，有喜欢拍段子也可以联系我，，有需要帮忙宣传，饭店开业也可以联系我……每晚九点半开播《说学逗唱》帮您排忧解难！\n感谢大家！', '110.0', 'https://live2.static.yximgs.com/live/game/screenshot/9l7hYSXIGKc~1649567297353~1', null, null, '0', '2022-04-10 13:08:17', '2022-04-10 13:08:17');
INSERT INTO `t_anchor` VALUES ('9862', '1817503000', 'cxx8960757', 'http://p2.a.yximgs.com/uhead/AB/2022/04/10/11/BMjAyMjA0MTAxMTIzNTdfMTgxNzUwMzAwMF8xX2hkNDczXzQwMA==_s.jpg', '崔小翔你好呀', 'M', '', '这个人很懒，什么都没留下', '110.0', 'https://live3.static.yximgs.com/live/game/screenshot/2YIrT2DaCtQ~1649567297413~1', null, null, '0', '2022-04-10 13:08:17', '2022-04-10 13:08:17');
INSERT INTO `t_anchor` VALUES ('9863', '346444713', 'lucy1240352', 'http://p2.a.yximgs.com/uhead/AB/2021/12/26/13/BMjAyMTEyMjYxMzI4NTNfMzQ2NDQ0NzEzXzJfaGQ1NTNfNjM2_s.jpg', '了凡lucy', 'F', '', '万丈深渊，终有底，三寸人心不可凉，坎坎坷坷，谁陪谁，真真假假，谁信谁，不怕虎狼当面阴，就怕交人两面心，不敢占卜问余年，惟恐余年似从前，一坛烈酒两口咽，半坛苦辣，半坛咸！', '110.0', 'https://live1.static.yximgs.com/live/game/screenshot/1g_59sh2bvs~1649567297470~1', null, null, '0', '2022-04-10 13:08:17', '2022-04-10 13:08:17');
INSERT INTO `t_anchor` VALUES ('9864', '361452647', 'zwy110815', 'http://p4.a.yximgs.com/uhead/AB/2017/03/11/22/BMjAxNzAzMTEyMjExNDZfMzYxNDUyNjQ3XzJfaGQxNA==.jpg', '最高的学文就是人品', 'M', '', '最高的学文就是人品这个快手平台就是好，这里有其乐无穷，有一辈子学不到的知识。快手老铁们，我是块砖哪里需要用哪里搬。欢迎各界人士来到山西洪洞大槐树玩，欢迎全国各地情感调解找人单身男女来相亲，做公益调解各种各样的事预约上门，每天中午一点开播相亲，', '110.0', 'https://live4.static.yximgs.com/live/game/screenshot/ZB2ArmbzhIc~1649567297530~1', null, null, '0', '2022-04-10 13:08:17', '2022-04-10 13:08:17');
INSERT INTO `t_anchor` VALUES ('9865', '1965646875', '', 'http://p5.a.yximgs.com/uhead/AB/2021/01/15/16/BMjAyMTAxMTUxNjA2MjhfMTk2NTY0Njg3NV8yX2hkOTA2XzEy_s.jpg', '农村九大牙', 'M', '', '本人单身感谢快手平台支持农村新人没事情和家人们共同娱乐说笑逗唱', '108.0', 'https://live3.static.yximgs.com/live/game/screenshot/5sR9bP3brBk~1649567297591~1', null, null, '0', '2022-04-10 13:08:17', '2022-04-10 13:08:17');
INSERT INTO `t_anchor` VALUES ('9866', '857852904', 'whl15003528855', 'http://p2.a.yximgs.com/uhead/AB/2021/10/26/15/BMjAyMTEwMjYxNTM4NThfODU3ODUyOTA0XzJfaGQ0NjhfOTE2_s.jpg', '老王说酒～', 'M', '', '感谢快手，感谢官方，主营酒类产品 ！\n\n欢迎新老顾客选购！\n本店支持七天无理由退货，但退货产生的费用需买家自己承担！\n\n温馨提示：\n理智下单，切勿盲目跟风', '106.0', 'https://live3.static.yximgs.com/live/game/screenshot/hpRMkJ5K5Gw~1649567297651~1', null, null, '0', '2022-04-10 13:08:17', '2022-04-10 13:08:17');
INSERT INTO `t_anchor` VALUES ('9867', '75161137', 'Niu-zi-xuan', 'http://p4.a.yximgs.com/uhead/AB/2022/03/10/23/BMjAyMjAzMTAyMzI5NDFfNzUxNjExMzdfMV9oZDgwNF81MDk=_s.jpg', 'o   亿万少女的梦', 'M', '', '我为什么老是揪着某件事不放 因为我过不去 受委屈的是我 不是你 .', '104.0', 'https://live1.static.yximgs.com/live/game/screenshot/K9I_aKu09J8~1649567297709~1', null, null, '0', '2022-04-10 13:08:17', '2022-04-10 13:08:17');
INSERT INTO `t_anchor` VALUES ('9868', '687547615', 'z1065139759', 'http://p2.a.yximgs.com/uhead/AB/2022/02/01/12/BMjAyMjAyMDExMjA4NDlfNjg3NTQ3NjE1XzJfaGQ4MjJfNjEy_s.jpg', '长城晋剧院小生丽萍', 'F', '', '大家好，我叫智丽萍，\n1993年生，是一名晋剧小生演员\n     师承著名表演艺术家裴静卫老师\n感谢快手，感恩快手。祝快手越好！', '208.0', 'https://live3.static.yximgs.com/live/game/screenshot/G-2QdBVFbI4~1649567805702~1', 'https://live3.static.yximgs.com/live/game/screenshot/G-2QdBVFbI4~1649567297762~1', null, '0', '2022-04-10 13:08:17', '2022-04-10 13:16:45');
INSERT INTO `t_anchor` VALUES ('9869', '385352333', '', 'http://p2.a.yximgs.com/uhead/AB/2022/04/02/16/BMjAyMjA0MDIxNjM5NDhfMzg1MzUyMzMzXzFfaGQ1NDZfMTkz_s.jpg', '函函吃不饱吖', 'F', '', '\n简单的事情，干净的东西，清楚的感觉', '101.0', 'https://live1.static.yximgs.com/live/game/screenshot/meT_PJ3VlUI~1649567297822~1', null, null, '0', '2022-04-10 13:08:17', '2022-04-10 13:08:17');
INSERT INTO `t_anchor` VALUES ('9870', '806176139', 'MM870821', 'http://p4.a.yximgs.com/uhead/AB/2021/09/29/23/BMjAyMTA5MjkyMzA3MTNfODA2MTc2MTM5XzJfaGQ2NzlfNjc3_s.jpg', '沫沫【不卑不亢】', 'F', '', '每天下午一点户外直播！\n马甲：情怀*《××》\n不定时拿小号直播【沫沫的朋友圈】', '91.0', 'https://live3.static.yximgs.com/live/game/screenshot/TG1agMNnO58~1649567297883~1', null, null, '0', '2022-04-10 13:08:17', '2022-04-10 13:08:17');
INSERT INTO `t_anchor` VALUES ('9871', '2634845708', '', 'http://p2.a.yximgs.com/uhead/AB/2022/02/03/23/BMjAyMjAyMDMyMzU5MzdfMjYzNDg0NTcwOF8yX2hkNDY4XzU2Mw==_s.jpg', '完美后花园', 'F', '', '应聘滴滴', '90.0', 'https://live1.static.yximgs.com/live/game/screenshot/mMCINDcsAA8~1649567297938~1', null, null, '0', '2022-04-10 13:08:17', '2022-04-10 13:08:17');
INSERT INTO `t_anchor` VALUES ('9872', '1498174562', '', 'http://p4.a.yximgs.com/uhead/AB/2019/09/16/01/BMjAxOTA5MTYwMTAwMTNfMTQ5ODE3NDU2Ml8yX2hkMTIxXzk3NA==_s.jpg', '梦随心动6811', 'F', '', '', '419.0', 'https://live2.static.yximgs.com/live/game/screenshot/9s_szK7sDXE~1649567802173~1', 'https://live1.static.yximgs.com/live/game/screenshot/9s_szK7sDXE~1649567297995~1', null, '0', '2022-04-10 13:08:17', '2022-04-10 13:16:42');
INSERT INTO `t_anchor` VALUES ('9873', '2055777025', '', 'http://p2.a.yximgs.com/uhead/AB/2022/03/23/17/BMjAyMjAzMjMxNzM0MDJfMjA1NTc3NzAyNV8xX2hkMjQ3XzUw_s.jpg', '慧仔', 'F', '', '', '301.0', 'https://live4.static.yximgs.com/live/game/screenshot/56Y8EKjtmec~1649567803327~1', 'https://live3.static.yximgs.com/live/game/screenshot/56Y8EKjtmec~1649567298056~1', null, '0', '2022-04-10 13:08:18', '2022-04-10 13:16:43');
INSERT INTO `t_anchor` VALUES ('9874', '683889319', 'ABC1991dfg', 'http://p2.a.yximgs.com/uhead/AB/2021/10/13/18/BMjAyMTEwMTMxODQxNDdfNjgzODg5MzE5XzJfaGQ3NTVfMTE3_s.jpg', '佳佳【砥砺前行】', 'F', '', '每天开播时间早上八点，晚上八点\n开心唱晋剧，开心唱歌\n砥砺前行 不忘初心', '86.0', 'https://live2.static.yximgs.com/live/game/screenshot/nveh9_Wt6A8~1649567298112~1', null, null, '0', '2022-04-10 13:08:18', '2022-04-10 13:08:18');
INSERT INTO `t_anchor` VALUES ('9875', '275984820', '', 'http://p2.a.yximgs.com/uhead/AB/2022/01/17/19/BMjAyMjAxMTcxOTA4MjZfMjc1OTg0ODIwXzJfaGQ5NDZfNzE0_s.jpg', '幸福快乐。3GU', 'F', '', '', '80.0', 'https://live3.static.yximgs.com/live/game/screenshot/EAIwM3i9JKg~1649567298173~1', null, null, '0', '2022-04-10 13:08:18', '2022-04-10 13:08:18');
INSERT INTO `t_anchor` VALUES ('9876', '2141995197', 'L135195678', 'http://tx6.a.kwimgs.com/uhead/AB/2022/03/30/02/BMjAyMjAzMzAwMjM2MTZfMjE0MTk5NTE5N18yX2hkNDY4Xzg2MQ==_s.jpg', '路在何方88888', 'M', '', '本人无业，奋斗中', '78.0', 'https://live2.static.yximgs.com/live/game/screenshot/G8gD3z1zuFs~1649567298233~1', null, null, '0', '2022-04-10 13:08:18', '2022-04-10 13:08:18');
INSERT INTO `t_anchor` VALUES ('9877', '2426735633', '', 'http://p2.a.yximgs.com/uhead/AB/2022/04/08/20/BMjAyMjA0MDgyMDA5MzhfMjQyNjczNTYzM18yX2hkMjQ0XzYxMA==_s.jpg', '丫头yy', 'F', '', '承蒙厚爱，感谢相遇，相识，相知！！', '78.0', 'https://live3.static.yximgs.com/live/game/screenshot/kCoTG5FhYhw~1649567298294~1', null, null, '0', '2022-04-10 13:08:18', '2022-04-10 13:08:18');
INSERT INTO `t_anchor` VALUES ('9878', '1173717781', 'a1261558410', 'http://tx6.a.kwimgs.com/uhead/AB/2022/04/06/22/BMjAyMjA0MDYyMjQ2MDhfMTE3MzcxNzc4MV8yX2hkMTIxXzE2Ng==_s.jpg', '没愛人か', 'M', '', '爱要及时    别总说下次', '78.0', 'https://live3.static.yximgs.com/live/game/screenshot/u4Vw6t3cBps~1649567298351~1', null, null, '0', '2022-04-10 13:08:18', '2022-04-10 13:08:18');
INSERT INTO `t_anchor` VALUES ('9879', '723882825', '', 'http://p2.a.yximgs.com/uhead/AB/2020/11/11/18/BMjAyMDExMTExODI4MjhfNzIzODgyODI1XzJfaGQ2NTFfNDk=_s.jpg', '＠（山西）！！牛莉！', 'F', '', '感谢快手管方', '75.0', 'https://live3.static.yximgs.com/live/game/screenshot/gDrAo4l7t6g~1649567298406~1', null, null, '0', '2022-04-10 13:08:18', '2022-04-10 13:08:18');
INSERT INTO `t_anchor` VALUES ('9880', '350008492', 'dkyxjs66666', 'http://tx6.a.kwimgs.com/uhead/AB/2022/01/27/20/BMjAyMjAxMjcyMDQ4MjJfMzUwMDA4NDkyXzJfaGQ0NTFfMjMy_s.jpg', '迪克游戏解说', 'M', '', '持续更新游戏解说视频！\n合作+  dkyxjs666\n谢谢你们的关注哟', '73.0', 'https://live2.static.yximgs.com/live/game/screenshot/2Pk16n0YNxA~1649567298467~1', null, null, '0', '2022-04-10 13:08:18', '2022-04-10 13:08:18');
INSERT INTO `t_anchor` VALUES ('9881', '1204232274', 'lyh20080628', 'http://p5.a.yximgs.com/uhead/AB/2022/04/05/22/BMjAyMjA0MDUyMjAwMzZfMTIwNDIzMjI3NF8yX2hkNTgwXzgyNg==_s.jpg', '-难  为情.', 'F', '', '无聊', '73.0', 'https://live2.static.yximgs.com/live/game/screenshot/SFX1fLLD8yw~1649567298528~1', null, null, '0', '2022-04-10 13:08:18', '2022-04-10 13:08:18');
INSERT INTO `t_anchor` VALUES ('9882', '658380715', 'ks-0111666', 'http://p2.a.yximgs.com/uhead/AB/2020/12/01/20/BMjAyMDEyMDEyMDUyMzlfNjU4MzgwNzE1XzJfaGQ0MDVfOTE4_s.jpg', '红娘冰姐婚礼主持', 'F', '', '感谢官方大大提供的平台！\n给大家提供更好的绿色相亲平台！\n冰姐帮忙牵手成功的，用婚庆，免费婚礼主持。所有十级粉丝团也一样！\n2022年男女脱单群的男会员免费参加聚会！（有效期半年）\n友情提示，不要有任何经济来往，后果自负！', '71.0', 'https://live1.static.yximgs.com/live/game/screenshot/32X8CNF6qck~1649567298586~1', null, null, '0', '2022-04-10 13:08:18', '2022-04-10 13:08:18');
INSERT INTO `t_anchor` VALUES ('9883', '1521877142', 'xmr1314258', 'http://p4.a.yximgs.com/uhead/AB/2021/04/08/22/BMjAyMTA0MDgyMjQwMjNfMTUyMTg3NzE0Ml8yX2hkOTIwXzg4Mw==_s.jpg', '香美人中号', 'F', '', '唱歌跳舞，谢谢朋友们的支持与厚爱。感谢快手官方这个平台。', '70.0', 'https://live2.static.yximgs.com/live/game/screenshot/MgI0EI2IUkE~1649567298647~1', null, null, '0', '2022-04-10 13:08:18', '2022-04-10 13:08:18');
INSERT INTO `t_anchor` VALUES ('9884', '2424012162', 'Yingzi-2580', 'http://p4.a.yximgs.com/uhead/AB/2021/12/28/13/BMjAyMTEyMjgxMzU2NTZfMjQyNDAxMjE2Ml8yX2hkNjI3XzM1Mw==_s.jpg', '封情锁爱', 'U', '', '相遇是缘', '70.0', 'https://live4.static.yximgs.com/live/game/screenshot/LNzWatwKbZM~1649567298708~1', null, null, '0', '2022-04-10 13:08:18', '2022-04-10 13:08:18');
INSERT INTO `t_anchor` VALUES ('9885', '236415771', 'zy09716888', 'http://p5.a.yximgs.com/uhead/AB/2022/03/08/19/BMjAyMjAzMDgxOTA4MjNfMjM2NDE1NzcxXzJfaGQ1NjBfODg5_s.jpg', '李妹纸吖', 'F', '', '纯属娱乐\n不拉也没群', '70.0', 'https://live1.static.yximgs.com/live/game/screenshot/xwFsu6J_YUs~1649567298768~1', null, null, '0', '2022-04-10 13:08:18', '2022-04-10 13:08:18');
INSERT INTO `t_anchor` VALUES ('9886', '213033075', 'JYAC888666', 'http://p5.a.yximgs.com/uhead/AB/2020/07/15/14/BMjAyMDA3MTUxNDQ0MjlfMjEzMDMzMDc1XzJfaGQ2NDZfMjQ=_s.jpg', '大刘妈妈铲屎官', 'M', '', '希望老铁们，关注我，谢谢', '66.0', 'https://live3.static.yximgs.com/live/game/screenshot/HlWdwCep31A~1649567298826~1', null, null, '0', '2022-04-10 13:08:18', '2022-04-10 13:08:18');
INSERT INTO `t_anchor` VALUES ('9887', '728844970', 'LXLX8808520', 'http://p5.a.yximgs.com/uhead/AB/2021/09/06/00/BMjAyMTA5MDYwMDExMzlfNzI4ODQ0OTcwXzJfaGQ5NzBfNTI4_s.jpg', '凌笑宝宝', 'F', '', '不是每一个化妆师都叫凌笑', '275.0', 'https://live3.static.yximgs.com/live/game/screenshot/GvHUywa0Nlc~1649567803943~1', 'https://live1.static.yximgs.com/live/game/screenshot/GvHUywa0Nlc~1649567298886~1', null, '0', '2022-04-10 13:08:18', '2022-04-10 13:16:43');
INSERT INTO `t_anchor` VALUES ('9888', '1145204622', '', 'http://p2.a.yximgs.com/uhead/AB/2021/07/22/09/BMjAyMTA3MjIwOTM2NThfMTE0NTIwNDYyMl8yX2hkNjU0XzM4OA==_s.jpg', 'h黄教授', 'M', '', '军人出生，原交天下朋友成为一家人', '65.0', 'https://live1.static.yximgs.com/live/game/screenshot/iMBvNOkMpUo~1649567298943~1', null, null, '0', '2022-04-10 13:08:18', '2022-04-10 13:08:18');
INSERT INTO `t_anchor` VALUES ('9889', '475812296', '', 'http://tx6.a.kwimgs.com/uhead/AB/2022/03/13/19/BMjAyMjAzMTMxOTMwMDhfNDc1ODEyMjk2XzJfaGQzMDFfOTQw_s.jpg', '淡淡の、清香XStr40ui', 'F', '', '不加微信', '65.0', 'https://live3.static.yximgs.com/live/game/screenshot/C7dB_T0HXDs~1649567298999~1', null, null, '0', '2022-04-10 13:08:18', '2022-04-10 13:08:18');
INSERT INTO `t_anchor` VALUES ('9890', '252199890', '', 'http://tx6.a.kwimgs.com/uhead/AB/2020/07/15/20/BMjAyMDA3MTUyMDAyMDZfMjUyMTk5ODkwXzJfaGQ4NDJfMjU3_s.jpg', '小胖妹603', 'F', '', '感谢快手平台，让我变得有了自信，同时遇见有缘的你们成为朋友。感谢帮助过我的人。感恩遇见。', '494.0', 'https://live4.static.yximgs.com/live/game/screenshot/eo-edmbtwBg~1649567801764~1', 'https://live1.static.yximgs.com/live/game/screenshot/eo-edmbtwBg~1649567299060~1', null, '0', '2022-04-10 13:08:19', '2022-04-10 13:16:41');
INSERT INTO `t_anchor` VALUES ('9891', '234151119', 'JJ987654321J', 'http://p2.a.yximgs.com/uhead/AB/2019/08/07/22/BMjAxOTA4MDcyMjA4MTlfMjM0MTUxMTE5XzFfaGQ2MThfOTc4_s.jpg', '温柔小奶兔', 'F', '', '', '62.0', 'https://live4.static.yximgs.com/live/game/screenshot/EUM01Guxyfk~1649567299120~1', null, null, '0', '2022-04-10 13:08:19', '2022-04-10 13:08:19');
INSERT INTO `t_anchor` VALUES ('9892', '749281051', '', 'http://p4.a.yximgs.com/uhead/AB/2020/07/15/13/BMjAyMDA3MTUxMzEyNTZfNzQ5MjgxMDUxXzJfaGQ1OTVfMTY0_s.jpg', '山西花公子', 'F', '', '个人比较喜欢交友', '62.0', 'https://live1.static.yximgs.com/live/game/screenshot/7Ax9N4ja8sw~1649567299176~1', null, null, '0', '2022-04-10 13:08:19', '2022-04-10 13:08:19');
INSERT INTO `t_anchor` VALUES ('9893', '609127850', 'Bole8889', 'http://p4.a.yximgs.com/uhead/AB/2021/11/28/19/BMjAyMTExMjgxOTA0MDRfNjA5MTI3ODUwXzJfaGQ0NjVfNjgx_s.jpg', '博乐歌（早十一点播）', 'M', '', '1.博乐老师毕业于西安音乐学院声乐教育系，进修于中国音乐学院，中国民族男高音优秀男高音演员，快手音乐人\n2.感谢快手官方提供平台，用歌声传播正能量，为您带来健康和快乐\n3.做事一阵子，做人一辈子，上报四重恩，下济三涂苦', '61.0', 'https://live1.static.yximgs.com/live/game/screenshot/TCIHd7qaw8I~1649567299237~1', null, null, '0', '2022-04-10 13:08:19', '2022-04-10 13:08:19');
INSERT INTO `t_anchor` VALUES ('9894', '1314301677', '', 'http://tx6.a.kwimgs.com/uhead/AB/2019/08/17/20/BMjAxOTA4MTcyMDAyMjdfMTMxNDMwMTY3N18yX2hkMTUzXzQwNQ==_s.jpg', '三交一姐', 'F', '', '', '61.0', 'https://live4.static.yximgs.com/live/game/screenshot/YsP58n4tZyY~1649567299297~1', null, null, '0', '2022-04-10 13:08:19', '2022-04-10 13:08:19');
INSERT INTO `t_anchor` VALUES ('9895', '47986925', 'wangshiqingkongyiqie', 'http://p2.a.yximgs.com/uhead/AB/2022/03/22/10/BMjAyMjAzMjIxMDEzNDJfNDc5ODY5MjVfMl9oZDg2MF85MDA=_s.jpg', '赤   子  之   心', 'M', '', '一切相遇皆是恩赐', '61.0', 'https://live3.static.yximgs.com/live/game/screenshot/ivligYMa9Qk~1649567299358~1', null, null, '0', '2022-04-10 13:08:19', '2022-04-10 13:08:19');
INSERT INTO `t_anchor` VALUES ('9896', '908087610', '', 'http://p2.a.yximgs.com/uhead/AB/2022/03/07/18/BMjAyMjAzMDcxODAyMzJfOTA4MDg3NjEwXzJfaGQ4OF82MzI=_s.jpg', '离石翠儿看世界', 'F', '', '感谢快手官方，支持绿色平台！\n世界之大，无奇不有，让我陪伴你看世界！\n每日分享，传播正能量，感谢观看！', '60.0', 'https://live4.static.yximgs.com/live/game/screenshot/tEgb8jIlJ7M~1649567299418~1', null, null, '0', '2022-04-10 13:08:19', '2022-04-10 13:08:19');
INSERT INTO `t_anchor` VALUES ('9897', '54233715', 'Gg7787666', 'http://p2.a.yximgs.com/uhead/AB/2021/02/26/18/BMjAyMTAyMjYxODM0MTVfNTQyMzM3MTVfMV9oZDU1NV85ODM=_s.jpg', '大脸光光', 'M', '', '变优秀.祝你也祝我', '59.0', 'https://live2.static.yximgs.com/live/game/screenshot/nJ05PG-vsbc~1649567299479~1', null, null, '0', '2022-04-10 13:08:19', '2022-04-10 13:08:19');
INSERT INTO `t_anchor` VALUES ('9898', '1248395696', '', 'http://tx6.a.kwimgs.com/uhead/AB/2021/03/05/19/BMjAyMTAzMDUxOTU0MjlfMTI0ODM5NTY5Nl8yX2hkMTM5XzQwMg==_s.jpg', '1往事随风', 'M', '', '', '58.0', 'https://live3.static.yximgs.com/live/game/screenshot/y25AZHZZzeI~1649567299535~1', null, null, '0', '2022-04-10 13:08:19', '2022-04-10 13:08:19');
INSERT INTO `t_anchor` VALUES ('9899', '803824459', 'YG504504', 'http://p4.a.yximgs.com/uhead/AB/2021/09/26/12/BMjAyMTA5MjYxMjE0MDdfODAzODI0NDU5XzJfaGQ3NzlfNjA5_s.jpg', '芸贵妃504', 'F', '', '我是来自农村得180斤胖美美，感谢快手平台！可爱的我期待与你相遇！\n直播时间早6点，晚8点。', '298.0', 'https://live3.static.yximgs.com/live/game/screenshot/IUNRc1zBZDM~1649567803733~1', 'https://live3.static.yximgs.com/live/game/screenshot/PKDUX9ofLM4~1649567299595~1', null, '0', '2022-04-10 13:08:19', '2022-04-10 13:16:43');
INSERT INTO `t_anchor` VALUES ('9900', '430977467', 'fxh158158', 'http://p5.a.yximgs.com/uhead/AB/2022/03/27/11/BMjAyMjAzMjcxMTMzMDBfNDMwOTc3NDY3XzJfaGQ4MF8zNTU=_s.jpg', '浑源命子，川剧变脸。', 'M', '', '13934733168', '56.0', 'https://live3.static.yximgs.com/live/game/screenshot/CnOBNGGjk8M~1649567299656~1', null, null, '0', '2022-04-10 13:08:19', '2022-04-10 13:08:19');
INSERT INTO `t_anchor` VALUES ('9901', '1067311557', 'dhw854905', 'http://p4.a.yximgs.com/uhead/AB/2022/02/15/05/BMjAyMjAyMTUwNTEwNDZfMTA2NzMxMTU1N18yX2hkODU0XzE3MQ==_s.jpg', '过客', 'M', '', '把我养的人养大、把养我的人送走。至于下辈子、不来啦', '55.0', 'https://live2.static.yximgs.com/live/game/screenshot/OZpfqwk88Mk~1649567299717~1', null, null, '0', '2022-04-10 13:08:19', '2022-04-10 13:08:19');
INSERT INTO `t_anchor` VALUES ('9902', '1875830643', '', 'http://p4.a.yximgs.com/uhead/AB/2022/03/31/15/BMjAyMjAzMzExNTMzMDFfMTg3NTgzMDY0M18yX2hkOTU2XzYyMA==_s.jpg', '蓝馨', 'M', '', '', '52.0', 'https://live2.static.yximgs.com/live/game/screenshot/LT1jvP52sN0~1649567299774~1', null, null, '0', '2022-04-10 13:08:19', '2022-04-10 13:08:19');
INSERT INTO `t_anchor` VALUES ('9903', '886853690', '', 'http://tx6.a.kwimgs.com/uhead/AB/2021/09/03/11/BMjAyMTA5MDMxMTQwMzhfODg2ODUzNjkwXzJfaGQ5NjRfODU2_s.jpg', '杏花村二妞佛缘阁', 'F', '', '手机号！18335846262\n山西汾阳杏花村汾酒集团', '1014.0', 'https://live2.static.yximgs.com/live/game/screenshot/DMKjfvz8fM0~1649567799823~1', null, null, '0', '2022-04-10 13:16:39', '2022-04-10 13:16:39');
INSERT INTO `t_anchor` VALUES ('9904', '496702813', '', 'http://p2.a.yximgs.com/uhead/AB/2021/07/24/20/BMjAyMTA3MjQyMDQwMjJfNDk2NzAyODEzXzJfaGQyMV82NzU=_s.jpg', '山西地涌酒业有限公司', 'F', '', '山西地涌酒业有限公司，白酒酿造，礼盒酒。关注我，帮您挣钱。159兴趣爱好:3583兴趣爱好:3436', '999.0', 'https://live2.static.yximgs.com/live/game/screenshot/9SBi3P2fqJ8~1649567799954~1', null, null, '0', '2022-04-10 13:16:39', '2022-04-10 13:16:39');
INSERT INTO `t_anchor` VALUES ('9905', '1637481353', '', 'http://p4.a.yximgs.com/uhead/AB/2021/09/25/09/BMjAyMTA5MjUwOTMzMzBfMTYzNzQ4MTM1M18yX2hkMzkyXzM2NA==_s.jpg', '二銅錘直播間83844', 'M', '', '', '972.0', 'https://live2.static.yximgs.com/live/game/screenshot/hH3QgIOb3Cs~1649567800090~1', null, null, '0', '2022-04-10 13:16:40', '2022-04-10 13:16:40');
INSERT INTO `t_anchor` VALUES ('9906', '42517494', '', 'http://tx6.a.kwimgs.com/uhead/AB/2022/01/25/22/BMjAyMjAxMjUyMjAwMzhfNDI1MTc0OTRfMV9oZDQ4Ml8yOTc=_s.jpg', '汽水妹cola', 'U', '', '记录生活', '959.0', 'https://live4.static.yximgs.com/live/game/screenshot/1BlfeV-TcZo~1649567800226~1', null, null, '0', '2022-04-10 13:16:40', '2022-04-10 13:16:40');
INSERT INTO `t_anchor` VALUES ('9907', '1182640572', 'aikz-0623', 'http://p5.a.yximgs.com/uhead/AB/2022/04/10/00/BMjAyMjA0MTAwMDA3MDlfMTE4MjY0MDU3Ml8yX2hkNzUxXzM3MQ==_s.jpg', '书 崽.', 'U', '', '你觉得你又算得了什么.', '867.0', 'https://live3.static.yximgs.com/live/game/screenshot/FpIgLa7tJsM~1649567800286~1', null, null, '0', '2022-04-10 13:16:40', '2022-04-10 13:16:40');
INSERT INTO `t_anchor` VALUES ('9908', '903995659', '', 'http://p4.a.yximgs.com/uhead/AB/2019/05/15/15/BMjAxOTA1MTUxNTU3MDZfOTAzOTk1NjU5XzJfaGQ3OTVfNDAy_s.jpg', '康美295', 'F', '', '山西\n\n感谢所有深爱我的朋友，感谢你们默默相守，\n绿色直播间，做一个无所不能的女王，当一个可爱的小公主，\n\n本人从不主动发私信加微信，更不会向任何人要红包，谨防上当受骗，', '823.0', 'https://live4.static.yximgs.com/live/game/screenshot/1Jy7MqFBJ9k~1649567800490~1', null, null, '0', '2022-04-10 13:16:40', '2022-04-10 13:16:40');
INSERT INTO `t_anchor` VALUES ('9909', '2079508220', '', 'http://p2.a.yximgs.com/uhead/AB/2022/03/28/04/BMjAyMjAzMjgwNDI1MzRfMjA3OTUwODIyMF8yX2hkMzY3Xzg2Ng==_s.jpg', '地铁逃生小末', 'M', '', '如果巅峰留不住那我末歌从头开始\n末歌小号\n需要护航的+Vzzq16635561126', '718.0', 'https://live2.static.yximgs.com/live/game/screenshot/YdU-gRuNSJ0~1649567800743~1', null, null, '0', '2022-04-10 13:16:40', '2022-04-10 13:16:40');
INSERT INTO `t_anchor` VALUES ('9910', '202291619', 'cz520251314', 'http://p2.a.yximgs.com/uhead/AB/2022/04/06/21/BMjAyMjA0MDYyMTUwMjdfMjAyMjkxNjE5XzFfaGQzOTVfNDUx_s.jpg', '梧桐冰姐', 'F', '', '', '683.0', 'https://live1.static.yximgs.com/live/game/screenshot/eAjtEliBwsg~1649567800803~1', null, null, '0', '2022-04-10 13:16:40', '2022-04-10 13:16:40');
INSERT INTO `t_anchor` VALUES ('9911', '376364526', 'abcd376364526', 'http://p2.a.yximgs.com/uhead/AB/2022/04/02/10/BMjAyMjA0MDIxMDU1MjlfMzc2MzY0NTI2XzJfaGQ0ODdfNjEw_s.jpg', '梅梅', 'F', '', '最心酸的是，那个能让你笑的人，最后却让你哭了，最遗憾的是，那个说陪你到最后的人，最后却提前退了场…', '658.0', 'https://live2.static.yximgs.com/live/game/screenshot/dtz8JwWJ7F0~1649567800939~1', null, null, '0', '2022-04-10 13:16:40', '2022-04-10 13:16:40');
INSERT INTO `t_anchor` VALUES ('9912', '923644194', 'tyf188988', 'http://tx6.a.kwimgs.com/uhead/AB/2022/01/15/15/BMjAyMjAxMTUxNTQ5MDZfOTIzNjQ0MTk0XzJfaGQ2MDlfOTk4_s.jpg', '玉儿小哥尊师程家家', 'F', '', '玉儿原唱歌曲《枕梦回乡》\n喜欢唱歌，却无其他特别，喜欢朋友，愿以诚相待！做人做事顶天立地！交人交友坦坦荡荡！', '636.0', 'https://live3.static.yximgs.com/live/game/screenshot/KhqLqZuzxY0~1649567801070~1', null, null, '0', '2022-04-10 13:16:41', '2022-04-10 13:16:41');
INSERT INTO `t_anchor` VALUES ('9913', '296061427', 'zar-5999', 'http://p2.a.yximgs.com/uhead/AB/2022/03/03/01/BMjAyMjAzMDMwMTA4NTVfMjk2MDYxNDI3XzFfaGQ3NzFfNjkz_s.jpg', '荣儿 1222', 'F', '', '直播时间:中午12点半开播:  晚上9点开播\n直播内容:聊天  交友  唱歌\n喜欢主播的可以留下免费的关注爱你们么么哒', '626.0', 'https://live4.static.yximgs.com/live/game/screenshot/uJ9OY0a3sLs~1649567801130~1', null, null, '0', '2022-04-10 13:16:41', '2022-04-10 13:16:41');
INSERT INTO `t_anchor` VALUES ('9914', '797695767', '', 'http://p5.a.yximgs.com/uhead/AB/2021/12/01/15/BMjAyMTEyMDExNTQyNDdfNzk3Njk1NzY3XzJfaGQxOTZfOTcx_s.jpg', '爱唱情歌的茉莉', 'F', '', '首先感谢快手官方让自己认识很多朋友！在平淡无奇的生活中唱唱歌！跳跳舞！聊聊天！感恩快手朋友的每一份付出！有召一日用的着我的地方！尽力而为！柿子不要捡软的捏！不吃那一套', '619.0', 'https://live4.static.yximgs.com/live/game/screenshot/7BqXR_Al57g~1649567801191~1', null, null, '0', '2022-04-10 13:16:41', '2022-04-10 13:16:41');
INSERT INTO `t_anchor` VALUES ('9915', '1021926026', '', 'http://p2.a.yximgs.com/uhead/AB/2022/04/07/06/BMjAyMjA0MDcwNjU5NTdfMTAyMTkyNjAyNl8yX2hkMzMzXzU2MA==_s.jpg', '开心每一天98196', 'F', '', '感谢老铁们的关注和支持！\n不回私信，拒绝加v ！', '598.0', 'https://live4.static.yximgs.com/live/game/screenshot/g0au8PhMMGE~1649567801346~1', null, null, '0', '2022-04-10 13:16:41', '2022-04-10 13:16:41');
INSERT INTO `t_anchor` VALUES ('9916', '1138317670', 'liuhua321321', 'http://p5.a.yximgs.com/uhead/AB/2022/03/27/16/BMjAyMjAzMjcxNjUxMjdfMTEzODMxNzY3MF8yX2hkMTUzXzk1Nw==_s.jpg', '美丽二姐', 'F', '', '每天晚上八点半__九点开播，欢迎。不回私信', '598.0', 'https://live3.static.yximgs.com/live/game/screenshot/eXwXNL1n5ig~1649567801400~1', null, null, '0', '2022-04-10 13:16:41', '2022-04-10 13:16:41');
INSERT INTO `t_anchor` VALUES ('9917', '485623403', '', 'http://p2.a.yximgs.com/uhead/AB/2022/03/05/12/BMjAyMjAzMDUxMjUyMDVfNDg1NjIzNDAzXzFfaGQ3MzBfOTUx_s.jpg', '蕊。  瑞儿', 'F', '', '无人再爱\n无人被爱', '520.0', 'https://live4.static.yximgs.com/live/game/screenshot/Sw1OGnKrDlg~1649567801710~1', null, null, '0', '2022-04-10 13:16:41', '2022-04-10 13:16:41');
INSERT INTO `t_anchor` VALUES ('9918', '1747320061', '', 'http://p4.a.yximgs.com/uhead/AB/2022/01/18/10/BMjAyMjAxMTgxMDA3NTlfMTc0NzMyMDA2MV8yX2hkMjY4XzkyMQ==_s.jpg', '大同最丑的二老板', 'F', '', '', '476.0', 'https://live4.static.yximgs.com/live/game/screenshot/u8Rab__uaMI~1649567801915~1', null, null, '0', '2022-04-10 13:16:41', '2022-04-10 13:16:41');
INSERT INTO `t_anchor` VALUES ('9919', '810021427', 'erhu218323', 'http://p2.a.yximgs.com/uhead/AB/2020/09/21/19/BMjAyMDA5MjExOTM3MDdfODEwMDIxNDI3XzJfaGQxNl8zMw==_s.jpg', '二胡芳芳~218', 'F', '', '随缘播，欢迎大家来直播间观看！感谢支持', '441.0', 'https://live4.static.yximgs.com/live/game/screenshot/jXQtdEw5u6I~1649567801969~1', null, null, '0', '2022-04-10 13:16:41', '2022-04-10 13:16:41');
INSERT INTO `t_anchor` VALUES ('9920', '198000939', 'KS13209885789', 'http://p4.a.yximgs.com/uhead/AB/2021/12/19/19/BMjAyMTEyMTkxOTI0NDNfMTk4MDAwOTM5XzJfaGQ1NDZfNjUz_s.jpg', '箭军四爷', 'M', '', '做好自己的事，谁装B放狗咬谁', '398.0', 'https://live1.static.yximgs.com/live/game/screenshot/y6A8g9zdMpI~1649567802248~1', null, null, '0', '2022-04-10 13:16:42', '2022-04-10 13:16:42');
INSERT INTO `t_anchor` VALUES ('9921', '2159341282', '', 'http://tx6.a.kwimgs.com/uhead/AB/2022/02/27/22/BMjAyMjAyMjcyMjU1MjlfMjE1OTM0MTI4Ml8yX2hkNTRfNDQ5_s.jpg', '懒懒兔', 'F', '', '每天中午12点到下午7点播\n◎别贪心 你不可能什么都有 \n◎别灰心 你不可能什么都没有', '389.0', 'https://live2.static.yximgs.com/live/game/screenshot/MzOgd9RBQjU~1649567802306~1', null, null, '0', '2022-04-10 13:16:42', '2022-04-10 13:16:42');
INSERT INTO `t_anchor` VALUES ('9922', '1489307640', 'ab196128', 'http://p4.a.yximgs.com/uhead/AB/2019/11/09/02/BMjAxOTExMDkwMjU5NDVfMTQ4OTMwNzY0MF8yX2hkMzEzXzYzNg==_s.jpg', '大同二囊', 'M', '', '花好月圆', '360.0', 'https://live1.static.yximgs.com/live/game/screenshot/Pf9txFjduIY~1649567802509~1', null, null, '0', '2022-04-10 13:16:42', '2022-04-10 13:16:42');
INSERT INTO `t_anchor` VALUES ('9923', '12825130', 'dashu2422900', 'http://p2.a.yximgs.com/uhead/AB/2020/08/03/11/BMjAyMDA4MDMxMTUwMjBfMTI4MjUxMzBfMV9oZDc4OF8zMTE=_s.jpg', '老高-40大叔', 'M', '', '恒洁卫浴专卖店，地址小店坞城南路大运金丰装饰城一层。晚上直播王者荣耀全网第一40大叔玩关羽，我说第二没人敢说第一，巅峰赛2000+，单排百星的大叔，感谢大家关注，谢谢大家！', '329.0', 'https://live3.static.yximgs.com/live/game/screenshot/l2RyuE8zkQM~1649567802768~1', null, null, '0', '2022-04-10 13:16:42', '2022-04-10 13:16:42');
INSERT INTO `t_anchor` VALUES ('9924', '558676431', 'jmfks666', 'http://p2.a.yximgs.com/uhead/AB/2022/03/09/20/BMjAyMjAzMDkyMDU5MTdfNTU4Njc2NDMxXzJfaGQ1NzhfNTQ=_s.jpg', '坏小幺', 'F', '', '你要相信，总会有人就喜欢你笨笨的样子，肉肉的肚子，圆圆的脸蛋，疯疯癫癫的样子，无理取闹的性格，最重要的是，他不会因为你经常说反话就离开你', '310.0', 'https://live4.static.yximgs.com/live/game/screenshot/mAVdKm0SW8I~1649567803032~1', null, null, '0', '2022-04-10 13:16:43', '2022-04-10 13:16:43');
INSERT INTO `t_anchor` VALUES ('9925', '778809619', 'erming8806', 'http://p2.a.yximgs.com/uhead/AB/2019/05/11/18/BMjAxOTA1MTExODIyMDNfNzc4ODA5NjE5XzJfaGQ5MDBfNzY3_s.jpg', '二明弹唱', 'M', '', '15835821445......15513588806，，，15135833294', '305.0', 'https://live2.static.yximgs.com/live/game/screenshot/eM6bnXC4efY~1649567803085~1', null, null, '0', '2022-04-10 13:16:43', '2022-04-10 13:16:43');
INSERT INTO `t_anchor` VALUES ('9926', '331873275', 'baironping520', 'http://p5.a.yximgs.com/uhead/AB/2021/12/01/20/BMjAyMTEyMDEyMDUyNTNfMzMxODczMjc1XzFfaGQzNjlfODQy_s.jpg', '胖丫《唱山曲》', 'F', '', '我是一名普普通通的女人，来自山西大同偶尔一个机会喜欢上了门楼调，酸曲，二人台，\n感谢快手平台让我能够展示我的才艺 \n同时认识这么多的新老朋友\n感谢你们对我的支持，谢谢', '303.0', 'https://live2.static.yximgs.com/live/game/screenshot/tY0JoKYhc60~1649567803141~1', null, null, '0', '2022-04-10 13:16:43', '2022-04-10 13:16:43');
INSERT INTO `t_anchor` VALUES ('9927', '402475462', 'qqwq5080', 'http://p4.a.yximgs.com/uhead/AB/2021/10/15/10/BMjAyMTEwMTUxMDQwMDhfNDAyNDc1NDYyXzJfaGQ5MzdfNzg4_s.jpg', '香玲～', 'F', '', '', '301.0', 'https://live1.static.yximgs.com/live/game/screenshot/InFjJEupMgw~1649567803268~1', null, null, '0', '2022-04-10 13:16:43', '2022-04-10 13:16:43');
INSERT INTO `t_anchor` VALUES ('9928', '891385595', '', 'http://tx6.a.kwimgs.com/uhead/AB/2022/01/06/19/BMjAyMjAxMDYxOTUzMzVfODkxMzg1NTk1XzJfaGQyODFfODQ3_s.jpg', '单身小妮子，', 'F', '', '我是离婚的女人独自带着一个孩子，我和孩子相依为命，我们在外租房子住，因为离异被好多人看不起，孩子还小离不开人的照顾，我真的坚持的好累，好想有个依靠，真心的找个以结婚为目的的男士，穷点也没关系，没车也没关系，只要有房就行，我相信只要人正直，能吃苦，一起努力，以后什么都会有，接受二婚，接受外地，不建议长相，因为我也一般，彩礼随意，只要你能接受孩子，我就跟你\n我要的爱情从不是物质而是一个踏实的家，一个爱我的人，每晚8点直播，只为寻找有缘人\n深情不及久伴，厚爱无需多言。', '301.0', 'https://live3.static.yximgs.com/live/game/screenshot/2NWfTYtHARk~1649567803407~1', null, null, '0', '2022-04-10 13:16:43', '2022-04-10 13:16:43');
INSERT INTO `t_anchor` VALUES ('9929', '449525322', 'loveQQ2188', 'http://p2.a.yximgs.com/uhead/AB/2020/02/22/23/BMjAyMDAyMjIyMzQ5MzBfNDQ5NTI1MzIyXzJfaGQ2NDdfNjQy_s.jpg', '倩芸', 'F', '', '别人笑我太疯癫，我笑他人看不穿\n\n关注了就别取关，只是发作品少而已\n\n慢慢会多的', '300.0', 'https://live3.static.yximgs.com/live/game/screenshot/Yo7jzErgnEk~1649567803467~1', null, null, '0', '2022-04-10 13:16:43', '2022-04-10 13:16:43');
INSERT INTO `t_anchor` VALUES ('9930', '418489342', 'lei18403401091', 'http://p4.a.yximgs.com/uhead/AB/2020/12/14/19/BMjAyMDEyMTQxOTA0MzVfNDE4NDg5MzQyXzJfaGQ5NDBfNjE4_s.jpg', '快乐幸福1314', 'F', '', '', '298.0', 'https://live1.static.yximgs.com/live/game/screenshot/DDUzfGgCQl0~1649567803680~1', null, null, '0', '2022-04-10 13:16:43', '2022-04-10 13:16:43');
INSERT INTO `t_anchor` VALUES ('9931', '345223165', 'w19900209', 'http://p4.a.yximgs.com/uhead/AB/2020/11/11/19/BMjAyMDExMTExOTE5MjFfMzQ1MjIzMTY1XzJfaGQxMTNfNzQ=_s.jpg', 'ゞ沫小陌ぴ918', 'F', '', '盲目的崇拜别人，不如骄傲的欣赏自己。', '298.0', 'https://live1.static.yximgs.com/live/game/screenshot/MaGqAYE1N_A~1649567803808~1', null, null, '0', '2022-04-10 13:16:43', '2022-04-10 13:16:43');
INSERT INTO `t_anchor` VALUES ('9932', '716030064', 'WylJiaYouAiNi2222222', 'http://p4.a.yximgs.com/uhead/AB/2021/10/11/03/BMjAyMTEwMTEwMzA3NDdfNzE2MDMwMDY0XzFfaGQ3NDZfNjYx_s.jpg', '王小水', 'F', '', '感谢快手平台 \n爱好唱歌跳舞晚上9:00直播\n本人不会像任何人主动要红包和转账，防止受骗。\n心怀感恩，所遇皆温柔，感恩所有的相遇和陪伴，感谢生活有剥夺也有赠予，遇见都是天意，拥有都是幸运，不谈亏欠，感恩遇见。', '253.0', 'https://live3.static.yximgs.com/live/game/screenshot/V-tArMQFKNo~1649567804091~1', null, null, '0', '2022-04-10 13:16:44', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9933', '797444026', 'bp6889999', 'http://p2.a.yximgs.com/uhead/AB/2022/02/28/13/BMjAyMjAyMjgxMzI0NDRfNzk3NDQ0MDI2XzJfaGQ3MTBfMzMy_s.jpg', '晋城 九妹68998', 'F', '', '人的动力来源于兴趣和耻辱，加油致自已\n\n如果你没瞎就不要用耳朵来了解我   能力有多大舞台就有多大', '243.0', 'https://live3.static.yximgs.com/live/game/screenshot/oIf-lNT8IBM~1649567804308~1', null, null, '0', '2022-04-10 13:16:44', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9934', '769250642', 'SX369452', 'http://p4.a.yximgs.com/uhead/AB/2022/02/26/22/BMjAyMjAyMjYyMjU3MDRfNzY5MjUwNjQyXzJfaGQzNDhfNTc2_s.jpg', '缘缘生活号', 'F', '', '喜欢我的朋友双击加关注，谢谢', '243.0', 'https://live3.static.yximgs.com/live/game/screenshot/CpBlPsymz7g~1649567804367~1', null, null, '0', '2022-04-10 13:16:44', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9935', '669597150', '', 'http://p4.a.yximgs.com/uhead/AB/2021/02/24/13/BMjAyMTAyMjQxMzE0NTdfNjY5NTk3MTUwXzJfaGQxODJfNjQ0_s.jpg', '丁派传人韩秀瑞', 'F', '', '丁派传人阎慧贞老师弟子，感谢快手平台，让我在这里欣赏到好多名家老师的直播！！！', '235.0', 'https://live2.static.yximgs.com/live/game/screenshot/1Vw_iyt0G7I~1649567804499~1', null, null, '0', '2022-04-10 13:16:44', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9936', '1037214130', 'hm13546796115', 'http://p2.a.yximgs.com/uhead/AB/2018/10/20/19/BMjAxODEwMjAxOTIxMzJfMTAzNzIxNDEzMF8xX2hkNzg0XzE0NQ==_s.jpg', '山西虎妈（小小号）333', 'F', '', '美女们有想变美变漂亮的找我们韩老师明智的选择，韩老师…V 735901552', '234.0', 'https://live1.static.yximgs.com/live/game/screenshot/Q_GLZtJoMPg~1649567804558~1', null, null, '0', '2022-04-10 13:16:44', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9937', '746253260', 'ABC102100', 'http://p4.a.yximgs.com/uhead/AB/2020/11/01/22/BMjAyMDExMDEyMjMxMDlfNzQ2MjUzMjYwXzJfaGQxMV8z_s.jpg', '宝贝丽姐', 'F', '', '谢谢官方给我这么好的平台。关注了就不要取关啦，每天中午一点，晚上八点开播，大家关注我小号，大同丽妹我小，感谢有你，感谢陪伴。', '228.0', 'https://live4.static.yximgs.com/live/game/screenshot/0iWF5JJJWpw~1649567804687~1', null, null, '0', '2022-04-10 13:16:44', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9938', '331937526', 'w33197526', 'http://p2.a.yximgs.com/uhead/AB/2021/09/25/18/BMjAyMTA5MjUxODAyMDFfMzMxOTM3NTI2XzFfaGQzOTNfNTg4_s.jpg', '王 小 莹  !!', 'F', '', '', '225.0', 'https://live1.static.yximgs.com/live/game/screenshot/cjhwbkwyfus~1649567804741~1', null, null, '0', '2022-04-10 13:16:44', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9939', '1769434449', 'xiaoxong8557', 'http://p4.a.yximgs.com/uhead/AB/2022/03/10/00/BMjAyMjAzMTAwMDQ0MjVfMTc2OTQzNDQ0OV8xX2hkNzQyXzE2NA==_s.jpg', '枭雄·气质男人', 'M', '', '同款1号店:W88AAW(本人回复）\n感谢官方推送\n举大旗出视频私9.99', '223.0', 'https://live3.static.yximgs.com/live/game/screenshot/NF9SFj3u_n0~1649567804794~1', null, null, '0', '2022-04-10 13:16:44', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9940', '454666719', '', 'http://p2.a.yximgs.com/uhead/AB/2020/01/31/02/BMjAyMDAxMzEwMjI3MjNfNDU0NjY2NzE5XzJfaGQ4MDJfMTIy_s.jpg', '梅娘子', 'F', '', '除了真心我什么都给不了你    可你偏偏不要……', '219.0', 'https://live1.static.yximgs.com/live/game/screenshot/bTZTAD2NLqI~1649567804857~1', null, null, '0', '2022-04-10 13:16:44', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9941', '578156332', 'w2318959563', 'http://p2.a.yximgs.com/uhead/AB/2021/06/23/10/BMjAyMTA2MjMxMDI2MjlfNTc4MTU2MzMyXzJfaGQ1MTNfMjMx_s.jpg', '开心521果', 'F', '', '', '216.0', 'https://live3.static.yximgs.com/live/game/screenshot/XC9DHbRoAaA~1649567804986~1', null, null, '0', '2022-04-10 13:16:44', '2022-04-10 13:16:44');
INSERT INTO `t_anchor` VALUES ('9942', '2285011801', '', 'http://p2.a.yximgs.com/uhead/AB/2022/01/21/06/BMjAyMjAxMjEwNjQ5MzZfMjI4NTAxMTgwMV8yX2hkMjY0Xzk3MA==_s.jpg', '我在红尘中修行', 'M', '', '。', '212.0', 'https://live1.static.yximgs.com/live/game/screenshot/Xi0TbbXwzwY~1649567805184~1', null, null, '0', '2022-04-10 13:16:45', '2022-04-10 13:16:45');
INSERT INTO `t_anchor` VALUES ('9943', '1890457992', 'mosheng9988', 'http://tx6.a.kwimgs.com/uhead/AB/2021/12/18/22/BMjAyMTEyMTgyMjM4MjhfMTg5MDQ1Nzk5Ml8xX2hkNzkxXzkzNw==_s.jpg', '甲子和平精英', 'M', '', 'MG俱乐部：MG33303（备注来意）\n 每天早上8点到晚上11点全天自定义带粉', '211.0', 'https://live1.static.yximgs.com/live/game/screenshot/LKA5417V6ow~1649567805245~1', null, null, '0', '2022-04-10 13:16:45', '2022-04-10 13:16:45');
INSERT INTO `t_anchor` VALUES ('9944', '1012852574', 'yy2240650886', 'http://p5.a.yximgs.com/uhead/AB/2019/04/20/20/BMjAxOTA0MjAyMDMyNTZfMTAxMjg1MjU3NF8yX2hkNjJfOTQ0_s.jpg', '莉美人（小号）', 'F', '', '每天不定时直播！\n\n快手唯一小号搜索 莉美人小号:yy2240650886\n \n不忘初心，方得始终！', '210.0', 'https://live3.static.yximgs.com/live/game/screenshot/BeSOF1274OA~1649567805374~1', null, null, '0', '2022-04-10 13:16:45', '2022-04-10 13:16:45');
INSERT INTO `t_anchor` VALUES ('9945', '1871026773', '', 'http://p5.a.yximgs.com/uhead/AB/2021/10/19/16/BMjAyMTEwMTkxNjUwMTdfMTg3MTAyNjc3M18yX2hkNjMzXzc4NA==_s.jpg', '农村人王芝明', 'M', '', '', '209.0', 'https://live2.static.yximgs.com/live/game/screenshot/P3mj3J441x0~1649567805503~1', null, null, '0', '2022-04-10 13:16:45', '2022-04-10 13:16:45');
INSERT INTO `t_anchor` VALUES ('9946', '2460613853', '', 'http://p4.a.yximgs.com/uhead/AB/2021/08/20/14/BMjAyMTA4MjAxNDM3MjZfMjQ2MDYxMzg1M18yX2hkNjI3XzE3NQ==_s.jpg', '豆豆', 'F', '', '', '208.0', 'https://live3.static.yximgs.com/live/game/screenshot/F9T89oz0ZLY~1649567805562~1', null, null, '0', '2022-04-10 13:16:45', '2022-04-10 13:16:45');
INSERT INTO `t_anchor` VALUES ('9947', '434645584', 'Fgg-2157', 'http://tx6.a.kwimgs.com/uhead/AB/2022/02/15/08/BMjAyMjAyMTUwODU5NTZfNDM0NjQ1NTg0XzJfaGQ2NDZfODA0_s.jpg', '温婉的鸡蛋面', 'F', '', '最好的安全感，是你的优秀！', '208.0', 'https://live3.static.yximgs.com/live/game/screenshot/Vt8iQbWLdqI~1649567805628~1', null, null, '0', '2022-04-10 13:16:45', '2022-04-10 13:16:45');
INSERT INTO `t_anchor` VALUES ('9948', '1958642025', 'fkmj668899', 'http://p2.a.yximgs.com/uhead/AB/2021/12/16/11/BMjAyMTEyMTYxMTAzMTFfMTk1ODY0MjAyNV8yX2hkMzk2Xzg3MA==_s.jpg', '开心串串哥', 'M', '', '不听说假话的我，实话实说，以人做人，以事做事，', '208.0', 'https://live2.static.yximgs.com/live/game/screenshot/EbaPTkpWEXc~1649567805773~1', null, null, '0', '2022-04-10 13:16:45', '2022-04-10 13:16:45');

-- ----------------------------
-- Table structure for t_config
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE "t_config" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "f_region_name" varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '主播过滤：地区名称',
  "f_region_sex" varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主播过滤：性别  F 女  M 男',
  "f_tycoon_sex" varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '土豪过滤：性别  F 女  M 男',
  "f_tycoon_grade1" int(10) DEFAULT NULL COMMENT '土豪过滤：等级 小',
  "f_tycoon_grade2" int(10) DEFAULT 0 COMMENT '土豪过滤：等级  大',
  "f_tycoon_money1" double(12,2) DEFAULT 0.00 COMMENT '土豪过滤：金额  小',
  "f_tycoon_money2" double(12,2) DEFAULT 0.00 COMMENT '土豪过滤：金额  大',
  "f_tycoon_time" datetime DEFAULT current_timestamp() COMMENT '上次土豪获取次数刷新时间',
  PRIMARY KEY ("id")
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_config
-- ----------------------------
INSERT INTO `t_config` VALUES ('1', '山西', 'F', 'M', '10', '300', '100.00', '9999999.00', '2022-04-10 18:57:48');

-- ----------------------------
-- Table structure for t_journal
-- ----------------------------
DROP TABLE IF EXISTS `t_journal`;
CREATE TABLE "t_journal" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "f_type" int(11) DEFAULT 0 COMMENT '操作类型：1分配，2采集',
  "f_operation_event" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作事件',
  "f_time" datetime DEFAULT current_timestamp() COMMENT '操作时间',
  PRIMARY KEY ("id")
) ENGINE=MyISAM AUTO_INCREMENT=1102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_journal
-- ----------------------------
INSERT INTO `t_journal` VALUES ('1101', '2', '采集 山西榜 完成.....', '2022-04-10 13:16:45');
INSERT INTO `t_journal` VALUES ('1100', '2', '采集 山西榜 中.....', '2022-04-10 13:16:37');
INSERT INTO `t_journal` VALUES ('1099', '2', '获取配置完成...', '2022-04-10 13:16:37');
INSERT INTO `t_journal` VALUES ('1098', '2', '获取配置中...', '2022-04-10 13:16:37');
INSERT INTO `t_journal` VALUES ('1097', '2', '开始执行！', '2022-04-10 13:16:36');
INSERT INTO `t_journal` VALUES ('1096', '2', '初始化程序完成！', '2022-04-10 13:16:36');
INSERT INTO `t_journal` VALUES ('1095', '2', '初始化程序中....', '2022-04-10 13:16:35');
INSERT INTO `t_journal` VALUES ('1094', '2', '采集 江苏榜 中.....', '2022-04-10 13:08:21');
INSERT INTO `t_journal` VALUES ('1093', '2', '采集 山西榜 完成.....', '2022-04-10 13:08:19');
INSERT INTO `t_journal` VALUES ('1092', '2', '采集 山西榜 中.....', '2022-04-10 13:08:11');
INSERT INTO `t_journal` VALUES ('1091', '2', '获取配置完成...', '2022-04-10 13:08:11');
INSERT INTO `t_journal` VALUES ('1090', '2', '获取配置中...', '2022-04-10 13:08:11');
INSERT INTO `t_journal` VALUES ('1089', '2', '开始执行！', '2022-04-10 13:08:11');
INSERT INTO `t_journal` VALUES ('1088', '2', '初始化程序完成！', '2022-04-10 13:08:11');
INSERT INTO `t_journal` VALUES ('1087', '2', '初始化程序中....', '2022-04-10 13:08:10');
INSERT INTO `t_journal` VALUES ('1086', '2', '低于20分不采集,等待1分钟后再次尝试采集....', '2022-04-10 13:07:41');
INSERT INTO `t_journal` VALUES ('1085', '2', '开始执行！', '2022-04-10 13:07:41');
INSERT INTO `t_journal` VALUES ('1084', '2', '初始化程序完成！', '2022-04-10 13:07:41');
INSERT INTO `t_journal` VALUES ('1083', '2', '初始化程序中....', '2022-04-10 13:07:39');
INSERT INTO `t_journal` VALUES ('1082', '2', '采集 北京榜 中.....', '2022-04-10 11:21:15');
INSERT INTO `t_journal` VALUES ('1081', '2', '采集 江苏榜 完成.....', '2022-04-10 11:21:13');
INSERT INTO `t_journal` VALUES ('1080', '2', '采集 江苏榜 中.....', '2022-04-10 11:21:05');
INSERT INTO `t_journal` VALUES ('1079', '2', '采集 山西榜 完成.....', '2022-04-10 11:21:03');
INSERT INTO `t_journal` VALUES ('1078', '2', '采集 山西榜 中.....', '2022-04-10 11:20:55');
INSERT INTO `t_journal` VALUES ('1077', '2', '获取配置完成...', '2022-04-10 11:20:55');
INSERT INTO `t_journal` VALUES ('1076', '2', '获取配置中...', '2022-04-10 11:20:55');
INSERT INTO `t_journal` VALUES ('1075', '2', '开始执行！', '2022-04-10 11:20:55');
INSERT INTO `t_journal` VALUES ('1074', '2', '初始化程序完成！', '2022-04-10 11:20:55');
INSERT INTO `t_journal` VALUES ('1073', '2', '初始化程序中....', '2022-04-10 11:20:54');
INSERT INTO `t_journal` VALUES ('1072', '2', '采集 广西榜 中.....', '2022-04-10 09:50:43');
INSERT INTO `t_journal` VALUES ('1071', '2', '采集 福建榜 完成.....', '2022-04-10 09:50:41');
INSERT INTO `t_journal` VALUES ('1070', '2', '获取土豪榜《南波兔（第五人格）》 成功 0', '2022-04-10 09:50:37');
INSERT INTO `t_journal` VALUES ('1069', '2', '获取土豪榜《你的糖宝°》 成功 0', '2022-04-10 09:50:36');
INSERT INTO `t_journal` VALUES ('1068', '2', '采集 福建榜 中.....', '2022-04-10 09:50:33');
INSERT INTO `t_journal` VALUES ('1067', '2', '采集 重庆榜 完成.....', '2022-04-10 09:50:31');
INSERT INTO `t_journal` VALUES ('1066', '2', '获取土豪榜《竹笋哥|仙果镖局》 成功 0', '2022-04-10 09:50:30');
INSERT INTO `t_journal` VALUES ('1065', '2', '获取土豪榜《一帆喜欢揍达达》 成功 0', '2022-04-10 09:50:29');
INSERT INTO `t_journal` VALUES ('1064', '2', '获取土豪榜《才才和平精英》 成功 0', '2022-04-10 09:50:29');
INSERT INTO `t_journal` VALUES ('1063', '2', '获取土豪榜《飞飞妹妹来了＠》 成功 0', '2022-04-10 09:50:28');
INSERT INTO `t_journal` VALUES ('1062', '2', '获取土豪榜《传奇中本聪》 成功 0', '2022-04-10 09:50:26');
INSERT INTO `t_journal` VALUES ('1061', '2', '获取土豪榜《没事无聊《破残局》》 成功 0', '2022-04-10 09:50:25');
INSERT INTO `t_journal` VALUES ('1060', '2', '获取土豪榜《开心果果》 成功 0', '2022-04-10 09:50:23');
INSERT INTO `t_journal` VALUES ('1059', '2', '获取土豪榜《偷心集团》 成功 0', '2022-04-10 09:50:22');
INSERT INTO `t_journal` VALUES ('1058', '2', '获取土豪榜《媄君v》 成功 0', '2022-04-10 09:50:21');
INSERT INTO `t_journal` VALUES ('1057', '2', '采集 重庆榜 中.....', '2022-04-10 09:50:19');
INSERT INTO `t_journal` VALUES ('1056', '2', '采集 上海榜 完成.....', '2022-04-10 09:50:17');
INSERT INTO `t_journal` VALUES ('1055', '2', '获取土豪榜《燕-楠》 成功 0', '2022-04-10 09:50:16');
INSERT INTO `t_journal` VALUES ('1054', '2', '获取土豪榜《无心姐姐3607》 成功 0', '2022-04-10 09:50:13');
INSERT INTO `t_journal` VALUES ('1053', '2', '获取土豪榜《坦闪〓中指哥〓》 成功 0', '2022-04-10 09:50:12');
INSERT INTO `t_journal` VALUES ('1052', '2', '获取土豪榜《猫小妖。》 成功 0', '2022-04-10 09:50:10');
INSERT INTO `t_journal` VALUES ('1051', '2', '获取土豪榜《602你的女友》 成功 0', '2022-04-10 09:50:10');
INSERT INTO `t_journal` VALUES ('1050', '2', '获取土豪榜《YX-星夜男友/招主持》 成功 0', '2022-04-10 09:50:09');
INSERT INTO `t_journal` VALUES ('1049', '2', '采集 上海榜 中.....', '2022-04-10 09:50:07');
INSERT INTO `t_journal` VALUES ('1048', '2', '采集 北京榜 完成.....', '2022-04-10 09:50:05');
INSERT INTO `t_journal` VALUES ('1047', '2', '获取土豪榜《果教主欢乐斗地主》 成功 0', '2022-04-10 09:50:01');
INSERT INTO `t_journal` VALUES ('1046', '2', '获取土豪榜《刘大美说实话》 成功 0', '2022-04-10 09:50:00');
INSERT INTO `t_journal` VALUES ('1045', '2', '获取土豪榜《厂区招工就业安排》 成功 0', '2022-04-10 09:50:00');
INSERT INTO `t_journal` VALUES ('1044', '2', '获取土豪榜《三月（手写）》 成功 0', '2022-04-10 09:49:59');
INSERT INTO `t_journal` VALUES ('1043', '2', '获取土豪榜《YX-正牌女友广广》 成功 0', '2022-04-10 09:49:58');
INSERT INTO `t_journal` VALUES ('1042', '2', '获取土豪榜《岁月！！32》 成功 1', '2022-04-10 09:49:57');
INSERT INTO `t_journal` VALUES ('1041', '2', '获取土豪榜《北京嘉秀女团--酒儿》 成功 1', '2022-04-10 09:49:56');
INSERT INTO `t_journal` VALUES ('1040', '2', '采集 北京榜 中.....', '2022-04-10 09:49:54');
INSERT INTO `t_journal` VALUES ('1039', '2', '采集 江苏榜 完成.....', '2022-04-10 09:49:52');
INSERT INTO `t_journal` VALUES ('1038', '2', '获取土豪榜《月姐帮你牵红线》 成功 0', '2022-04-10 09:49:49');
INSERT INTO `t_journal` VALUES ('1037', '2', '获取土豪榜《达达、没腹肌》 成功 0', '2022-04-10 09:49:47');
INSERT INTO `t_journal` VALUES ('1036', '2', '获取土豪榜《将军》 成功 0', '2022-04-10 09:49:46');
INSERT INTO `t_journal` VALUES ('1035', '2', '采集 江苏榜 中.....', '2022-04-10 09:49:43');
INSERT INTO `t_journal` VALUES ('1034', '2', '采集 山西榜 完成.....', '2022-04-10 09:49:41');
INSERT INTO `t_journal` VALUES ('1033', '2', '获取土豪榜《糖果大姐（原创）》 成功 0', '2022-04-10 09:49:41');
INSERT INTO `t_journal` VALUES ('1032', '2', '获取土豪榜《Miss赵璐大脸璐》 成功 1', '2022-04-10 09:49:36');
INSERT INTO `t_journal` VALUES ('1031', '2', '获取土豪榜《秀宝～爱唱歌》 成功 0', '2022-04-10 09:49:35');
INSERT INTO `t_journal` VALUES ('1030', '2', '获取土豪榜《H.心上人xy主持++》 成功 1', '2022-04-10 09:49:33');
INSERT INTO `t_journal` VALUES ('1029', '2', '采集 山西榜 中.....', '2022-04-10 09:49:31');
INSERT INTO `t_journal` VALUES ('1028', '2', '获取配置完成...', '2022-04-10 09:49:31');
INSERT INTO `t_journal` VALUES ('1026', '2', '开始执行！', '2022-04-10 09:49:30');
INSERT INTO `t_journal` VALUES ('1027', '2', '获取配置中...', '2022-04-10 09:49:30');
INSERT INTO `t_journal` VALUES ('1025', '2', '初始化程序完成！', '2022-04-10 09:49:30');
INSERT INTO `t_journal` VALUES ('1024', '2', '初始化程序中....', '2022-04-10 09:49:29');
INSERT INTO `t_journal` VALUES ('1021', '2', '获取土豪榜《梅子·在水一方》 成功 0', '2022-04-10 09:11:45');
INSERT INTO `t_journal` VALUES ('1020', '2', '获取土豪榜《九哥说媒正能量666》 成功 0', '2022-04-10 09:11:42');
INSERT INTO `t_journal` VALUES ('1019', '2', '获取土豪榜《达达、没腹肌》 成功 0', '2022-04-10 09:11:41');
INSERT INTO `t_journal` VALUES ('1018', '2', '获取土豪榜《将军》 成功 0', '2022-04-10 09:11:39');
INSERT INTO `t_journal` VALUES ('1017', '2', '获取主播榜地区不符合重新采集....', '2022-04-10 09:11:37');
INSERT INTO `t_journal` VALUES ('1016', '2', '采集 江苏榜 中.....', '2022-04-10 09:11:36');
INSERT INTO `t_journal` VALUES ('1015', '2', '采集 山西榜 完成.....', '2022-04-10 09:11:34');
INSERT INTO `t_journal` VALUES ('1014', '2', '获取土豪榜《秀宝～爱唱歌》 成功 0', '2022-04-10 09:11:28');
INSERT INTO `t_journal` VALUES ('1013', '2', '采集 山西榜 中.....', '2022-04-10 09:11:25');
INSERT INTO `t_journal` VALUES ('1012', '2', '获取配置完成...', '2022-04-10 09:11:25');
INSERT INTO `t_journal` VALUES ('1011', '2', '获取配置中...', '2022-04-10 09:11:25');
INSERT INTO `t_journal` VALUES ('1010', '2', '开始执行！', '2022-04-10 09:11:25');
INSERT INTO `t_journal` VALUES ('1009', '2', '初始化程序完成！', '2022-04-10 09:11:25');
INSERT INTO `t_journal` VALUES ('1008', '2', '初始化程序中....', '2022-04-10 09:11:23');

-- ----------------------------
-- Table structure for t_region
-- ----------------------------
DROP TABLE IF EXISTS `t_region`;
CREATE TABLE "t_region" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "f_region_id" int(11) DEFAULT NULL COMMENT '地区id',
  "f_name" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地区名称',
  PRIMARY KEY ("id"),
  UNIQUE KEY "f_region_id" ("f_region_id") USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_region
-- ----------------------------
INSERT INTO `t_region` VALUES ('1', '0', '全部');
INSERT INTO `t_region` VALUES ('2', '1', '北京');
INSERT INTO `t_region` VALUES ('3', '2', '上海');
INSERT INTO `t_region` VALUES ('4', '3', '天津');
INSERT INTO `t_region` VALUES ('5', '4', '重庆');
INSERT INTO `t_region` VALUES ('6', '5', '河北');
INSERT INTO `t_region` VALUES ('7', '6', '山西');
INSERT INTO `t_region` VALUES ('8', '7', '内蒙古');
INSERT INTO `t_region` VALUES ('9', '8', '辽宁');
INSERT INTO `t_region` VALUES ('10', '9', '吉林');
INSERT INTO `t_region` VALUES ('11', '10', '黑龙江');
INSERT INTO `t_region` VALUES ('12', '11', '江苏');
INSERT INTO `t_region` VALUES ('13', '12', '浙江');
INSERT INTO `t_region` VALUES ('14', '13', '安徽');
INSERT INTO `t_region` VALUES ('15', '14', '福建');
INSERT INTO `t_region` VALUES ('16', '15', '江西');
INSERT INTO `t_region` VALUES ('17', '16', '山东');
INSERT INTO `t_region` VALUES ('18', '17', '河南');
INSERT INTO `t_region` VALUES ('19', '18', '湖北');
INSERT INTO `t_region` VALUES ('20', '19', '湖南');
INSERT INTO `t_region` VALUES ('21', '20', '广东');
INSERT INTO `t_region` VALUES ('22', '21', '广西');
INSERT INTO `t_region` VALUES ('23', '22', '海南');
INSERT INTO `t_region` VALUES ('24', '23', '四川');
INSERT INTO `t_region` VALUES ('25', '24', '贵州');
INSERT INTO `t_region` VALUES ('26', '25', '云南');
INSERT INTO `t_region` VALUES ('27', '27', '陕西');
INSERT INTO `t_region` VALUES ('28', '28', '甘肃');
INSERT INTO `t_region` VALUES ('29', '29', '宁夏');
INSERT INTO `t_region` VALUES ('30', '30', '青海');
INSERT INTO `t_region` VALUES ('31', '31', '新疆');
INSERT INTO `t_region` VALUES ('32', '32', '西藏');

-- ----------------------------
-- Table structure for t_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE "t_user_info" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "f_user_login" bigint(18) DEFAULT 0 COMMENT '主播id  登录账号',
  "f_user_pwd" varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '密码',
  "f_name" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主播昵称',
  "f_last_login_ip" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '最后登录ip',
  "f_user_login_count" int(11) DEFAULT 0 COMMENT '登录次数',
  "f_status" int(1) DEFAULT 1 COMMENT '状态  1正常  0异常',
  "f_daily_push_count" int(11) DEFAULT 0 COMMENT '日推数量',
  "f_today_push_count" int(11) DEFAULT 0 COMMENT '今日已推',
  "f_history_push_count" int(11) DEFAULT 0 COMMENT '历史总推',
  "f_not_viewed_count" int(11) DEFAULT 0 COMMENT '已推，未查看',
  "f_time" datetime DEFAULT current_timestamp() COMMENT '添加时间',
  "f_last_login_time" datetime DEFAULT current_timestamp() COMMENT '最后登录时间',
  "f_update_time" datetime DEFAULT current_timestamp() COMMENT '修改时间',
  PRIMARY KEY ("id"),
  UNIQUE KEY "f_user_id" ("f_user_login") USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_user_info
-- ----------------------------
INSERT INTO `t_user_info` VALUES ('1', '253926961', '23124124', '哈哈哈', null, '0', '1', '40', '0', '0', '0', '2022-04-07 15:38:36', null, '2022-04-08 17:30:53');
INSERT INTO `t_user_info` VALUES ('9', '254075271', '4124', '呱呱呱', null, '0', '1', '40', '0', '0', '0', '2022-04-09 09:37:06', null, '2022-04-09 09:37:06');
INSERT INTO `t_user_info` VALUES ('10', '123', '123', '123456', '192.168.1.42', '8', '1', '40', '19', '19', '19', '2022-04-09 14:59:19', '2022-04-10 14:21:42', '2022-04-09 14:59:19');

-- ----------------------------
-- Table structure for t_vulgar_tycoon
-- ----------------------------
DROP TABLE IF EXISTS `t_vulgar_tycoon`;
CREATE TABLE "t_vulgar_tycoon" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "f_user_id" bigint(10) DEFAULT 0 COMMENT 'user_id',
  "f_kwai_id" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '快手ID',
  "f_head" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像',
  "f_name" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像',
  "f_sex" varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别  F 女  M 男',
  "f_works_count" int(11) DEFAULT 0 COMMENT '作品数',
  "f_fan_count" int(11) DEFAULT 0 COMMENT '粉丝数量',
  "f_grade" int(11) DEFAULT 0 COMMENT '等级',
  "f_money" double(12,1) DEFAULT 0.0 COMMENT '金额',
  "f_status" int(1) DEFAULT 1 COMMENT '是否获取状态 1已取  0未取',
  "f_deny_message_flag" int(1) DEFAULT 0 COMMENT '拒绝私信标志，私信 0所有人 1我关注的人 2互关的人  拒绝消息标志',
  "f_privacy_user" int(1) DEFAULT 0 COMMENT '0正常用户   1隐私用户  ',
  "f_time" datetime DEFAULT current_timestamp() COMMENT '添加时间',
  "f_update_time" datetime DEFAULT NULL COMMENT '修改时间',
  "f_extract_user_id" bigint(15) DEFAULT NULL COMMENT '提取用户的userid',
  "f_extract_time" datetime DEFAULT NULL COMMENT '提取时间',
  "f_status_user" int(11) DEFAULT 0 COMMENT '提取后是否查看  0未查看   1已经',
  PRIMARY KEY ("id"),
  UNIQUE KEY "f_user_id" ("f_user_id") USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1732 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_vulgar_tycoon
-- ----------------------------
INSERT INTO `t_vulgar_tycoon` VALUES ('1641', '1295529882', 'sfxko6818808', 'http://tx6.a.kwimgs.com/uhead/AB/2022/03/11/19/BMjAyMjAzMTExOTExNTJfMTI5NTUyOTg4Ml8yX2hkODQ1XzU0Nw==_s.jpg', '望月追星569', 'M', '0', '758', '0', '2875.0', '1', '0', '1', '2022-04-09 18:49:08', '2022-04-09 18:55:12', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1642', '107059177', 'zc8723703', 'http://tx6.a.kwimgs.com/uhead/AB/2022/04/04/21/BMjAyMjA0MDQyMTUwMjdfMTA3MDU5MTc3XzJfaGQzMTRfNDg5_s.jpg', '—林：玖—、歌_____', 'M', '10', '379', '0', '1620.0', '0', '1', '0', '2022-04-09 18:49:08', '2022-04-09 18:55:12', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1643', '316772821', 'Lst8710777', 'http://p2.a.yximgs.com/uhead/AB/2022/03/15/12/BMjAyMjAzMTUxMjI4NTFfMzE2NzcyODIxXzJfaGQyNzVfODE4_s.jpg', '少***', 'M', '18', '577', '24', '5696.0', '1', '0', '0', '2022-04-09 18:49:14', '2022-04-09 18:55:13', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1644', '578268233', 'an17358669196', 'http://p2.a.yximgs.com/uhead/AB/2021/10/12/23/BMjAyMTEwMTIyMzU2NTRfNTc4MjY4MjMzXzJfaGQ5OTNfNTMw_s.jpg', '乐乐爱喝阔落', 'M', '0', '473', '33', '3922.0', '1', '0', '0', '2022-04-09 18:49:28', '2022-04-09 18:49:28', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1645', '1484996193', '', 'http://tx6.a.kwimgs.com/uhead/AB/2019/09/03/21/BMjAxOTA5MDMyMTE1NDBfMTQ4NDk5NjE5M18yX2hkNjA2XzI2NQ==_s.jpg', '浮尘0028', 'M', '1', '218', '0', '1470.0', '1', '0', '0', '2022-04-09 18:49:43', '2022-04-09 18:49:43', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1646', '1181128524', '', 'http://p2.a.yximgs.com/uhead/AB/2022/03/19/17/BMjAyMjAzMTkxNzM1MzNfMTE4MTEyODUyNF8yX2hkOTIzXzc4_s.jpg', '龙凤哥378', 'M', '31', '2026', '0', '3090.0', '1', '0', '0', '2022-04-09 18:49:45', '2022-04-09 18:49:45', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1647', '1701134522', '', 'http://p2.a.yximgs.com/uhead/AB/2020/01/22/13/BMjAyMDAxMjIxMzA2NDdfMTcwMTEzNDUyMl8yX2hkNzM4XzU1OA==_s.jpg', '我在梦里拥抱你（欢）', 'M', '2', '35', '12', '1579.0', '1', '0', '0', '2022-04-09 18:49:45', '2022-04-09 18:49:45', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1648', '857432440', '', 'http://p4.a.yximgs.com/uhead/AB/2022/03/24/22/BMjAyMjAzMjQyMjA0MjdfODU3NDMyNDQwXzJfaGQzNjNfMjEw_s.jpg', '丶想在多也没用', 'M', '0', '15', '0', '4364.0', '1', '0', '0', '2022-04-09 18:49:49', '2022-04-09 18:55:37', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1649', '1054327190', 'meiyu1229053245', 'http://tx6.a.kwimgs.com/uhead/AB/2020/10/13/21/BMjAyMDEwMTMyMTUzMTVfMTA1NDMyNzE5MF8yX2hkNDk3XzEz_s.jpg', '久违de你', 'M', '0', '322', '24', '4230.0', '1', '0', '1', '2022-04-09 18:49:50', '2022-04-09 19:16:45', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1650', '2723176934', '', 'http://p2.a.yximgs.com/uhead/AB/2022/01/25/07/BMjAyMjAxMjUwNzQwNTRfMjcyMzE3NjkzNF8xX2hkNzNfODQ5_s.jpg', '臸尊寳', 'M', '0', '1', '0', '6648.0', '0', '2', '1', '2022-04-09 18:49:52', '2022-04-09 18:55:38', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1651', '1116978453', '', 'http://p4.a.yximgs.com/uhead/AB/2021/12/15/21/BMjAyMTEyMTUyMTQ3MjZfMTExNjk3ODQ1M18yX2hkNDQ4Xzk1NA==_s.jpg', 'Oo费列罗oO', 'M', '0', '102', '0', '2199.0', '0', '1', '0', '2022-04-09 18:49:52', '2022-04-09 18:49:52', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1652', '1657793934', 'Mm000123258', 'http://p2.a.yximgs.com/uhead/AB/2021/12/14/07/BMjAyMTEyMTQwNzMyNTVfMTY1Nzc5MzkzNF8xX2hkOThfNjA3_s.jpg', '小老頭 二哥', 'M', '0', '6793', '45', '2956.0', '0', '1', '1', '2022-04-09 18:49:53', '2022-04-09 18:55:40', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1653', '1909965321', 'qaz2303021967', 'http://p2.a.yximgs.com/uhead/AB/2022/02/12/17/BMjAyMjAyMTIxNzE4NDlfMTkwOTk2NTMyMV8yX2hkMjE3XzEwOA==_s.jpg', '于老帅｛107｝', 'M', '75', '21512', '0', '1315.0', '1', '0', '0', '2022-04-09 18:50:05', '2022-04-09 19:17:00', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1654', '2188717616', '', 'http://p2.a.yximgs.com/uhead/AB/2022/01/18/12/BMjAyMjAxMTgxMjIwMDFfMjE4ODcxNzYxNl8yX2hkNDQ0XzU1NA==_s.jpg', '秘境', 'M', '26', '6010', '23', '5862.0', '0', '2', '0', '2022-04-09 18:50:05', '2022-04-09 18:55:53', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1655', '1719897020', 'sych16888', 'http://p2.a.yximgs.com/uhead/AB/2021/11/11/19/BMjAyMTExMTExOTEwMzNfMTcxOTg5NzAyMF8xX2hkNTk2XzYwNg==_s.jpg', '丹丹涛涛升旗小号', 'M', '202', '243364', '46', '3555.0', '1', '0', '0', '2022-04-09 18:50:05', '2022-04-09 19:17:05', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1656', '466023937', '', 'http://p4.a.yximgs.com/uhead/AB/2021/12/09/21/BMjAyMTEyMDkyMTQ5MzVfNDY2MDIzOTM3XzJfaGQxMF81MDU=_s.jpg', '希望疫情早点结没', 'M', '0', '159', '35', '18932.0', '0', '1', '1', '2022-04-09 18:50:07', '2022-04-09 19:16:57', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1657', '1660223053', 'xiaomeng519721', 'http://p4.a.yximgs.com/uhead/AB/2022/03/28/18/BMjAyMjAzMjgxODAwMDJfMTY2MDIyMzA1M18yX2hkODc4XzE5Mw==_s.jpg', '偏偏独爱你', 'M', '0', '8', '0', '2723.0', '0', '2', '0', '2022-04-09 18:50:08', '2022-04-09 18:50:08', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1658', '167574189', 'GHTX_707', 'http://tx6.a.kwimgs.com/uhead/AB/2022/04/07/18/BMjAyMjA0MDcxODI2MDZfMTY3NTc0MTg5XzJfaGQ5MTBfMjMy_s.jpg', '何以解忧，唯有休眠', 'M', '12', '894', '0', '2099.0', '0', '1', '0', '2022-04-09 18:50:10', '2022-04-09 18:55:57', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1659', '1919225146', '', 'http://p4.a.yximgs.com/uhead/AB/2021/10/30/17/BMjAyMTEwMzAxNzE4MzBfMTkxOTIyNTE0Nl8yX2hkNzZfNzEw_s.jpg', '土咔', 'M', '8', '49', '27', '2862.0', '0', '2', '0', '2022-04-09 18:50:11', '2022-04-09 19:17:04', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1660', '2208058544', '', 'http://p4.a.yximgs.com/uhead/AB/2021/03/12/11/BMjAyMTAzMTIxMTU1MjFfMjIwODA1ODU0NF8yX2hkOTU3XzI4NQ==_s.jpg', '西北狼', 'M', '0', '70', '30', '1369.0', '1', '0', '0', '2022-04-09 18:50:12', '2022-04-09 18:56:01', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1661', '682953015', '', 'http://p2.a.yximgs.com/uhead/AB/2022/04/02/15/BMjAyMjA0MDIxNTQ3NTFfNjgyOTUzMDE1XzJfaGQxMjVfNjQ0_s.jpg', '和自己说你好', 'M', '0', '140', '32', '38976.0', '0', '2', '1', '2022-04-09 18:50:24', '2022-04-09 18:56:12', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1662', '1507537438', '', 'http://p4.a.yximgs.com/uhead/AB/2022/03/24/03/BMjAyMjAzMjQwMzAwMjVfMTUwNzUzNzQzOF8yX2hkNDMxXzMwNQ==_s.jpg', 'VS', 'M', '0', '0', '0', '7581.0', '0', '1', '1', '2022-04-09 18:50:26', '2022-04-09 19:17:16', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1663', '446372630', 'yydapeng333', 'http://p2.a.yximgs.com/uhead/AB/2022/02/26/13/BMjAyMjAyMjYxMzQ4MTlfNDQ2MzcyNjMwXzJfaGQyMjJfNzQ1_s.jpg', '阿男', 'M', '1', '346', '0', '1479.0', '1', '0', '0', '2022-04-09 18:50:26', '2022-04-09 18:56:13', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1664', '2830350688', '', 'http://tx6.a.kwimgs.com/uhead/AB/2022/03/28/15/BMjAyMjAzMjgxNTM2MTRfMjgzMDM1MDY4OF8yX2hkNzIyXzY2NQ==_s.jpg', '淼-lnk', 'M', '1', '382', '32', '2763.0', '1', '0', '0', '2022-04-09 18:50:27', '2022-04-09 19:17:21', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1665', '375480952', 'xhbxxx666', 'http://p4.a.yximgs.com/uhead/AB/2021/11/02/20/BMjAyMTExMDIyMDIxMTZfMzc1NDgwOTUyXzJfaGQ4MTRfOTYx_s.jpg', '感谢老铁666，', 'M', '0', '40', '15', '1046.0', '1', '0', '1', '2022-04-09 18:50:27', '2022-04-09 19:17:21', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1666', '404105011', '', 'http://p2.a.yximgs.com/uhead/AB/2022/04/08/11/BMjAyMjA0MDgxMTQ3NDJfNDA0MTA1MDExXzJfaGQ1MjdfMjM=_s.jpg', '^2^2^1南＠戈', 'M', '0', '2358', '57', '1442.0', '0', '2', '1', '2022-04-09 18:50:31', '2022-04-09 18:50:31', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1667', '2099508410', '', 'http://p2.a.yximgs.com/uhead/AB/2021/10/24/20/BMjAyMTEwMjQyMDUwMThfMjA5OTUwODQxMF8yX2hkNDRfMjM5_s.jpg', '眼睛哥', 'M', '1', '160', '27', '4414.0', '1', '0', '0', '2022-04-09 18:50:43', '2022-04-09 18:56:32', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1668', '1263280324', '', 'http://p2.a.yximgs.com/uhead/AB/2021/06/26/12/BMjAyMTA2MjYxMjA3MjJfMTI2MzI4MDMyNF8yX2hkNzcwXzUzOQ==_s.jpg', '憨憨～熊', 'M', '3', '570', '39', '1703.0', '1', '0', '0', '2022-04-09 18:50:43', '2022-04-09 18:56:32', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1669', '2002073794', 'Ds530133807', 'http://tx6.a.kwimgs.com/uhead/AB/2020/07/07/19/BMjAyMDA3MDcxOTA4MzdfMjAwMjA3Mzc5NF8yX2hkMjc5XzM3NQ==_s.jpg', '麻雀', 'M', '3', '288', '35', '8804.0', '1', '0', '0', '2022-04-09 18:50:45', '2022-04-09 19:17:36', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1670', '117045722', '', 'http://p2.a.yximgs.com/uhead/AB/2022/03/23/11/BMjAyMjAzMjMxMTQ4MTBfMTE3MDQ1NzIyXzFfaGQ1MDdfNDA=_s.jpg', '從未放棄', 'M', '0', '583', '0', '1542.0', '1', '0', '1', '2022-04-09 18:50:45', '2022-04-09 19:17:36', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1671', '1912671646', '', 'http://p4.a.yximgs.com/uhead/AB/2022/04/06/23/BMjAyMjA0MDYyMzM3NDRfMTkxMjY3MTY0Nl8yX2hkODM4Xzgx_s.jpg', '美好的回忆', 'M', '2', '1226', '37', '7170.0', '1', '0', '0', '2022-04-09 18:54:35', '2022-04-09 18:54:35', '123', '2022-04-10 18:57:48', '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1672', '1913494501', '', 'http://p2.a.yximgs.com/uhead/AB/2022/04/06/23/BMjAyMjA0MDYyMzMxNTlfMTkxMzQ5NDUwMV8yX2hkNTUxXzQxMw==_s.jpg', '神秘侠客', 'M', '2', '200', '31', '1000.0', '0', '0', '0', '2022-04-09 18:54:35', '2022-04-09 18:54:35', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1673', '1467590126', 'wsh135970', 'http://p2.a.yximgs.com/uhead/AB/2022/03/11/20/BMjAyMjAzMTEyMDU5MDBfMTQ2NzU5MDEyNl8yX2hkODUxXzExNQ==_s.jpg', 'KLtGG', 'M', '7', '122', '24', '1999.0', '0', '0', '0', '2022-04-09 18:55:14', '2022-04-09 19:16:21', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1674', '806851828', '', 'http://p2.a.yximgs.com/uhead/AB/2021/11/13/17/BMjAyMTExMTMxNzQ3NTJfODA2ODUxODI4XzJfaGQ5ODlfNDEy_s.jpg', '幕布', 'M', '0', '73', '21', '1000.0', '0', '2', '0', '2022-04-09 18:55:34', '2022-04-09 19:13:58', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1675', '929815002', 'zsq9988776655', 'http://p2.a.yximgs.com/uhead/AB/2022/02/09/15/BMjAyMjAyMDkxNTQyNTdfOTI5ODE1MDAyXzJfaGQ4NDhfNjcy_s.jpg', '冰墩墩雪蓉蓉福娃', 'M', '10', '480', '23', '2094.0', '0', '0', '0', '2022-04-09 18:55:42', '2022-04-09 18:55:42', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1676', '767521748', '', 'http://p4.a.yximgs.com/uhead/AB/2019/06/15/00/BMjAxOTA2MTUwMDI2NTNfNzY3NTIxNzQ4XzJfaGQ5MjdfMTAy_s.jpg', '康康康仁堂', 'M', '0', '106', '14', '2888.0', '0', '0', '0', '2022-04-09 18:55:56', '2022-04-09 18:55:56', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1677', '662670103', 'gududeyouhun666', 'http://p2.a.yximgs.com/uhead/AB/2022/02/10/16/BMjAyMjAyMTAxNjE5MzZfNjYyNjcwMTAzXzJfaGQ2MDdfNzA2_s.jpg', '修罗', 'M', '2', '1014', '0', '1137.0', '0', '1', '0', '2022-04-09 18:55:57', '2022-04-09 18:55:57', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1678', '104926218', 'H881188H', 'http://p2.a.yximgs.com/uhead/AB/2022/03/12/22/BMjAyMjAzMTIyMjEwNDJfMTA0OTI2MjE4XzJfaGQ0MTlfNTYy_s.jpg', '.***', 'M', '5', '116', '15', '1207.0', '0', '0', '0', '2022-04-09 18:56:01', '2022-04-09 18:56:01', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1679', '1095113780', 'Feng_Yu_Zi_Du', 'http://tx6.a.kwimgs.com/uhead/AB/2020/04/28/02/BMjAyMDA0MjgwMjA2NTZfMTA5NTExMzc4MF8yX2hkODk1XzgyMQ==_s.jpg', '不大不小跟班', 'M', '0', '4', '0', '2974.0', '0', '2', '0', '2022-04-09 18:56:34', '2022-04-09 19:17:37', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1680', '2828872129', 'www_HCQ_com', 'http://p2.a.yximgs.com/uhead/AB/2022/03/26/23/BMjAyMjAzMjYyMzMzMTZfMjgyODg3MjEyOV8xX2hkOTkzXzM2OQ==_s.jpg', 'HCQ好传奇查询站', 'M', '7', '10793', '0', '5776.0', '0', '0', '0', '2022-04-09 18:56:35', '2022-04-09 19:17:51', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1681', '2179759021', 'tm3366518744', 'http://p2.a.yximgs.com/uhead/AB/2022/04/03/21/BMjAyMjA0MDMyMTE3MzJfMjE3OTc1OTAyMV8yX2hkMTQ3Xzk4OA==_s.jpg', '违规巡查（作品审核）北京', 'M', '1', '627', '20', '4049.0', '0', '0', '0', '2022-04-09 18:56:36', '2022-04-09 18:56:36', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1682', '279612606', 'qwe76345239', 'http://p2.a.yximgs.com/uhead/AB/2022/04/03/10/BMjAyMjA0MDMxMDM4MTFfMjc5NjEyNjA2XzFfaGQ1OTdfMzQ5_s.jpg', '冷血魔鬼…', 'M', '0', '4845', '0', '22096.0', '0', '1', '0', '2022-04-09 18:56:53', '2022-04-09 18:56:53', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1683', '837714810', 'C54824752', 'http://p2.a.yximgs.com/uhead/AB/2020/05/27/10/BMjAyMDA1MjcxMDIxMDlfODM3NzE0ODEwXzFfaGQ2MTBfNjc=_s.jpg', '背走贝贝', 'M', '42', '645', '0', '2777.0', '0', '0', '0', '2022-04-09 18:56:53', '2022-04-09 18:56:53', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1684', '2273732047', 'dggdgjffhfry1221556', 'http://p4.a.yximgs.com/uhead/AB/2022/03/12/15/BMjAyMjAzMTIxNTQ2NDVfMjI3MzczMjA0N18yX2hkNzQxXzQ1NA==_s.jpg', '青衫烟雨（舍得马）', 'M', '8', '9621', '43', '2488.0', '0', '0', '0', '2022-04-09 18:57:00', '2022-04-09 18:57:00', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1685', '464882707', '', 'http://p2.a.yximgs.com/uhead/AB/2022/03/23/17/BMjAyMjAzMjMxNzA2NDZfNDY0ODgyNzA3XzJfaGQ2NzhfNDc=_s.jpg', '十、三', 'M', '0', '437', '0', '1035.0', '0', '0', '0', '2022-04-09 18:57:07', '2022-04-09 18:57:07', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1686', '2816938126', '', 'http://p2.a.yximgs.com/uhead/AB/2022/03/27/23/BMjAyMjAzMjcyMzAyNTVfMjgxNjkzODEyNl8yX2hkMjIxXzM0Ng==_s.jpg', '苦中作乐', 'M', '0', '76', '31', '40948.0', '0', '0', '0', '2022-04-09 18:57:13', '2022-04-09 18:57:13', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1687', '2834678141', '', 'http://p4.a.yximgs.com/uhead/AB/2022/04/08/03/BMjAyMjA0MDgwMzM2NDBfMjgzNDY3ODE0MV8xX2hkNzcyXzQ4Mw==_s.jpg', '天无绝人之璐', 'M', '0', '41', '25', '30151.0', '0', '0', '0', '2022-04-09 18:57:13', '2022-04-09 18:57:13', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1688', '126500131', '', 'http://p2.a.yximgs.com/uhead/AB/2022/03/18/12/BMjAyMjAzMTgxMjQ0MTVfMTI2NTAwMTMxXzJfaGQ0ODhfOTQ=_s.jpg', '小丑冰墩墩', 'M', '18', '313', '0', '18175.0', '0', '0', '0', '2022-04-09 18:57:13', '2022-04-09 18:57:13', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1689', '1797822799', 'liuyaxinABC', 'http://p1.a.yximgs.com/uhead/AB/2022/03/31/00/BMjAyMjAzMzEwMDA4MjFfMTc5NzgyMjc5OV8yX2hkNTgzXzczNg==_s.jpg', '天高云淡（刘哥）', 'M', '88', '3289', '0', '1302.0', '0', '0', '0', '2022-04-09 18:57:16', '2022-04-09 18:57:16', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1690', '1771425917', '', 'http://p2.a.yximgs.com/uhead/AB/2022/03/11/23/BMjAyMjAzMTEyMzUwNTFfMTc3MTQyNTkxN18yX2hkNzIwXzY3NQ==_s.jpg', '地狱庸人', 'M', '0', '166', '26', '5776.0', '0', '0', '0', '2022-04-09 18:57:31', '2022-04-09 18:57:31', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1691', '2370561250', '', 'http://p4.a.yximgs.com/uhead/AB/2022/04/06/15/BMjAyMjA0MDYxNTI0NDVfMjM3MDU2MTI1MF8yX2hkODY0XzcwMA==_s.jpg', '贵州★小呂哥', 'M', '0', '0', '0', '4821.0', '0', '1', '1', '2022-04-09 18:57:32', '2022-04-09 18:57:32', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1692', '2600813296', '', 'http://tx6.a.kwimgs.com/uhead/AB/2021/10/26/23/BMjAyMTEwMjYyMzM4MzRfMjYwMDgxMzI5Nl8yX2hkOTU2Xzc3_s.jpg', 'M遗憾已成往事', 'M', '3', '20', '14', '1616.0', '0', '0', '0', '2022-04-09 18:57:34', '2022-04-09 18:57:34', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1693', '1194615439', '', 'http://p4.a.yximgs.com/uhead/AB/2022/02/18/19/BMjAyMjAyMTgxOTMxNDBfMTE5NDYxNTQzOV8yX2hkNTM2XzM5Ng==_s.jpg', '我是十貳', 'M', '0', '1', '0', '12083.0', '0', '0', '1', '2022-04-09 18:57:51', '2022-04-09 18:57:51', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1694', '770260583', '', 'http://tx6.a.kwimgs.com/uhead/AB/2021/04/08/00/BMjAyMTA0MDgwMDQ2MzVfNzcwMjYwNTgzXzFfaGQ4OTdfOTYx_s.jpg', '菜菜包玖伴小安总', 'M', '0', '13', '44', '1043.0', '0', '2', '1', '2022-04-09 18:57:51', '2022-04-09 18:57:51', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1695', '2139226376', 'li28383727836520', 'http://tx6.a.kwimgs.com/uhead/AB/2022/04/09/14/BMjAyMjA0MDkxNDI4MThfMjEzOTIyNjM3Nl8yX2hkNDM3Xzc4OA==_s.jpg', '涵哥', 'M', '0', '137', '23', '10089.0', '0', '0', '0', '2022-04-09 18:58:08', '2022-04-09 18:58:08', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1696', '437808808', 'hujun15972224389', 'http://p2.a.yximgs.com/uhead/AB/2021/12/19/21/BMjAyMTEyMTkyMTIyNDNfNDM3ODA4ODA4XzJfaGQ2NzZfMjUy_s.jpg', '梦想起航.0.00000', 'M', '26', '97', '26', '1499.0', '0', '1', '0', '2022-04-09 18:58:10', '2022-04-09 18:58:10', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1697', '1907466216', 'Lambo8778', 'http://p2.a.yximgs.com/uhead/AB/2020/07/21/23/BMjAyMDA3MjEyMzI3MDRfMTkwNzQ2NjIxNl8xX2hkMzEyXzk4MQ==_s.jpg', '大猫咪', 'M', '35', '9385', '57', '3753.0', '0', '0', '0', '2022-04-09 19:00:37', '2022-04-09 19:00:37', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1698', '998430447', 'l13002118111', 'http://p4.a.yximgs.com/uhead/AB/2022/03/28/17/BMjAyMjAzMjgxNzE3MzdfOTk4NDMwNDQ3XzJfaGQ3NzFfMQ==_s.jpg', '清风→→', 'M', '5', '1214', '0', '2889.0', '0', '2', '0', '2022-04-09 19:00:37', '2022-04-09 19:00:37', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1699', '222155721', 'zd562562', 'http://p2.a.yximgs.com/uhead/AB/2022/04/01/23/BMjAyMjA0MDEyMzQ4MjdfMjIyMTU1NzIxXzJfaGQ4OF80NDE=_s.jpg', '晴有独舟', 'M', '0', '214', '0', '1059.0', '0', '0', '0', '2022-04-09 19:01:18', '2022-04-09 19:01:18', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1700', '531791658', 'r11012011911212345', 'http://p4.a.yximgs.com/uhead/AB/2021/09/26/22/BMjAyMTA5MjYyMjI1MzhfNTMxNzkxNjU4XzJfaGQ3MjhfODYz_s.jpg', '旺仔沙手', 'M', '0', '456', '0', '1336.0', '0', '2', '1', '2022-04-09 19:13:22', '2022-04-09 19:16:21', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1701', '1096144895', '', 'http://tx6.a.kwimgs.com/uhead/AB/2019/09/09/14/BMjAxOTA5MDkxNDE3MTBfMTA5NjE0NDg5NV8yX2hkMTgzXzI3NA==_s.jpg', '网情追忆271', 'M', '14', '55', '18', '1314.0', '0', '2', '0', '2022-04-09 19:13:22', '2022-04-09 19:16:21', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1702', '955426123', 'lD955426127', 'http://p2.a.yximgs.com/uhead/AB/2022/03/29/00/BMjAyMjAzMjkwMDQzMjdfOTU1NDI2MTIzXzJfaGQzOV82NTA=_s.jpg', 'LOANkE  欧兰珂', 'M', '20', '8039', '53', '1530.0', '0', '1', '0', '2022-04-09 19:13:52', '2022-04-09 19:16:36', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1703', '201780481', '', 'http://tx6.a.kwimgs.com/uhead/AB/2022/04/09/13/BMjAyMjA0MDkxMzMzMTRfMjAxNzgwNDgxXzJfaGQxNjRfMTQ4_s.jpg', '笑看倾城', 'M', '1', '32', '19', '11571.0', '0', '0', '0', '2022-04-09 19:13:53', '2022-04-09 19:16:38', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1704', '1429678315', 'a14692963032', 'http://p2.a.yximgs.com/uhead/AB/2022/02/17/13/BMjAyMjAyMTcxMzA5MzFfMTQyOTY3ODMxNV8yX2hkODk1XzQ0_s.jpg', '狼图腾777（璇）721', 'M', '0', '981', '0', '3253.0', '0', '1', '1', '2022-04-09 19:13:54', '2022-04-09 19:16:37', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1705', '1420615539', 'skunik555274', 'http://p4.a.yximgs.com/uhead/AB/2021/05/22/14/BMjAyMTA1MjIxNDQ4MjNfMTQyMDYxNTUzOV8yX2hkMjc3XzU1OQ==_s.jpg', '长脸姐夫', 'M', '142', '130880', '105', '5776.0', '0', '1', '0', '2022-04-09 19:13:54', '2022-04-09 19:16:37', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1706', '2084879178', '', 'http://tx6.a.kwimgs.com/uhead/AB/2022/03/10/15/BMjAyMjAzMTAxNTUxNTVfMjA4NDg3OTE3OF8yX2hkNDg4XzM3MA==_s.jpg', '%912', 'M', '0', '21', '21', '1010.0', '0', '1', '1', '2022-04-09 19:13:54', '2022-04-09 19:16:37', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1707', '1161884746', 'pxbb88888', 'http://p4.a.yximgs.com/uhead/AB/2021/11/15/01/BMjAyMTExMTUwMTU2MDJfMTE2MTg4NDc0Nl8yX2hkNDYxXzQ1Ng==_s.jpg', '阳光下淡淡的微笑。，', 'M', '31', '85', '0', '1513.0', '0', '0', '0', '2022-04-09 19:13:59', '2022-04-09 19:16:44', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1708', '635953011', 'oo132499', 'http://p2.a.yximgs.com/uhead/AB/2022/03/20/23/BMjAyMjAzMjAyMzA0MjZfNjM1OTUzMDExXzJfaGQ0MzlfMjM=_s.jpg', '★……↙', 'M', '2', '1327', '0', '1704.0', '0', '0', '0', '2022-04-09 19:14:00', '2022-04-09 19:16:46', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1709', '735507598', '', 'http://p1.a.yximgs.com/uhead/AB/2022/03/10/17/BMjAyMjAzMTAxNzU2MDRfNzM1NTA3NTk4XzJfaGQ0NzdfNTI1_s.jpg', '未***', 'M', '64', '596', '30', '1836.0', '0', '0', '0', '2022-04-09 19:14:01', '2022-04-09 19:16:43', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1710', '764528181', 'wu276539214', 'http://tx6.a.kwimgs.com/uhead/AB/2022/03/06/08/BMjAyMjAzMDYwODU4NTJfNzY0NTI4MTgxXzJfaGQ0NF8xNQ==_s.jpg', '硪若不猖狂誰替硪坚強', 'M', '0', '632', '43', '1523.0', '0', '0', '0', '2022-04-09 19:14:02', '2022-04-09 19:16:41', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1711', '682558876', '', 'http://tx6.a.kwimgs.com/uhead/AB/2021/10/06/10/BMjAyMTEwMDYxMDA0MzhfNjgyNTU4ODc2XzJfaGQ0MDBfMjEz_s.jpg', '大军：', 'M', '0', '123', '0', '2888.0', '0', '0', '0', '2022-04-09 19:16:59', '2022-04-09 19:16:59', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1712', '347730139', '', 'http://p4.a.yximgs.com/uhead/AB/2022/04/06/23/BMjAyMjA0MDYyMzUwNTRfMzQ3NzMwMTM5XzJfaGQ1MTFfMjUw_s.jpg', '謝', 'M', '2', '60', '27', '5260.0', '0', '0', '0', '2022-04-09 19:17:02', '2022-04-09 19:17:02', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1713', '1180310971', '', 'http://p5.a.yximgs.com/uhead/AB/2018/12/30/13/BMjAxODEyMzAxMzE3MTJfMTE4MDMxMDk3MV8xX2hkNzY5XzE3Mg==_s.jpg', '熙月池6231129', 'M', '19', '406', '36', '1509.0', '0', '1', '0', '2022-04-09 19:17:09', '2022-04-09 19:17:09', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1714', '2834362535', '', 'http://static.yximgs.com/uhead/AB/2019/06/19/20/BMjAxOTA2MTkyMDExNDFfOTAwNDFfZGVmYXVsdFVzZXJIZWFkX2RlZmF1bHQ=.png', '华南', 'M', '2', '34', '26', '11645.0', '0', '0', '0', '2022-04-09 19:17:16', '2022-04-09 19:17:16', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1715', '71932662', 'HSYYDS123218291', 'http://p4.a.yximgs.com/uhead/AB/2022/04/08/22/BMjAyMjA0MDgyMjAwNTRfNzE5MzI2NjJfMV9oZDcxXzU4OQ==_s.jpg', '不在榜一请踢了我', 'M', '0', '0', '0', '5473.0', '0', '1', '1', '2022-04-09 19:17:16', '2022-04-09 19:17:16', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1716', '2695016450', '', 'http://p4.a.yximgs.com/uhead/AB/2022/04/09/14/BMjAyMjA0MDkxNDA1NDJfMjY5NTAxNjQ1MF8yX2hkMzc3XzgzNA==_s.jpg', '摩羯座', 'M', '0', '1', '0', '2834.0', '0', '2', '1', '2022-04-09 19:17:17', '2022-04-09 19:17:17', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1717', '589521395', 'heimaya666666', 'http://tx6.a.kwimgs.com/uhead/AB/2022/02/16/23/BMjAyMjAyMTYyMzA4NTdfNTg5NTIxMzk1XzJfaGQ0NzhfNTE4_s.jpg', '崔利', 'M', '0', '43416', '0', '5742.0', '0', '0', '0', '2022-04-09 19:17:34', '2022-04-09 19:17:34', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1718', '714181299', 'jianpuzuizhongye', 'http://p1.a.yximgs.com/uhead/AB/2022/03/23/15/BMjAyMjAzMjMxNTQwMDlfNzE0MTgxMjk5XzFfaGQ0MTNfNjky_s.jpg', '人间少年。。', 'M', '0', '190', '31', '4462.0', '0', '0', '0', '2022-04-09 19:17:34', '2022-04-09 19:17:34', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1719', '2827603227', 'yunduanchengbao1', 'http://p2.a.yximgs.com/uhead/AB/2022/04/08/19/BMjAyMjA0MDgxOTEyNTZfMjgyNzYwMzIyN18yX2hkODc5XzM1_s.jpg', '⑨⑨的云端城堡', 'M', '0', '78', '0', '1000.0', '0', '1', '1', '2022-04-09 19:17:34', '2022-04-09 19:17:34', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1720', '2760110864', '', 'http://p4.a.yximgs.com/uhead/AB/2022/02/22/14/BMjAyMjAyMjIxNDM4MzNfMjc2MDExMDg2NF8yX2hkMzA4XzU2MQ==_s.jpg', '宇99，心宇。', 'M', '0', '10', '0', '5200.0', '0', '2', '1', '2022-04-09 19:17:35', '2022-04-09 19:17:35', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1721', '542640569', 'llj13164475740', 'http://p5.a.yximgs.com/uhead/AB/2022/03/30/10/BMjAyMjAzMzAxMDA5MTdfNTQyNjQwNTY5XzJfaGQzOTdfNzI3_s.jpg', '小 李不虚', 'M', '10', '302', '25', '3009.0', '0', '0', '0', '2022-04-09 19:17:41', '2022-04-09 19:17:41', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1722', '486175936', '', 'http://p4.a.yximgs.com/uhead/AB/2022/02/19/22/BMjAyMjAyMTkyMjEzMjJfNDg2MTc1OTM2XzJfaGQxNDlfODI5_s.jpg', '欧阳轻松先生＠', 'M', '0', '77', '22', '10446.0', '0', '0', '0', '2022-04-09 19:17:59', '2022-04-09 19:17:59', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1723', '245890316', '', 'http://p2.a.yximgs.com/uhead/AB/2021/08/24/19/BMjAyMTA4MjQxOTUxMDVfMjQ1ODkwMzE2XzJfaGQ2M18xOTM=_s.jpg', '69（君）', 'M', '0', '332', '33', '9812.0', '0', '1', '1', '2022-04-09 19:17:59', '2022-04-09 19:17:59', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1724', '14922897', '', 'http://tx6.a.kwimgs.com/uhead/AB/2015/04/21/21/BMjAxNTA0MjEyMTQ4NDJfMTQ5MjI4OTdfMV9oZDk=.jpg', '天上怎么这么黑、', 'M', '0', '23', '16', '1711.0', '0', '0', '0', '2022-04-09 19:17:59', '2022-04-09 19:17:59', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1725', '1646718255', 'luojiajv587', 'http://p4.a.yximgs.com/uhead/AB/2022/03/28/21/BMjAyMjAzMjgyMTU2NTVfMTY0NjcxODI1NV8yX2hkNzlfNDUw_s.jpg', '＠＠＠封心（退）＠＠', 'M', '0', '35', '0', '1301.0', '0', '0', '0', '2022-04-09 19:17:59', '2022-04-09 19:17:59', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1726', '1412028699', 'go31452089ggg', 'http://p1.a.yximgs.com/uhead/AB/2022/04/09/11/BMjAyMjA0MDkxMTI3MzlfMTQxMjAyODY5OV8yX2hkOTUzXzc2_s.jpg', '&只为你%而来', 'M', '0', '376', '0', '1088.0', '0', '0', '1', '2022-04-09 19:17:59', '2022-04-09 19:17:59', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1727', '1710048901', 'wcg651116', 'http://p2.a.yximgs.com/uhead/AB/2022/01/15/22/BMjAyMjAxMTUyMjMxMzlfMTcxMDA0ODkwMV8yX2hkOTQ5XzY1NQ==_s.jpg', '成則為王666', 'M', '719', '7085', '49', '7064.0', '0', '0', '0', '2022-04-09 19:17:59', '2022-04-09 19:17:59', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1728', '1843798670', '', 'http://p5.a.yximgs.com/uhead/AB/2022/03/28/17/BMjAyMjAzMjgxNzM2MTVfMTg0Mzc5ODY3MF8yX2hkNDMxXzUy_s.jpg', '豆浪浪', 'M', '7', '231', '0', '15298.0', '0', '1', '0', '2022-04-10 09:49:33', '2022-04-10 09:49:33', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1729', '1167929673', '', 'http://p5.a.yximgs.com/uhead/AB/2020/07/27/08/BMjAyMDA3MjcwODMxMTBfMTE2NzkyOTY3M18yX2hkNV80_s.jpg', '善待4097', 'M', '10', '1164', '38', '1316.0', '0', '0', '0', '2022-04-10 09:49:36', '2022-04-10 09:49:36', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1730', '124189478', 'CHch79866', 'http://tx6.a.kwimgs.com/uhead/AB/2022/03/30/21/BMjAyMjAzMzAyMTMyNTdfMTI0MTg5NDc4XzFfaGQ0NzZfNzE2_s.jpg', '凹凸怪^ - ^', 'M', '0', '5', '0', '3702.0', '0', '1', '1', '2022-04-10 09:49:56', '2022-04-10 09:49:56', null, null, '0');
INSERT INTO `t_vulgar_tycoon` VALUES ('1731', '2092797052', '', 'http://p4.a.yximgs.com/uhead/AB/2022/03/09/10/BMjAyMjAzMDkxMDUwMjRfMjA5Mjc5NzA1Ml8yX2hkMTA0Xzk1Mw==_s.jpg', '星辰', 'M', '0', '213', '0', '1977.0', '0', '1', '0', '2022-04-10 09:49:57', '2022-04-10 09:49:57', null, null, '0');
