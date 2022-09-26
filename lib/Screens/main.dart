import 'package:app_jefferson/Models/tasks_data.dart';
import 'package:app_jefferson/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // builder: (context) => TaskData(),
      // create: (BuildContext context) {},
      create: (context) => TaskData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const home_screen(),
      ),
    );
  }
}

