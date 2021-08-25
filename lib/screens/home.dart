import 'package:flutter/material.dart';
import 'package:riverpod_flutter_demo/screens/providers/future_provider.dart';
import 'package:riverpod_flutter_demo/screens/providers/provider_page.dart';
import 'package:riverpod_flutter_demo/screens/providers/state_provider.dart';
import 'package:riverpod_flutter_demo/screens/providers/stream_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProviderPage()),
                    );
                  },
                  child: Text("Provider"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StateProviderPage(),
                      ),
                    );
                  },
                  child: Text("State Provider"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FutureProviderPage(),
                      ),
                    );
                  },
                  child: Text("Future Provider"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StreamProviderPage(),
                      ),
                    );
                  },
                  child: Text("Stream Provider"),
                )
              ],
            ),
          )),
    );
  }
}
