import 'repository/repository.dart';
import 'services/course_repo_service.dart';
import 'services/course_service.dart';

Repository repo = Repository()..initDemoData();
CourseService service = CourseRepoService();
