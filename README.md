# course_system

一個局部功能的選課系統.

## view的大致實現

- teacher_list_view : 作為根路徑 顯示教師列表
- teacher_listitem_view : 供教師列表使用的list item view
- course_details_view : 作為'/course_detail'路徑 顯示課程內容

## 資料流

local repo => service api => view

## Service API

[api](lib/src/services)
- course_service : 做為service的interface
- course_repo_service : 一個本地repo的實作
- course_http_service : 一個http的實作 (不確定是否是題目的範疇 並未實現)

[model](lib/src/view_model)
- teacher_vm : 老師
- student_vm : 學生
- course_vm : 課程
- course_selection_vm : 選課紀錄

## 測試

1. Service API test [code](test/test.dart)
 - 測試api能否正常運作
 - 測試資料為一個老師與課程 詳情參閱setUpAll
 - 必須如預期回傳一個老師與課程

2. Widget test [code](test/test.dart)
 - 測試畫面是否如預期顯示
 - 測試資料為一個老師與課程 詳情參閱setUpAll
 - 必須如預期顯示一個老師

3. Integration test [code](test_driver/main_test.dart)
 - 測試在模擬或物理機上是否能跑完一個使用者操作流程
 - 測試資料為預設的demo內容 [code](lib/src/repository/demo_content.dart)
 - 必須如預期跑完一個使用者操作流程(看到老師/課程/課程內容及back按鈕)


```sh
# run integration test
flutter drive --target="test_driver/main_test.dart" --target="test_driver/main.dart" -d emulator-5554
```

## sqlite scheam

```sql
DROP TABLE course_selection 
DROP TABLE course 
DROP TABLE teacher 
DROP TABLE student 


CREATE TABLE `teacher` (
  `id` INTEGER PRIMARY KEY,
  `account` VARCHAR(20),
  `password` VARCHAR(20),
  `jobTitle` NVARCHAR(30),
  `name` NVARCHAR(20),
  `avatar` VARCHAR(250)
);

CREATE TABLE `student` (
  `id` INTEGER PRIMARY KEY,
  `account` VARCHAR(20),
  `password` VARCHAR(20),
  `name` NVARCHAR(20)
);

CREATE TABLE `course` (
  `id` INTEGER PRIMARY KEY,
  `teacherId` INTEGER,
  `title` NVARCHAR(500),
  `summary` NVARCHAR(500),
  `dayOfWeek` INTEGER,
  `startHour` INTEGER,
  `endHour` INTEGER
);

CREATE TABLE `course_selection` (
  `id` INTEGER PRIMARY KEY,
  `courseId` INTEGER,
  `studentId` INTEGER,
  `createTime` timestamp,
  `status` INTEGER
);

-- 老師帳號需要唯一索引 避免重複
CREATE UNIQUE INDEX `account_index` on `teacher` (`account`);

-- 學生帳號需要唯一索引 避免重複
CREATE UNIQUE INDEX `account_index` on `student` (`account`);

-- 課程中需以某老師為條件進行查詢 故將其設為索引
CREATE INDEX `teacherId_index` ON `course` (`teacherId`);

-- 選課時需以某課程為條件進行查詢 故將其設為索引
CREATE INDEX `courseId_index` ON `course_selection` (`courseId`);

-- 選課時需以某學生為條件進行查詢 故將其設為索引
CREATE INDEX `studentId_index` ON `course_selection` (`studentId`);
```
