import 'package:course_system/src/repository/model/course.dart';
import 'package:course_system/src/repository/model/teacher.dart';
import 'package:course_system/src/view_model/course_vm.dart';
import 'package:course_system/src/view_model/teacher_vm.dart';

abstract class CourseService {
  /// 課程列表
  Future<List<CourseVM>> getCourseList();

  /// 授課講師列表
  Future<List<TeacherVM>> getTeacherList();

  /// 授課講師所開課程列表
  Future<List<CourseVM>> getCourseListOfTeacher(int teacherId);

  /// 建立新講師
  Future<bool> createTeacher(Teacher data);

  /// 建立新課程
  Future<bool> createCourse(Course data);

  /// 更新課程內容
  Future<bool> updateCourseSummary(int courseId, String summary);

  /// 刪除課程
  Future<bool> deleteCourse(int courseId);
}
