import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final numberProvider = Provider<int>((ref) => 17);

class ProviderPage extends ConsumerWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final number = ref.watch(numberProvider).toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Center(
        child: Text(
          number,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
