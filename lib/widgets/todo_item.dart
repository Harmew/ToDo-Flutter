import 'package:flutter/material.dart';

// Constants
import '../constants/colors.dart';

// Model
import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final Function(ToDo) onToDoChanged;
  final Function(ToDo) onDeleteItem;

  const ToDoItem(
      {Key? key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdBlue),
        title: Text(todo.todoText!,
            style: TextStyle(
                fontSize: 16,
                color: tdBlack,
                decoration: todo.isDone ? TextDecoration.lineThrough : null)),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo);
            },
          ),
        ),
      ),
    );
  }
}
