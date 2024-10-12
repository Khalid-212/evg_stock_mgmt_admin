import 'package:flutter/material.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(children: [
          Text("User Account"),
          SizedBox(height: 20),
          Text("Name: John Doe"),
          SizedBox(height: 20),
          Text("Email: ")
        ]),
      ),
    );
  }
}
