import 'package:course_system/src/app.dart';
import 'package:course_system/src/app_center.dart';
import 'package:course_system/src/repository/demo_content.dart';
import 'package:course_system/src/repository/model/course.dart';
import 'package:course_system/src/repository/model/teacher.dart';
import 'package:course_system/src/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testTeacherName = "MyTester";
  const testCourseTitle = "MyCourse";
  const testCourseSummary = "MySummary";

  setUpAll(() async {
    // create a new repository and add a teacher and course
    repo = Repository();
    await service.createTeacher(Teacher(
        account: "tester",
        password: "123456",
        jobTitle: "jobTitle",
        name: testTeacherName,
        avatar: DemoContent.avatars.first));

    var teachers = await service.getTeacherList();
    await service.createCourse(Course(
        teacherId: teachers.first.id,
        title: testCourseTitle,
        summary: testCourseSummary,
        dayOfWeek: 1,
        startHour: 11,
        endHour: 12));
  });

  group('Service Test', () {
    test('should have one teacher and one course', () async {
      var teachers = await service.getTeacherList();
      expect(teachers.length, 1);
      expect(teachers.first.name, testTeacherName);
      var courses = await service.getCourseListOfTeacher(teachers.first.id);
      expect(courses.length, 1);
    });
  });

  group('Widget Test', () {
    testWidgets('should have a teacher displayed $testTeacherName',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.textContaining(testTeacherName), findsOneWidget);
    });
  });
}
