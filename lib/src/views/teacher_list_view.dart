import '../app_center.dart';
import 'package:flutter/material.dart';

import '../view_model/teacher_vm.dart';
import 'teacher_listitem_view.dart';

class TeacherListView extends StatefulWidget {
  static const routeName = '/';
  // ignore: prefer_const_constructors_in_immutables
  TeacherListView({Key? key}) : super(key: key);

  @override
  TeacherListViewState createState() => TeacherListViewState();
}

class TeacherListViewState extends State<TeacherListView> {
  late Future<List<TeacherVM>> fTeacher;
  @override
  void initState() {
    fTeacher = service.getTeacherList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('講師清單')),
      body: FutureBuilder(
          future: fTeacher,
          builder: ((context, snapshot) {
            if (!snapshot.hasData) return Container();

            var items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];

                return TeacherItemView(teacher: item);
              },
            );
          })),
    );
  }
}
