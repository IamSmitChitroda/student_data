import 'package:student_data/headers.dart';

class AppRoutes {
  // forSingleTonClass
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();

  String splashScreen = '/';
  String homePage = 'HomePage';
  String detailPage = 'DetailPage';
  String addDataPage = 'AddDataPage';

  Map<String, Widget Function(BuildContext)> route = {
    '/': (context) => const SplashScreen(),
    'HomePage': (context) => const HomePage(),
    'AddDataPage': (context) => const AddStudentDataPage(),
  };
}
