/// 老師
class TeacherVM {
  late int id;

  /// 帳號
  String account;

  /// 密碼
  String password;

  /// 職稱
  String jobTitle;

  /// 姓名
  String name;

  /// 頭像
  String avatar;

  TeacherVM(
      {required this.id,
      required this.account,
      required this.password,
      required this.jobTitle,
      required this.name,
      required this.avatar});
}
