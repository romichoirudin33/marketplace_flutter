import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:marketplaceflutterapp/page/charts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../products.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
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
        title: Text('Pengiriman'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Alamat Pengiriman', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 11),),
                            Text('Pilih Alamat Lain', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 11),),
                          ],
                        ),
                        Divider(
                            color: Colors.grey
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Jalan suka maju bersama',
                            style: TextStyle(color: Colors.grey, fontSize: 10),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: chartList.map((e) => _productContainer(e)).toList(),
                    ),
                  )
                ],
              ),
            ),
            Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Total Tagihan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        "Rp. 400,000.00",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.deepOrangeAccent),
                      ),
                    ],
                  ),
                  Container(
                    child: OutlineButton(
                      child: Text(
                        "Bayar (1)",
                        style: TextStyle(fontSize: 16),
                      ),
                      borderSide: BorderSide(color: Colors.green),
                      disabledBorderColor: Colors.green,
                      disabledTextColor: Colors.green,
                      shape: StadiumBorder(),
                      onPressed: null,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }

  final List<Chart> chartList = [
    new Chart(
        1,
        new Product(
          1,
          "https://image.made-in-china.com/202f0j00GRNUHFeCZukM/Portable-All-in-One-POS-Computer-Android-Payment-Credit-Card-Reader-for-Small-Business-Resturant-Shops.jpg",
          "Android Payment",
          200000,
          3,
          2,
        ),
        1),
    new Chart(
        2,
        new Product(
          2,
          "https://solidshop-production-f.squarecdn.com/spree/images/567/modal/tile-X2-BranHodor_%281%29.jpg?1518214113",
          "PC Payment",
          200000,
          3,
          2,
        ),
        1),
  ];

  Container _productContainer(Chart chart) {

    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: chart.product.price);
    MoneyFormatterOutput fo = fmf.output;

    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Image.network(
              chart.product.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  chart.product.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  chart.jumlah.toString() + ' barang',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Rp. " + fo.nonSymbol,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
