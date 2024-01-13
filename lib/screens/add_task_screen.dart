import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  final bool addOrEdit;
  final int editIndex;
  final String currentText;

  const AddTaskScreen(
      {super.key,
      required this.addOrEdit,
      required this.currentText,
      required this.editIndex});
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String? taskText;
  late String buttonText;

  @override
  void initState() {
    super.initState();
    taskText = widget.addOrEdit ? null : widget.currentText;
    buttonText = widget.addOrEdit ? "Add Task" : "Edit Task";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 10),
              Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                controller: TextEditingController(text: taskText),
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  taskText = value;
                },
                style: const TextStyle(fontSize: 22.0, color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.lightBlueAccent),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlueAccent,
                ),
                child: TextButton(
                  onPressed: () {
                    if (taskText != null) {
                      if (widget.addOrEdit) {
                        Provider.of<TaskData>(context, listen: false)
                            .addTask(taskText!);
                      } else {
                        Provider.of<TaskData>(context, listen: false)
                            .addAt(taskText!, widget.editIndex);
                      }
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
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
