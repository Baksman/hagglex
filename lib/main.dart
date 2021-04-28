import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hagglex/services/config.dart';
import 'package:hagglex/ui/login_screen.dart';
import 'package:hagglex/ui/sign_up_complete.dart';
import 'package:hagglex/ui/sign_up_screen.dart';
import 'package:hagglex/ui/verification_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Hagglex',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff2E1963),
          accentColor: Color(0xffFFC175),
          primarySwatch: Colors.blue,
        ),
        routes: {
          SignUpScreen.routeName: (context) {
            return SignUpScreen();
          },
          VerificationScreen.routeName: (context) {
            return VerificationScreen();
          },
          SignUpCompletete.routeName: (context) {
            return SignUpCompletete();
          }
        },
        home: LoginScreen(),
      ),
    );
  }
}
