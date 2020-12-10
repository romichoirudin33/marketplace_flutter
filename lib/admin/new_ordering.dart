import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplaceflutterapp/admin/detail_ordering.dart';

class NewOrderingPage extends StatefulWidget {
  @override
  _NewOrderingPageState createState() => _NewOrderingPageState();
}

class _NewOrderingPageState extends State<NewOrderingPage> {
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
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          children: <Widget>[
            Text(
              "Daftar Pemesan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.list,
                  color: Colors.black54,
                ),
                Text(
                  "Pesanan baru",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => DetailOrderingPage()));
              },
              child: Container(
                height: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.account_circle,
                                size: 40,
                                color: Colors.black54,
                              ),
                              Card(
                                color: Colors.deepOrange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 3),
                                  child: Text('Belum diantar',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Nama Pemesan',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text('Rp. 1.000.000',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 13)),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 10,
                                color: Colors.green,
                              ),
                              Text('01/01/2020 11:30',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 10.6,
                                      fontWeight: FontWeight.w400)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
