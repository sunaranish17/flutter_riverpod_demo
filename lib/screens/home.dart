import 'package:flutter/material.dart';
import 'package:riverpod_flutter_demo/screens/provider_page.dart';

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
                )
              ],
            ),
          )),
    );
  }
}
