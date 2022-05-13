import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todo.dart';
import 'package:todo/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static const String title = 'Todo App';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodoProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.purple,
            scaffoldBackgroundColor: const Color.fromARGB(247, 255, 255, 255),
          ),
          home: const HomeScreen(),
        ),
      );
}
