import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final stateProvider = StateProvider.autoDispose<int>((ref) => 0);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(stateProvider);
    final counter = provider.state;
    return Scaffold(
      appBar: AppBar(
        title: Text("State Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Value: $counter",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final reset = ref.read(stateProvider);
              reset.state = 0;
            },
            child: Text("Reset"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // provider.state++;
          final incrementor = ref.read(stateProvider);
          incrementor.state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
