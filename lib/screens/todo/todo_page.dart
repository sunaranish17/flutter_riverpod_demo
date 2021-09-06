import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_flutter_demo/screens/todo/models/todo.dart';
import 'package:riverpod_flutter_demo/screens/todo/widgets/add_todo.dart';
import 'package:riverpod_flutter_demo/screens/todo/widgets/todo_item.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Do",
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            AddToDoPanel(),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  return ListView(
                    children: [
                      ...ref
                          .watch(todosProvider)
                          .map(
                            (todo) => ProviderScope(
                              overrides: [currentToDo.overrideWithValue(todo)],
                              child: const ToDoItem(),
                            ),
                          )
                          .toList()
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
