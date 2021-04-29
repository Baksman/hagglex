import 'package:build_context/build_context.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hagglex/services/config.dart';
import 'package:hagglex/ui/dash_board_screen.dart';
import 'package:hagglex/ui/sign_up_screen.dart';
import '../utils.dart';
import 'package:flushbar/flushbar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextStyle _formStyle = TextStyle(color: Colors.white);
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.appHeight;
    return Mutation(
        options: MutationOptions(
            document: gql(login),
            onError: (e) {
              Flushbar(
                title: "Error",

                message: e.graphqlErrors.first.message,
                duration: Duration(seconds: 3),
                flushbarPosition: FlushbarPosition.TOP,
                backgroundColor: Theme.of(context).primaryColor,
                margin: EdgeInsets.symmetric(horizontal: 10),
                borderRadius: 5,
                borderColor: Colors.white,
                // routeColor: Theme.of(context).primaryColor,
              )..show(context);
            },
            onCompleted: (val) {
              print(val);
            }),
        builder: (RunMutation runMutation, QueryResult result) {
          return Scaffold(
            backgroundColor: context.primaryColor,
            body: Theme(
              data: ThemeData(
                  primaryColor: Colors.white,
                  accentColor: Colors.white,
                  hintColor: Colors.white),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenHeight / 5,
                        ),
                        Text(
                          "Welcome!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          style: _formStyle,
                          validator: (email) {
                            if (EmailValidator.validate(email)) {
                              this.email = email;
                              return null;
                            }

                            return "invalid email";
                          },
                          decoration: InputDecoration(
                            border: new UnderlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.white)),
                            labelText: "Email address",
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          style: _formStyle,
                          validator: (password) {
                            if (password.replaceAll(" ", "").length < 8) {
                              return "invalid";
                            }
                            this.password = password;

                            return null;
                          },
                          decoration: InputDecoration(
                            border: new UnderlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.white)),
                            labelText: "password(Min 8. characters)",
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: CupertinoButton(
                              child: result.isLoading
                                  ? CupertinoActivityIndicator()
                                  : Text("LOGIN",
                                      style: TextStyle(color: Colors.black)),
                              onPressed: result.isLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState.validate()) {
                                        var a = {
                                          "input": email,
                                          "password": password
                                        };
                                        runMutation({'data': a});
                                        print(result.exception.graphqlErrors
                                            .first.message);
                                        print(result.exception.graphqlErrors
                                            .first.message);
                                        print(result.exception.graphqlErrors
                                            .first.message);
                                        print(result.data);
                                        if (!result.hasException) {
                                          Navigator.pushNamed(context,
                                              DashBoardScreen.routeName);
                                        }
                                      }
                                      // if (_formKey.currentState.validate()) {}
                                    },
                              color: Theme.of(context).accentColor,
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                            child: CupertinoButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, SignUpScreen.routeName);
                                },
                                child: Text("New User? Create a new account",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14))))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
