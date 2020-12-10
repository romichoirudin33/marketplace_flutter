import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketplaceflutterapp/admin/home.dart';
import 'package:marketplaceflutterapp/pages/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:marketplaceflutterapp/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.lightGreen],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: <Widget>[
                  headerSection(),
                  bodySection(),
                  buttonSection(),
                  anotherLogin(),
                ],
              ),
      ),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      child: Center(
        child: Text(
          'Market',
          style: TextStyle(
              color: Colors.teal, fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Container bodySection() {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: usernameController,
            cursorColor: Colors.green,
            style: TextStyle(color: Colors.lightGreen),
            decoration: InputDecoration(
              icon: Icon(Icons.account_circle, color: Colors.green),
              hintText: "Username",
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen),
              ),
              hintStyle: TextStyle(color: Colors.green),
            ),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            controller: passwordController,
            cursorColor: Colors.green,
            obscureText: true,
            style: TextStyle(color: Colors.lightGreen),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.green),
              hintText: "Password",
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen),
              ),
              hintStyle: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        onPressed:
            usernameController.text == "" || passwordController.text == ""
                ? null
                : () {
                    setState(() {
                      _isLoading = true;
                    });

                    signIn(usernameController.text, passwordController.text);
                  },
        elevation: 0.0,
        color: Colors.teal,
        child: Text("SIGN IN", style: TextStyle(color: Colors.white)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  void signIn(String username, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (username == 'username' && password == 'password') {
      setState(() {
        _isLoading = false;
      });
      sharedPreferences.setString("token", "iniTokenNya");
      sharedPreferences.setString("role", "user");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  MyHomePage(title: 'Home Page')),
          (Route<dynamic> route) => false);
    }
    if (username == 'admin' && password == 'password') {
      setState(() {
        _isLoading = false;
      });
      sharedPreferences.setString("token", "iniTokenNya");
      sharedPreferences.setString("admin", "admin");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  AdminHomePage(title: 'Admin dashboard')),
          (Route<dynamic> route) => false);
    } else {
      setState(() {
        _isLoading = false;
      });
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Username dan password tidak cocok'),
        duration: Duration(seconds: 3),
      ));
    }
  }

  Container anotherLogin() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Text(
            'Belum punya akun ? ',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => RegisterPage()),
                  (Route<dynamic> route) => false);
            },
            child: Text(
              'Register',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
