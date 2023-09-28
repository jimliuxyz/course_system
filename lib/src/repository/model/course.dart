class Course {
  /// 課程Id
  late int id;

  /// 開課教師Id
  int teacherId;

  /// 課程名稱
  String title;

  /// 課程摘要
  String summary;

  /// 星期幾(1~7)
  int dayOfWeek;

  /// 課程開始時間(0~24)
  /// 10
  int startHour;

  /// 課程結束時間(0~24)
  /// 13
  int endHour;

  /// 狀態
  /// 0:正常開放選課 1:取消
  int status = 0;

  Course(
      {required this.teacherId,
      required this.title,
      required this.summary,
      required this.dayOfWeek,
      required this.startHour,
      required this.endHour});
}
