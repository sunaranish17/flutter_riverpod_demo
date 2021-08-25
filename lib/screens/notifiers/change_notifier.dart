import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CarNotifier extends ChangeNotifier {
  int _speed = 120;

  void increase() {
    _speed += 5;

    notifyListeners();
  }

  void hitBreak() {
    _speed = max(0, _speed - 30);

    notifyListeners();
  }

  @override
  void dispose() {}
}

final carProvider = ChangeNotifierProvider<CarNotifier>((ref) => CarNotifier());

class ChangeNotifierPage extends ConsumerWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final car = ref.watch(carProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Notifier Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Speed: ${car._speed}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // car.increase();
                    ref.read(carProvider).increase();
                  },
                  child: Text("Increase +5"),
                ),
                ElevatedButton(
                  onPressed: () {
                    car.hitBreak();
                  },
                  child: Text("Hit Brake -30"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
