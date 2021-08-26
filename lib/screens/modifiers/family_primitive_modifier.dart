import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_flutter_demo/screens/modifiers/user_helper.dart';
import 'package:riverpod_flutter_demo/widget/user_widget.dart';

Future<User> fetchUser(String username) async {
  await Future.delayed(Duration(milliseconds: 400));

  return users.firstWhere((user) => user.name == username);
}

final userProvider = FutureProvider.family<User, String>(
    (ref, userName) async => fetchUser(userName));

class FamiliyPrimitivePage extends StatefulWidget {
  const FamiliyPrimitivePage({Key? key}) : super(key: key);

  @override
  _FamiliyPrimitivePageState createState() => _FamiliyPrimitivePageState();
}

class _FamiliyPrimitivePageState extends State<FamiliyPrimitivePage> {
  String username = users.first.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Family Primitive Modifier"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              child: Consumer(builder: (context, ref, _) {
                final future = ref.watch(userProvider(username));

                return future.when(
                  data: (user) => UserWidget(user: user),
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (e, stack) => Center(child: Text('Not found')),
                );
              }),
            ),
            SizedBox(
              height: 32,
            ),
            buildSearch(),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            buildUsernameDropdown(),
          ],
        ),
      );

  Widget buildUsernameDropdown() => Row(
        children: [
          Text(
            'Username',
            style: TextStyle(fontSize: 24),
          ),
          Spacer(),
          DropdownButton<String>(
            value: username,
            iconSize: 32,
            style: TextStyle(fontSize: 24, color: Colors.black),
            onChanged: (value) => setState(() => username = value!),
            items: users
                .map((user) => user.name)
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                .toList(),
          ),
        ],
      );
}
