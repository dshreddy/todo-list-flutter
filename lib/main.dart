import 'package:flutter/material.dart';
import 'package:todo/components/task_data.dart';
import 'package:todo/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return TaskData();
      },
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.lightBlueAccent,
        ),
        home: const TaskScreen(),
      ),
    );
  }
}
