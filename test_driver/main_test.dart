import 'package:course_system/src/repository/demo_content.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('end-to-end test', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      await driver.close();
    });

    test('simulate the end user action', () async {
      final firstTeacher = find.text(DemoContent.names.first);
      final firstCourse = find.text(DemoContent.courses.first);

      // tap first teacher
      await driver.waitFor(firstTeacher);
      driver.tap(firstTeacher);

      // tab fisst course
      await driver.waitFor(firstCourse);
      driver.tap(firstCourse);

      // got a pushed page
      await driver.waitFor(find.pageBack());
    });
  });
}
