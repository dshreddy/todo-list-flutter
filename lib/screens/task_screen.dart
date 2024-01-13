import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/task_data.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  static String id = "task_screen";

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.lightBlueAccent,
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),
              Text(
                "Todo : ${Provider.of<TaskData>(context).taskList.length} tasks",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: const AddTaskScreen(
                                addOrEdit: true,
                                currentText: "",
                                editIndex: 0,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.lightBlueAccent,
                      size: 50,
                    ),
                  )),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: Provider.of<TaskData>(context).taskList.length,
                    itemBuilder: (context, index) {
                      var task = Provider.of<TaskData>(context).taskList[index];
                      return task;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
