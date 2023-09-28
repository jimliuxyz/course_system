import '../app_center.dart';
import 'package:flutter/material.dart';

import '../view_model/course_vm.dart';
import '../view_model/teacher_vm.dart';
import 'course_details_view.dart';

class TeacherItemView extends StatefulWidget {
  final TeacherVM teacher;
  // ignore: prefer_const_constructors_in_immutables
  TeacherItemView({Key? key, required this.teacher}) : super(key: key);

  @override
  TeacherItemViewState createState() => TeacherItemViewState();
}

class TeacherItemViewState extends State<TeacherItemView> {
  bool showCourse = false;

  Future<List<CourseVM>>? fCourse;

  @override
  Widget build(BuildContext context) {
    var children = [
      _teacherToWidget(widget.teacher),
      if (showCourse && fCourse != null)
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const Divider(
            thickness: 2,
          ),
        ),
      if (showCourse && fCourse != null)
        FutureBuilder(
            future: fCourse,
            builder: (context, snapshot) {
              if (snapshot.hasError || !snapshot.hasData) {
                return Container();
              }
              var courses = snapshot.data!;

              return Column(
                children: courses.map((e) => _courseToWidget(e)).toList(),
              );
            })
    ];

    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _teacherToWidget(TeacherVM teacher) {
    return ListTile(
        title: Text(teacher.jobTitle),
        subtitle: Text(teacher.name),
        trailing:
            !showCourse ? const Icon(Icons.add) : const Icon(Icons.remove),
        leading: CircleAvatar(
          foregroundImage:
              teacher.avatar.isEmpty ? null : NetworkImage(teacher.avatar),
        ),
        onTap: () {
          fCourse = service.getCourseListOfTeacher(teacher.id);
          setState(() {
            showCourse = !showCourse;
          });
        });
  }

  Widget _courseToWidget(CourseVM course) {
    return ListTile(
        title: Text(course.title),
        subtitle: Text(
            '星期${_dayOfWeek[course.dayOfWeek]}, ${course.startHour}:00~${course.endHour}:00'),
        trailing: const Icon(Icons.navigate_next),
        leading: const Icon(Icons.calendar_month),
        onTap: () {
          Navigator.restorablePushNamed(context, CourseDetailsView.routeName,
              arguments: {
                "teacherName": widget.teacher.name,
                "teacherAvatar": widget.teacher.avatar,
                "courseTitle": course.title,
                "courseSummary": course.summary
              });
        });
  }

  final _dayOfWeek = ['一', '二', '三', '四', '五', '六', '日'];
}
