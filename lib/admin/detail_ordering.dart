import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailOrderingPage extends StatefulWidget {
  @override
  _DetailOrderingPageState createState() => _DetailOrderingPageState();
}

class _DetailOrderingPageState extends State<DetailOrderingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            }),
        title: Text('Admin Dashboard'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Detail Pemesan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.list,
                  color: Colors.black54,
                ),
                Text(
                  "Nama Pemesan",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
