import 'package:flutter/material.dart';

import 'views/course_details_view.dart';
import 'views/teacher_list_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      theme: ThemeData().copyWith(
          appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
      )),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case CourseDetailsView.routeName:
                return const CourseDetailsView();
              case TeacherListView.routeName:
              default:
                return TeacherListView();
            }
          },
        );
      },
    );
  }
}
