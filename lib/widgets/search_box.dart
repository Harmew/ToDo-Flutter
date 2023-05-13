import 'package:flutter/material.dart';

// Constants
import '../constants/colors.dart';

class SearchBox extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBox({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 40,
        child: TextField(
          onChanged: onSearch,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Procurar',
            hintStyle: TextStyle(color: tdGrey),
          ),
        ),
      ),
    );
  }
}
