import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marketplaceflutterapp/page/login.dart';
import 'package:marketplaceflutterapp/page/setting_address.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool _isLoading = false;

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkSharedPreference();
  }

  void checkSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            }),
        title: Text('Profil'),
      ),
      body: Container(
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: <Widget>[
                    profile(),
                    Expanded(
                      child: address(),
                    ),
                    actionProfile(),
                  ],
                )),
    );
  }

  Container profile() {
    return Container(
      height: 230,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.green, Colors.lightGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTr2fEE8ya4KUrdVbTCQL1oKTOwyL8iWS6RFCF7P0TX0DsfqLRd&usqp=CAU'),
            ),
            shape: CircleBorder(),
            elevation: 18.0,
            clipBehavior: Clip.antiAlias,
          ),
          Text(
            'Nama Pengguna',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'email@mail.com',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
          Text(
            '08999999999',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }

  Container address() {
    return Container(
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    child: Text(
                      'Alamat utama',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Jl. Mataram, Indonesia',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container actionProfile() {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey,
              blurRadius: 3.0,
              offset: Offset(0.0, -2.0))
        ],
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          OutlineButton(
            child: Text(
              "Edit Alamat",
              style: TextStyle(fontSize: 16),
            ),
            borderSide: BorderSide(color: Colors.green),
            disabledBorderColor: Colors.green,
            disabledTextColor: Colors.green,
            shape: StadiumBorder(),
            onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context) => SettingAddressPage()));
//              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => SettingAddressPage()), (Route<dynamic> route) => false);
            },
          ),
          OutlineButton(
            child: Text(
              "Sing Out",
              style: TextStyle(fontSize: 16),
            ),
            borderSide: BorderSide(color: Colors.green),
            disabledBorderColor: Colors.green,
            disabledTextColor: Colors.green,
            shape: StadiumBorder(),
            onPressed: (){
              sharedPreferences.clear();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }

}
