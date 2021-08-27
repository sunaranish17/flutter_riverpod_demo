import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<String> fetchValue() async {
  await Future.delayed(Duration(milliseconds: 400));

  return "Hello";
}

final futureProvider =
    FutureProvider.autoDispose<String>((ref) => fetchValue());

class AutoDisposeModifierPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('AutoDispose Modifier'),
      ),
      body: Center(
        child: future.when(
          data: (value) => Padding(
            padding: EdgeInsets.all(48),
            child: Text(value.toString()),
          ),
          loading: () => CircularProgressIndicator(),
          error: (e, stack) => Text('Error: $e'),
        ),
      ),
    );
  }
}
