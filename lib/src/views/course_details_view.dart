import 'package:flutter/material.dart';

/// 顯示課程細節
class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key});

  static const routeName = '/course_detial';

  @override
  Widget build(BuildContext context) {
    final map = ModalRoute.of(context)!.settings.arguments as Map;

    var children = [
      Container(
        margin: const EdgeInsets.all(15),
        alignment: Alignment.center,
        child: Text(
          map["courseTitle"],
          style: const TextStyle(fontSize: 25),
        ),
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircleAvatar(
              foregroundImage: map["teacherAvatar"].isEmpty
                  ? null
                  : NetworkImage(map["teacherAvatar"]),
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 5)),
          Text(map["teacherName"]),
        ],
      ),
      const Divider(thickness: 2),
      Text(map["courseSummary"])
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('課程內容'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
