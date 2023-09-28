/// 學生
class StudentVM {
  late int id;

  /// 帳號
  String account;

  /// 密碼
  String password;

  /// 名稱
  String name;

  StudentVM(
      {required this.id,
      required this.account,
      required this.password,
      required this.name});
}
