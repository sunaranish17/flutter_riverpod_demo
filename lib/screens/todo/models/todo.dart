import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

var _uuid = Uuid();

final _sampleTodos = [
  Todo('Buy cat food'),
  Todo('Learn Riverpod'),
];

final todosProvider =
    StateNotifierProvider((ref) => ToDoNotifier(ref.read, _sampleTodos));

final completedTodos = Provider<List<Todo>>((ref) {
  final todos = ref.watch(todosProvider);
  return todos.where((todo) => todo.completed).toList();
});

class ToDoNotifier extends StateNotifier<List<Todo>> {
  ToDoNotifier(this.read, [List<Todo>? state]) : super(<Todo>[]);

  final Reader read;

  void add(String description) {
    state = [...state, Todo(description)];
  }

  void toggle(String id) {
    // Method 5
    if (read(settingsProvider).state.deleteOnComplete) {
      remove(id);
      return;
    }

    state = state.map((todo) {
      if (todo.id == id) {
        return Todo(
          todo.description,
          id: todo.id,
          completed: !todo.completed,
        );
      }
      return todo;
    }).toList();
  }

  void edit({required String id, required String description}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            description,
            id: todo.id,
            completed: todo.completed,
          )
        else
          todo,
    ];
  }

  void remove(String id) {
    state = state.where((element) => element.id != id).toList();
  }
}

@immutable
class Todo {
  final String id;
  final String description;
  final bool completed;

  Todo(
    this.description, {
    this.completed = false,
    String? id,
  }) : this.id = id ?? _uuid.v4();
}

final settingsProvider = StateProvider<Settings>((ref) {
  return Settings();
});

@immutable
class Settings {
  final bool deleteOnComplete;

  Settings({this.deleteOnComplete = false});
}
