class CourseSelection {
  /// 選課Id
  late int id;

  /// 課程Id
  int courseId;

  /// 學生Id
  int studentId;

  /// 建立時間
  int createTime;

  /// 選課狀態
  int status = 0;

  CourseSelection(
      {required this.courseId,
      required this.studentId,
      required this.createTime});
}
