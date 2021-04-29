import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  static String routeName = "/dahsboard";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Welcome to Dashboard"),
          )
        ],
      ),
    );
  }
}
