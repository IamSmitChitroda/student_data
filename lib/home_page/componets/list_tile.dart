import 'package:student_data/headers.dart';

Widget listTile(
    {required void Function() tap,
    required int index,
    required void Function() pressed,
    required TextEditingController e}) {
  return ListTile(
    onTap: tap,
    leading: Text(AppData.instance.student_grid[index].text),
    title: Text(e.text),
    trailing: IconButton(
      onPressed: pressed,
      icon: const Icon(Icons.delete),
    ),
  );
}
