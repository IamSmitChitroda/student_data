import 'package:student_data/headers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Scaffold(
      appBar: myAppBar(title: "HomePage"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Card(
              child: ListTile(
                title: Text("Name"),
              ),
            ),
            ...AppData.instance.student_name
                .map(
                  (e) => Card(
                    child: ListTile(
                      onTap: () {
                        index = AppData.instance.student_name.indexOf(e);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Enter data"),
                              actions: [
                                // name
                                TextFormField(
                                  controller:
                                      AppData.instance.student_name[index],
                                  initialValue:
                                      AppData.instance.student_name[index].text,
                                ),
                                // standard
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "Enter student standard",
                                  ),
                                  keyboardType: TextInputType.number,
                                  controller:
                                      AppData.instance.student_standard[index],
                                  initialValue: AppData
                                      .instance.student_standard[index].text,
                                ),
                                // grid
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "Enter student grid",
                                  ),
                                  keyboardType: TextInputType.number,
                                  controller:
                                      AppData.instance.student_grid[index],
                                  initialValue:
                                      AppData.instance.student_grid[index].text,
                                ),
                              ],
                            );
                          },
                        ).then((value) => () => setState(() {}));
                      },
                      leading: Text(AppData.instance.student_grid[index].text),
                      title: Text(e.text),
                      trailing: IconButton(
                        onPressed: () {
                          index = AppData.instance.student_name.indexOf(e);
                          setState(
                            () {
                              AppData.instance.student_name.removeAt(index);
                              AppData.instance.student_standard.removeAt(index);
                              AppData.instance.student_grid.removeAt(index);
                            },
                          );
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppData.instance.addStudent();

          index = AppData.instance.student_name.length - 1;
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Enter data"),
                  actions: [
                    // name
                    TextFormField(
                      decoration:
                          const InputDecoration(hintText: "Enter student name"),
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
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
