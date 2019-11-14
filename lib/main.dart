import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Login',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String pass = "admin";

  String animationType = "idle";

  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        setState(() {
          animationType = "test";
        });
      } else {
        setState(() {
          animationType = "idle";
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1d1d1d),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60.0,
              //  width: 200.0,
            ),
            Center(
              child: Container(
                height: 200,
                width: 200,
                child: CircleAvatar(
                  child: ClipOval(
                    child: FlareActor(
                      'assets/teddy-test.flr',
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: animationType,
                    ),
                  ),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
              //width:  10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 140.0,
                width: 530.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'User Name',
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                    ),
                    Divider(),
                    TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 80.0,
              width: 530.0,
              padding: EdgeInsets.all(20.0),
              child: RaisedButton(
                  color: Colors.pink,
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    if (passwordController.text.compareTo(pass) == 0) {
                      setState(() {
                        animationType = "success";
                      });
                    } else {
                      setState(() {
                        animationType = "fail";
                      });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
