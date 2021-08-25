import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_flutter_demo/screens/home.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: Home(),
  )));
}
