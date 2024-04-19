import 'package:student_data/headers.dart';
import 'package:student_data/home_page/componets/card.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            initialCard(),
            ...AppData.instance.student_name
                .map(
                  (e) => card(
                      index: index,
                      context: context,
                      e: e,
                      function: () {
                        setState(
                          () {
                            AppData.instance.student_name.removeAt(index);
                            AppData.instance.student_standard.removeAt(index);
                            AppData.instance.student_grid.removeAt(index);
                          },
                        );
                      },
                      fun: () {
                        setState(() {});
                      }),
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
                return newStudentAddDialogBox(index: index, context: context);
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
