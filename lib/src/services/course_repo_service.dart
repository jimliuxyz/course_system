import 'package:course_system/src/app_center.dart';
import 'package:course_system/src/repository/model/teacher.dart';
import 'package:course_system/src/services/course_service.dart';
import 'package:course_system/src/view_model/course_vm.dart';
import 'package:course_system/src/view_model/teacher_vm.dart';

import '../repository/model/course.dart';

/// 基於本地repo的api服務
class CourseRepoService implements CourseService {
  /// 課程列表
  @override
  Future<List<CourseVM>> getCourseList() async {
    return (await repo.getCourse())
        .map((e) => CourseVM(
            id: e.id,
            teacherId: e.teacherId,
            title: e.title,
            summary: e.summary,
            dayOfWeek: e.dayOfWeek,
            startHour: e.startHour,
            endHour: e.endHour))
        .toList();
  }

  /// 授課講師列表
  @override
  Future<List<TeacherVM>> getTeacherList() async {
    return (await repo.getTeacher())
        .map((e) => TeacherVM(
            id: e.id,
            account: e.account,
            password: e.password,
            jobTitle: e.jobTitle,
            name: e.name,
            avatar: e.avatar))
        .toList();
  }

  /// 授課講師所開課程列表
  @override
  Future<List<CourseVM>> getCourseListOfTeacher(int teacherId) async {
    return (await repo.getCourse())
        .where((e) => e.teacherId == teacherId)
        .map((e) => CourseVM(
            id: e.id,
            teacherId: e.teacherId,
            title: e.title,
            summary: e.summary,
            dayOfWeek: e.dayOfWeek,
            startHour: e.startHour,
            endHour: e.endHour))
        .toList();
  }

  /// 建立新講師
  @override
  Future<bool> createTeacher(Teacher data) async {
    try {
      repo.createTeacher(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 建立新課程
  @override
  Future<bool> createCourse(Course data) async {
    try {
      repo.createCourse(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 更新課程內容
  @override
  Future<bool> updateCourseSummary(int courseId, String summary) async {
    try {
      repo.updateCourse(courseId, summary);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 刪除課程
  @override
  Future<bool> deleteCourse(int courseId) async {
    try {
      repo.removeCourse(courseId);
      return true;
    } catch (e) {
      return false;
    }
  }
}
