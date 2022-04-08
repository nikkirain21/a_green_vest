// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:a_green_vest/LoginPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:file_picker/file_picker.dart';

import 'SignupPageUser.dart';

class SignupPageFarmer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignupPageFarmerState();
  }
}

class _SignupPageFarmerState extends State<SignupPageFarmer> {
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
          title: Text("Back",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16)),
          centerTitle: false,
          titleSpacing: 0.0),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 20),
              Column(
                children: <Widget>[
                  Text(
                    "Sign up as a Farmer",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Column(
                children: <Widget>[
                  inputFile(label: "Name:"),
                  inputFile(label: "Contact Number:"),
                  inputFile(label: "Email:"),
                  inputFile(label: "Password", obscureText: true),
                ],
              ),
              SizedBox(height: 10),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Alert(
                    context: context,
                    type: AlertType.info,
                    title: "Upload Documents",
                    desc:
                        "Upload your PCIC Documents here and a Valid Government ID",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Upload",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        //upload feature should be implemented here
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                      )
                    ],
                  ).show();
                },
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: const Color(0xff57B894)),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Upload Documents",
                  style: TextStyle(
                      color: const Color(0xff57B894),
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Material(
                    child: Checkbox(
                      value: agree,
                      onChanged: (value) {
                        setState(() {
                          agree = value ?? false;
                        });
                      },
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                        text: "I agree to the",
                        style: TextStyle(
                          color: Color(0xff3F3D56),
                          fontSize: 12,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  'Terms and Conditions \n and Privacy Policy',
                              style: TextStyle(
                                color: Color(0xff57B894),
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              )),
                        ]),
                  ),
                ],
              ),
              SizedBox(height: 10),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  //improve or delete OTP process
                  openDialog();
                },
                // defining the shape
                color: Color(0xff57B894),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text.rich(
                    TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(
                          color: Color(0xff3F3D56),
                          fontSize: 12,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Login',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                              style: TextStyle(
                                color: Color(0xff57B894),
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              )),
                        ]),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
                'Please input One-Time Password sent to your Contact Number'),
            content: TextField(
              autofocus: true,
            ),
            actions: [TextButton(onPressed: submit, child: Text('SUBMIT'))],
          ));

  void submit() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 8,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(123, 87, 184, 149),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(30)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Color.fromARGB(123, 87, 184, 149)),
            )),
      ),
      SizedBox(
        height: 15,
      )
    ],
  );
}
