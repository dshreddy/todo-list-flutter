import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/task_data.dart';

import '../screens/add_task_screen.dart';

class TaskItem extends StatefulWidget {
  final String taskText;

  const TaskItem({
    super.key,
    required this.taskText,
  });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 3,
      // color: Colors.greenAccent.shade400,
      color: Colors.lightBlueAccent,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.taskText,
                  style: TextStyle(
                    decorationColor: Colors.white,
                    decorationThickness: 2,
                    decoration: isChecked ? TextDecoration.lineThrough : null,
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Checkbox(
                side: const BorderSide(color: Colors.white, width: 2),
                checkColor: Colors.lightBlueAccent,
                activeColor: Colors.white,
                tristate: true,
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = (value != null);
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  final taskData =
                      Provider.of<TaskData>(context, listen: false);
                  taskData.moveTaskUp(widget);
                },
                icon: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  final taskData =
                      Provider.of<TaskData>(context, listen: false);
                  taskData.moveTaskDown(widget);
                },
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  final taskData =
                      Provider.of<TaskData>(context, listen: false);
                  final taskIndex = taskData.taskList.indexOf(widget);

                  Provider.of<TaskData>(context, listen: false);
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: AddTaskScreen(
                            addOrEdit: false,
                            currentText: widget.taskText,
                            editIndex: taskIndex,
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  final taskData =
                      Provider.of<TaskData>(context, listen: false);
                  taskData.deleteTask(widget);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
