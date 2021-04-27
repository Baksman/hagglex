import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hagglex/ui/verification_screen.dart';
import '../utils.dart';
import 'package:build_context/build_context.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/signup";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextStyle _formStyle = TextStyle(color: Colors.white);
  String _email;
  String _password;
  String _userName;
  String _referallLink;
  String _phoneNumber;

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.appHeight;
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight / 10,
              ),
              Container(
                width: 40,
                height: 30,
                child: Center(
                  child: Transform.translate(
                    offset: Offset(5, -5),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(.3),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Create a new account",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // style: _formStyle,
                        validator: (email) {
                          if (EmailValidator.validate(email)) {
                            _email = email;
                            return null;
                          }

                          return "invalid email";
                        },
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelText: "Email address",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // style: _formStyle,
                        validator: (val) {
                          if (val.replaceAll(" ", "").length < 8) {
                            return "Create username";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelText: "password(Min 8. characters)",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // style: _formStyle,
                        validator: (val) {
                          if (val.replaceAll(" ", "").length < 8) {
                            return "invalid";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelText: "Create a username",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // style: _formStyle,
                        validator: (val) {
                          if (val.replaceAll(" ", "").length < 8) {
                            return "invalid";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelText: "enter phone number",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // style: _formStyle,
                        validator: (val) {
                          if (val.replaceAll(" ", "").length < 8) {
                            return "invalid";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: new UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white)),
                          labelText: "referall link",
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          "By signing,you agree to hagglex privacy policy",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CupertinoButton(
                            child: Text("SIGN UP"),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, VerificationScreen.routeName);
                            },
                            color: Theme.of(context).primaryColor,
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
