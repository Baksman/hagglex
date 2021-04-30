import 'package:build_context/build_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hagglex/ui/dash_board_screen.dart';
import '../utils/mediaquery_utils.dart';

class SignUpCompletete extends StatelessWidget {
  static const routeName = "/signupcomplete";

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.appHeight;
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight / 3,
              ),
              Container(
                  height: 70, child: Image.asset("assets/verified_logo.png")),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "Set up complete",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              )),
              SizedBox(
                height: 20,
              ),
              Text(
                "Thank you for setting up hagglex account",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SizedBox(height: screenHeight / 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CupertinoButton(
                        color: Theme.of(context).accentColor,
                        child: Text(
                          "START EXPLORING",
                          style: TextStyle(color: context.primaryColor),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              DashBoardScreen.routeName,
                              (Route<dynamic> route) => false);
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
