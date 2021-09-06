import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_flutter_demo/screens/todo/models/todo.dart';

final _currentToDo = Provider<Todo>((ref) => throw UnimplementedError());

class ToDoItem extends StatefulWidget {
  const ToDoItem({Key? key}) : super(key: key);

  @override
  _ToDoItemState createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  late TextEditingController _textEditingController;
  late FocusNode _textFocusNode;

  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final todo = ref.watch(_currentToDo);
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
          ),
          onDismissed: (_) {
            ref.read(todosProvider.notifier).remove(todo.id);
          },
          child: FocusScope(
            child: Focus(
              onFocusChange: (isFocused) {
                if (!isFocused) {
                  setState(() {
                    hasFocus = false;
                  });

                  ref.read(todosProvider.notifier).edit(
                      id: todo.id, description: _textEditingController.text);
                } else {
                  _textEditingController.text = todo.description;
                  _textEditingController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _textEditingController.text.length),
                  );
                }
              },
              child: ListTile(
                onTap: () {
                  setState(() {
                    hasFocus = true;
                  });
                  _textFocusNode.requestFocus();
                },
                title: hasFocus
                    ? TextField(
                        focusNode: _textFocusNode,
                        controller: _textEditingController,
                      )
                    : Text(todo.description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: todo.completed,
                      onChanged: (_) =>
                          ref.read(todosProvider.notifier).toggle(todo.id),
                    ),
                    IconButton(
                      onPressed: () =>
                          ref.read(todosProvider.notifier).remove(todo.id),
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
