import 'package:flutter/material.dart';

// Contants
import '../constants/colors.dart';

class NewToDo extends StatelessWidget {
  final TextEditingController todoController;
  final Function addToDoItem;

  const NewToDo(
      {Key? key, required this.todoController, required this.addToDoItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Row(children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0)
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                controller: todoController,
                decoration: const InputDecoration(
                    hintText: 'Adicionar nova tarefa',
                    border: InputBorder.none),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 20, right: 20),
              width: 50,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  addToDoItem(todoController.text);
                  todoController.clear();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: tdBlue,
                    maximumSize: const Size(50, 50),
                    minimumSize: const Size(50, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 10),
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 30),
                ),
              ))
        ]));
  }
}
