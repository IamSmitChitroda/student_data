import 'package:student_data/headers.dart';

Widget newStudentAddDialogBox(
    {required int index, required BuildContext context}) {
  return AlertDialog(
    title: const Text("Enter data"),
    actions: [
      // name
      TextFormField(
        decoration: const InputDecoration(hintText: "Enter student name"),
        controller: AppData.instance.student_name[index],
      ),
      // standard
      TextFormField(
        decoration: const InputDecoration(
          hintText: "Enter student standard",
        ),
        keyboardType: TextInputType.number,
        controller: AppData.instance.student_standard[index],
      ),
      // grid
      TextFormField(
        decoration: const InputDecoration(
          hintText: "Enter student grid",
        ),
        keyboardType: TextInputType.number,
        controller: AppData.instance.student_grid[index],
      ),
      const SizedBox(
        height: 15,
      ),
      // back
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("Save & Exit"),
      )
    ],
  );
}
