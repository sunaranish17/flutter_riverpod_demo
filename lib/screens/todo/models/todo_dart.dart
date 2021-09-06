import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

var _uuid = Uuid();

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
