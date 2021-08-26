import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Car {
  final int? speed;
  final int? doors;

  Car({
    this.speed = 120,
    this.doors = 4,
  });

  Car copy({
    int? speed,
    int? doors,
  }) =>
      Car(
        speed: speed ?? this.speed,
        doors: doors ?? this.doors,
      );
}

class CarNotifier extends StateNotifier<Car> {
  CarNotifier() : super(Car());

  void setDoors(int doors) {
    final newState = state.copy(doors: doors);
    state = newState;
  }

  void increaseSpeed() {
    final speed = state.speed! + 5;
    final newState = state.copy(speed: speed);
    state = newState;
  }

  void hitBrake() {
    final speed = max(0, state.speed! - 30);
    final newState = state.copy(speed: speed);
    state = newState;
  }
}

final stateNotifierProvider = StateNotifierProvider((ref) => CarNotifier());

class StateNotifierPage extends ConsumerWidget {
  const StateNotifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final car = ref.watch(stateNotifierProvider);
    final speed = car.speed;
    final door = car.doors;

    final carNotifier = ref.watch(stateNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("State Notifier Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Speed: $speed",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Doors: $door",
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
                    carNotifier.increaseSpeed();
                  },
                  child: Text("Increase +5"),
                ),
                ElevatedButton(
                  onPressed: () {
                    carNotifier.hitBrake();
                  },
                  child: Text("Hit Brake -30"),
                ),
              ],
            ),
            Slider(
              value: car.doors.toDouble(),
              onChanged: (value) => carNotifier.setDoors(value.toInt()),
              max: 5,
            )
          ],
        ),
      ),
    );
  }
}
