import 'package:flutter/material.dart';
import 'package:hello_world/widgets/new_todo.dart';

// Widgets
import '../widgets/search_box.dart';
import '../widgets/todo_item.dart';

// Model
import '../model/todo.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({
    Key? key,
  }) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<ToDo> _foundToDo = [];
  final todoController = TextEditingController();
  final todosList = ToDo.todoList();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      NewToDo(todoController: todoController, addToDoItem: _addToDoItem),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            SearchBox(
              onSearch: _runFilter,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Tarefas',
                style: TextStyle(fontSize: 20),
              ),
            ),
            if (_foundToDo.isEmpty)
              const Text(
                'Nenhuma tarefa encontrada.',
                style: TextStyle(fontSize: 16),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                reverse: true,
                itemCount: _foundToDo.length,
                itemBuilder: (context, index) {
                  final todo = _foundToDo[index];
                  return ToDoItem(
                    todo: todo,
                    onToDoChanged: _handleToDoChange,
                    onDeleteItem: _deleteToDoItem,
                  );
                },
              ),
          ],
        ),
      )
    ]);
  }

// Functions
  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(ToDo todo) {
    setState(() {
      todosList.removeWhere((item) => item.id == todo.id);
      _foundToDo.removeWhere((item) => item.id == todo.id);
    });
  }

  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      setState(() {
        _foundToDo = List.from(todosList);
      });
    } else {
      setState(() {
        _foundToDo = todosList
            .where((item) => item.todoText!
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      });
    }
  }

  void _addToDoItem(String toDo) {
    if (toDo.isEmpty) return;

    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          todoText: toDo));
    });

    _foundToDo = todosList;
  }
}
