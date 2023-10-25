import 'package:flutter/material.dart';
import 'package:ogrencitakip/constants/tasktype.dart';
import 'package:ogrencitakip/model/task.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});
  final Task task;
  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isComplated ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.task.type == TaskType.note
                ? Image.asset("lib/assets/images/document.png")
                : widget.task.type == TaskType.contest
                    ? Image.asset("lib/assets/images/gamepad.png")
                    : Image.asset("lib/assets/images/book-alt.png"),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        decoration: widget.task.isComplated
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  Text("Görev : ${widget.task.description}\u0020"
                      "${widget.task.isComplated}"),
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(
                  () {
                    widget.task.isComplated = !widget.task.isComplated;
                    isChecked = val!;
                  },
                )
              },
            )
          ],
        ),
      ),
    );
  }
}
