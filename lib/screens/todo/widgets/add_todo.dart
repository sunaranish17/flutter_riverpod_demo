import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_flutter_demo/screens/todo/models/todo.dart';

class AddToDoPanel extends ConsumerStatefulWidget {
  const AddToDoPanel({Key? key}) : super(key: key);

  @override
  _AddToDoPanelState createState() => _AddToDoPanelState();
}

class _AddToDoPanelState extends ConsumerState<AddToDoPanel> {
  TextEditingController _textEditingController = TextEditingController();

  void _submit([String? value]) {
    ref.read(todosProvider.notifier).add(_textEditingController.value.text);
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(hintText: 'New todo'),
              onSubmitted: _submit,
            ),
          ),
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
