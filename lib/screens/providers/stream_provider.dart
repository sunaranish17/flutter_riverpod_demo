import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final streamProvider = StreamProvider.autoDispose<String>(
  (ref) => Stream.periodic(
    Duration(milliseconds: 400),
    (count) => '$count',
  ),
);

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamValue = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Provider"),
      ),
      body: Center(
        // child: buildStreamBuilder(ref), //Old approach
        child: streamValue.when(
          //Recommended Approach
          data: (value) => Text(
            "Value: $value",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          loading: () => CircularProgressIndicator(),
          error: (error, st) => Text("Error: $error"),
        ),
      ),
    );
  }

  //Custom Display
  Widget buildStreamBuilder(ref) {
    final streamValue = ref.watch(streamProvider.stream);

    return StreamBuilder<String>(
      stream: streamValue,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          default:
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              final counter = snapshot.data;

              return Text(
                "Value: $counter",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
        }
      },
    );
  }
}
