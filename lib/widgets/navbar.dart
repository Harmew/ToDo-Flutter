import 'package:flutter/material.dart';

// Constants
import '../constants/colors.dart';

AppBar navBar() {
  return AppBar(
    backgroundColor: tdBGColor,
    elevation: 0,
    centerTitle: true,
    title: const Text(
      'ToDo',
      style: TextStyle(
        color: tdBlack,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
