import 'package:student_data/headers.dart';

class AppData {
  AppData._();
  static final AppData instance = AppData._();

  List<TextEditingController> student_name = [];
  List<TextEditingController> student_grid = [];
  List<TextEditingController> student_standard = [];

  void addStudent() {
    student_name.add(TextEditingController());
    student_grid.add(TextEditingController());
    student_standard.add(TextEditingController());
  }
}
