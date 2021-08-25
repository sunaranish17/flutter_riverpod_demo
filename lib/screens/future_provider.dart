import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<int> fetchWeather() async {
  await Future.delayed(Duration(seconds: 2));

  return 20;
}

final futureProvider = FutureProvider<int>((ref) => fetchWeather());

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureAsyncValue = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Provider"),
      ),
      body: Center(
        child: futureAsyncValue.when(
          data: (value) => Text("Value: $value"),
          loading: () => CircularProgressIndicator(),
          error: (e, st) => Text("Error $e"),
        ),
      ),
    );
  }
}
