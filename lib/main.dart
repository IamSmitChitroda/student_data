import 'headers.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.instance.route,
    );
  }
}
