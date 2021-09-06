import 'package:flutter/material.dart';
import 'package:riverpod_flutter_demo/screens/todo/widgets/add_todo.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do"),
      ),
      body: AddToDoPanel(),
    );
  }
}
