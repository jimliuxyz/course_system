import 'dart:math';

import 'demo_content.dart';
import 'model/student.dart';
import 'model/teacher.dart';
import 'model/course.dart';
import 'model/course_selection.dart';

class Repository {
  final List<Teacher> _teacher = [];
  final List<Student> _student = [];
  final List<Course> _course = [];
  final List<CourseSelection> _selection = [];

  /// 新增教師
  createTeacher(Teacher data) {
    data.id = _teacher.length;
    if (_teacher.any((e) => e.account == data.account) ||
        data.account.isEmpty ||
        data.password.isEmpty) {
      throw Exception("teacher cannot be create");
    }
    _teacher.add(data);
  }

  /// 新增學生
  createStudent(Student data) {
    data.id = _student.length;
    if (_student.any((e) => e.account == data.account) ||
        data.account.isEmpty ||
        data.password.isEmpty) {
      throw Exception("student cannot be create");
    }
    _student.add(data);
  }

  /// 新增課程
  createCourse(Course data) {
    data.id = _course.length;
    if (!_teacher.any((e) => e.id == data.teacherId)) {
      throw Exception("course cannot be create");
    }
    // TODO : 檢查開課時間是否衝突
    _course.add(data);
  }

  /// 新增選課
  createCourseSelection(CourseSelection data) {
    data.id = _selection.length;
    if (!_student.any((e) => e.id == data.studentId) ||
        !_course.any((e) => e.id == data.courseId)) {
      throw Exception("course selection cannot be create");
    }
    // TODO : 檢查選課時間是否衝突
    _selection.add(data);
  }

  /// 更新課程
  updateCourse(int courseId, String summary) {
    Course course = _course.firstWhere((e) => e.id == courseId);
    course.summary = summary;
  }

  /// 刪除課程
  removeCourse(int courseId) {
    Course course = _course.firstWhere((e) => e.id == courseId);
    course.status = 1;
  }

  /// 讀取所有老師
  Future<Iterable<Teacher>> getTeacher() async {
    return _teacher;
  }

  /// 讀取所有課程
  Future<Iterable<Course>> getCourse() async {
    return _course.where((e) => e.status == 0);
  }

  /// 初始化資料倉庫
  initDemoData() {
    // ignore: prefer_function_declarations_over_variables
    var addTeacher = () {
      createTeacher(Teacher(
          account: DemoContent.accounts[_teacher.length],
          password: "123456",
          jobTitle: DemoContent.jobTitles[_teacher.length],
          name: DemoContent.names[_teacher.length],
          avatar: DemoContent.avatars[_teacher.length]));
    };

    // ignore: prefer_function_declarations_over_variables
    var addCourse = () {
      createCourse(Course(
          teacherId: _teacher.length - 1,
          title: DemoContent.courses[_course.length],
          summary: DemoContent.summarys[_course.length],
          dayOfWeek: Random().nextInt(7 - 1) + 1,
          startHour: DemoContent.hours[_course.length],
          endHour: DemoContent.hours[_course.length] + 1));
    };

    addTeacher();
    addCourse();
    addCourse();
    addCourse();

    addTeacher();
    addCourse();

    addTeacher();
    addCourse();
    addCourse();
    addCourse();
    addCourse();

    addTeacher();
    addCourse();
    addCourse();

    addTeacher();
    addCourse();
    addCourse();
  }
}
