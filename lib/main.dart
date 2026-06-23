import 'package:flutter/material.dart';
import 'package:week2/menu.dart';
import 'package:week2/simpletodo/todo_service.dart';

import 'service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Service.instance.init();
  await TodoService.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const Menu(),
    );
  }
}
