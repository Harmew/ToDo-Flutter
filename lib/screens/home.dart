import 'package:flutter/material.dart';

// Constants
import '../constants/colors.dart';

// Widgets
import '../widgets/navbar.dart';
import '../widgets/todo_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor, appBar: navBar(), body: const ToDoList());
  }
}
