import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplaceflutterapp/admin/new_ordering.dart';
import 'package:marketplaceflutterapp/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomePage extends StatefulWidget {
  AdminHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  bool _isLoading = false;

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("admin") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
        leading: Icon(Icons.home),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: () {
              sharedPreferences.clear();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          children: <Widget>[
            Text(
              "Dashboard",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.list,
                  color: Colors.black54,
                ),
                Text(
                  "Menu",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => NewOrderingPage()));
              },
              child: Container(
                height: 120,
                child: Card(
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.info,
                        size: 75,
                        color: Colors.white,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Pemesanan Baru',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          _isLoading
                              ? Text('0', style: TextStyle(color: Colors.white))
                              : Text('1', style: TextStyle(color: Colors.white))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
                height: 120,
                child: Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.shopping_cart,
                        size: 75,
                        color: Colors.white,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Daftar Pemesanan',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          Text('0', style: TextStyle(color: Colors.white))
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
