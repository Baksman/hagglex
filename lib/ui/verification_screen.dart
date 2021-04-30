import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hagglex/ui/sign_up_complete.dart';
import '../utils/mediaquery_utils.dart';
import 'package:build_context/build_context.dart';

class VerificationScreen extends StatefulWidget {
  static const routeName = "/verification";
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextStyle _formStyle = TextStyle(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    final screenHeight = context.appHeight;
    return Form(
      key: _formKey,
      child: Scaffold(
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
                Text(
                  "Verify your account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 450,
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
                        Center(
                          child: Container(
                              height: 50,
                              child: Image.asset("assets/verified_purple.png")),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "Just sent a verification code to your email \n please enter code",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          // style: _formStyle,
                          maxLength: 6,
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if ((val.replaceAll(" ", "").length < 6 )||
                                int.tryParse(val) == null) {
                              return "invalid";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: new UnderlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.white)),
                            labelText: "verification code",
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            "This code will expire in 10minute",
                            style: TextStyle(fontSize: 10),
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
                                if (_formKey.currentState.validate()) {
                                  Navigator.pushNamed(
                                      context, SignUpCompletete.routeName);
                                }
                              },
                              color: Theme.of(context).primaryColor,
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            "Resend code",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
