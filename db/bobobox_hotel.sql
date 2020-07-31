/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : localhost:3306
 Source Schema         : bobobox_hotel

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 31/07/2020 11:04:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hotels
-- ----------------------------
DROP TABLE IF EXISTS `hotels`;
CREATE TABLE `hotels`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_hotels_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotels
-- ----------------------------
INSERT INTO `hotels` VALUES (1, '2020-07-31 05:22:50', '2020-07-31 05:22:50', NULL, 'Hotel Bobobox A', 'Jl. Cipaganti');
INSERT INTO `hotels` VALUES (2, '2020-07-31 05:22:50', '2020-07-31 05:22:50', NULL, 'Hotel Bobobox B', 'Jl. Kebon Kawung');
INSERT INTO `hotels` VALUES (3, '2020-07-31 05:22:50', '2020-07-31 05:22:50', NULL, 'Hotel Bobobox C', 'Jl. Setiabudi');

-- ----------------------------
-- Table structure for reservations
-- ----------------------------
DROP TABLE IF EXISTS `reservations`;
CREATE TABLE `reservations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `total_price` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_reservations_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservations
-- ----------------------------
INSERT INTO `reservations` VALUES (1, NULL, NULL, NULL, 'BBX/2020/08/XXX/1', 'Agus', '2020-08-01 00:00:00', 80000);
INSERT INTO `reservations` VALUES (2, NULL, NULL, NULL, 'BBX/2020/08/XXX/2', 'Cynthia', '2020-08-08 00:00:00', 160000);
INSERT INTO `reservations` VALUES (3, NULL, NULL, NULL, 'BBX/2020/08/XXX/3', 'Kyle', '2020-07-30 00:00:00', 200000);

-- ----------------------------
-- Table structure for room_prices
-- ----------------------------
DROP TABLE IF EXISTS `room_prices`;
CREATE TABLE `room_prices`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `type_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_room_prices_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `room_prices_type_id_types_id_foreign`(`type_id`) USING BTREE,
  CONSTRAINT `room_prices_type_id_types_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_prices
-- ----------------------------
INSERT INTO `room_prices` VALUES (1, '2020-08-01', '2021-08-01', 1, 80000, NULL, NULL, NULL);
INSERT INTO `room_prices` VALUES (2, '2020-08-01', '2020-08-02', 2, 100000, NULL, NULL, NULL);
INSERT INTO `room_prices` VALUES (3, '2020-08-01', '2020-08-20', 5, 80000, NULL, NULL, NULL);
INSERT INTO `room_prices` VALUES (4, '2020-08-01', '2020-08-31', 3, 150000, NULL, NULL, NULL);
INSERT INTO `room_prices` VALUES (5, '2020-07-30', '2020-08-08', 4, 200000, NULL, NULL, NULL);
INSERT INTO `room_prices` VALUES (6, '2020-09-01', '2020-09-03', 1, 50000, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for rooms
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `floor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type_id` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_rooms_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `rooms_type_id_types_id_foreign`(`type_id`) USING BTREE,
  CONSTRAINT `rooms_type_id_types_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO `rooms` VALUES (1, NULL, NULL, NULL, 'Room 01', '1', 1);
INSERT INTO `rooms` VALUES (2, NULL, NULL, NULL, 'Room 01', '1', 5);
INSERT INTO `rooms` VALUES (3, NULL, NULL, NULL, 'Room X1', '1', 2);
INSERT INTO `rooms` VALUES (4, NULL, NULL, NULL, 'Room Z1', '1', 3);
INSERT INTO `rooms` VALUES (5, NULL, NULL, NULL, 'Room 21', '2', 1);
INSERT INTO `rooms` VALUES (6, NULL, NULL, NULL, 'Room 02', '1', 1);
INSERT INTO `rooms` VALUES (7, NULL, NULL, NULL, 'Room 21', '2', 5);

-- ----------------------------
-- Table structure for stays
-- ----------------------------
DROP TABLE IF EXISTS `stays`;
CREATE TABLE `stays`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `guest_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `check_in` datetime(0) NULL DEFAULT NULL,
  `check_out` datetime(0) NULL DEFAULT NULL,
  `room_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `reservation_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `type_id` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_stays_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `stays_reservation_id_reservations_id_foreign`(`reservation_id`) USING BTREE,
  INDEX `stays_room_id_rooms_id_foreign`(`room_id`) USING BTREE,
  CONSTRAINT `stays_reservation_id_reservations_id_foreign` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stays_room_id_rooms_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stays
-- ----------------------------
INSERT INTO `stays` VALUES (1, NULL, NULL, NULL, 'Agus', '2020-08-03 00:00:00', '2020-08-04 00:00:00', 1, 1, 1);
INSERT INTO `stays` VALUES (2, NULL, NULL, NULL, 'Cynthia', '2020-08-05 00:00:00', '2020-08-06 00:00:00', 1, 2, 1);
INSERT INTO `stays` VALUES (3, NULL, NULL, NULL, 'Kyle', '2020-08-01 00:00:00', '2020-08-02 00:00:00', 3, 3, 2);

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `max_people` int(11) NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `facility` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `hotel_id` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_types_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `types_hotel_id_hotels_id_foreign`(`hotel_id`) USING BTREE,
  CONSTRAINT `types_hotel_id_hotels_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES (1, NULL, NULL, NULL, 'Type A', 2, '3x3', 'Bed, Table', 5, 1);
INSERT INTO `types` VALUES (2, NULL, NULL, NULL, 'Type B', 4, '3x6', 'Bed, Bathroom, Table', 2, 1);
INSERT INTO `types` VALUES (3, NULL, NULL, NULL, 'Type C', 4, '4x5', 'Bed, Bathroom,TV,Table', 1, 2);
INSERT INTO `types` VALUES (4, NULL, NULL, NULL, 'Type D', 8, '10x10', 'Bed, Living Room, Kitchen, TV', 1, 3);
INSERT INTO `types` VALUES (5, NULL, NULL, NULL, 'Type A', 2, '3x3', 'Bed, Table', 5, 2);

SET FOREIGN_KEY_CHECKS = 1;
