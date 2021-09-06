import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_flutter_demo/screens/todo/models/todo.dart';

enum _MenuOptions { deleteOnComplete }

class Menu extends ConsumerWidget {
  const Menu({Key? key}) : super(key: key);

  Future<void> onSelected(WidgetRef ref, _MenuOptions result) async {
    if (result == _MenuOptions.deleteOnComplete) {
      final currentSetting = ref.read(settingsProvider).state.deleteOnComplete;
      ref.read(settingsProvider).state =
          Settings(deleteOnComplete: !currentSetting);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = ref.watch(settingsProvider).state.deleteOnComplete;
    return PopupMenuButton<_MenuOptions>(
      onSelected: (result) {
        onSelected(ref, result);
      },
      icon: const Icon(
        Icons.menu,
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<_MenuOptions>>[
        PopupMenuItem<_MenuOptions>(
          value: _MenuOptions.deleteOnComplete,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Delete on complete"),
              Checkbox(
                value: isChecked,
                onChanged: null,
              )
            ],
          ),
        )
      ],
    );
  }
}
