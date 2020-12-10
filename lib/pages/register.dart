import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketplaceflutterapp/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:marketplaceflutterapp/main.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
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
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text(
          'Register',
          style: TextStyle(
              color: Colors.teal, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();

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
            controller: nameController,
            cursorColor: Colors.green,
            style: TextStyle(color: Colors.lightGreen),
            decoration: InputDecoration(
              icon: Icon(Icons.account_box, color: Colors.green),
              hintText: "Nama Lengkap",
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen),
              ),
              hintStyle: TextStyle(color: Colors.green),
            ),
          ),
          SizedBox(height: 20.0),
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
          SizedBox(height: 20.0),
          TextFormField(
            controller: emailController,
            cursorColor: Colors.green,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.lightGreen),
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.green),
              hintText: "Email",
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen),
              ),
              hintStyle: TextStyle(color: Colors.green),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: phoneController,
            cursorColor: Colors.green,
            keyboardType: TextInputType.phone,
            style: TextStyle(color: Colors.lightGreen),
            decoration: InputDecoration(
              icon: Icon(Icons.phone, color: Colors.green),
              hintText: "Phone",
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen),
              ),
              hintStyle: TextStyle(color: Colors.green),
            ),
          ),
          SizedBox(height: 20.0),
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
          SizedBox(height: 20.0),
          TextFormField(
            controller: passwordController,
            cursorColor: Colors.green,
            obscureText: true,
            style: TextStyle(color: Colors.lightGreen),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.green),
              hintText: "Ulangi Password",
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
                    register(
                        nameController.text,
                        usernameController.text,
                        emailController.text,
                        phoneController.text,
                        passwordController.text,
                        confirmPasswordController.text);
                  },
        elevation: 0.0,
        color: Colors.teal,
        child: Text("Daftar", style: TextStyle(color: Colors.white)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  void register(
      String name, username, email, phone, password, confirmPassword) async {
    //make validation in here

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _isLoading = false;
    });
    sharedPreferences.setString("token", "iniTokenNya");
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (BuildContext context) => MyHomePage(title: 'Home Page')),
        (Route<dynamic> route) => false);
  }

  Container anotherLogin() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: <Widget>[
          Text(
            'Sudah punya akun ? ',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => false);
            },
            child: Text(
              'Sign In',
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
