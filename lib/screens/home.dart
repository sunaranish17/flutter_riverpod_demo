import 'package:flutter/material.dart';
import 'package:riverpod_flutter_demo/screens/modifiers/family_primitive_modifier.dart';
import 'package:riverpod_flutter_demo/screens/notifiers/change_notifier.dart';
import 'package:riverpod_flutter_demo/screens/notifiers/state_notifier.dart';
import 'package:riverpod_flutter_demo/screens/providers/future_provider.dart';
import 'package:riverpod_flutter_demo/screens/providers/provider_page.dart';
import 'package:riverpod_flutter_demo/screens/providers/state_provider.dart';
import 'package:riverpod_flutter_demo/screens/providers/stream_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Demo"),
      ),
      body: Center(
        child: buildPages(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.flutter_dash),
            label: "Providers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flutter_dash),
            label: "Notifiers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flutter_dash),
            label: "Modifiers",
          ),
        ],
        onTap: (int index) => setState(
          () => this.index = index,
        ),
      ),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return buildProviderPage(context);
      case 1:
        return buildNotifierPage(context);
      case 2:
        return buildModifierPage(context);
      default:
        return Container();
    }
  }

  Widget buildProviderPage(BuildContext context) => Column(
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
      );

  Widget buildNotifierPage(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangeNotifierPage()),
              );
            },
            child: Text("Change Notifier"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StateNotifierPage(),
                ),
              );
            },
            child: Text("State Notifier"),
          ),
        ],
      );

  Widget buildModifierPage(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FamiliyPrimitivePage()),
              );
            },
            child: Text("Family Primtive Notifier"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StateNotifierPage(),
                ),
              );
            },
            child: Text("State Notifier"),
          ),
        ],
      );
}
