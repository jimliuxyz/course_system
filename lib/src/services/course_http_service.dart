import 'package:course_system/src/repository/model/teacher.dart';
import 'package:course_system/src/services/course_service.dart';
import 'package:course_system/src/view_model/course_vm.dart';
import 'package:course_system/src/view_model/teacher_vm.dart';

import '../repository/model/course.dart';

/// 基於http的api服務 TODO: 不確定是否是題目的範疇 並未實現
class CourseHttpervice implements CourseService {
  @override
  Future<bool> createCourse(Course data) {
    // TODO: implement createCourse
    throw UnimplementedError();
  }

  @override
  Future<bool> createTeacher(Teacher data) {
    // TODO: implement createTeacher
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteCourse(int courseId) {
    // TODO: implement deleteCourse
    throw UnimplementedError();
  }

  @override
  Future<List<CourseVM>> getCourseList() {
    // TODO: implement getCourseList
    throw UnimplementedError();
  }

  @override
  Future<List<CourseVM>> getCourseListOfTeacher(int teacherId) {
    // TODO: implement getCourseListOfTeacher
    throw UnimplementedError();
  }

  @override
  Future<List<TeacherVM>> getTeacherList() {
    // TODO: implement getTeacherList
    throw UnimplementedError();
  }

  @override
  Future<bool> updateCourseSummary(int courseId, String summary) {
    // TODO: implement updateCourseSummary
    throw UnimplementedError();
  }
}
