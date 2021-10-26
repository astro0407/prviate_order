
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: new Color(0xfff8faf8),
          centerTitle: true,
          elevation: 1.0,
          title: SizedBox(
              height: 35.0, child: Image.asset("assets/insta_logo.png"))),
      body: Center(
        child: GestureDetector(
          child: Container(
            width: 250.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Color(0xFF4285F4),
                border: Border.all(color: Colors.black)),
            child: Row(
              children: <Widget>[
                Image.asset('assets/google_icon.jpg'),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Sign in with Google',
                      style: TextStyle(color: Colors.white, fontSize: 16.0)),
                )
              ],
            ),
          ),
          onTap: () {
          },
        ),
      ),
    );
  }

  void authenticateUser() {
    print("Inside Login Screen -> authenticateUser");
  }
}
