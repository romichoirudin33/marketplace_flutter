import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplaceflutterapp/pages/checkout.dart';

import 'package:marketplaceflutterapp/products.dart';

class MyChartsPage extends StatefulWidget {
  @override
  _MyChartsState createState() => _MyChartsState();
}

class _MyChartsState extends State<MyChartsPage> {
  bool pilihSemua = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            }),
        title: Text('Keranjang'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 3.0))
                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.green,
                        value: pilihSemua,
                        onChanged: (bool value) {
                          setState(() {
                            pilihSemua = value;
                          });
                        },
                      ),
                      Text('Pilih semua')
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Hapus',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 10),
                children: chartList.map((item) => ChartWidget(item)).toList(),
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
                        "Total harga",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        "Rp. 0",
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
                        "Lanjutkan (1)",
                        style: TextStyle(fontSize: 16),
                      ),
                      borderSide: BorderSide(color: Colors.green),
                      disabledBorderColor: Colors.green,
                      disabledTextColor: Colors.green,
                      shape: StadiumBorder(),
                      onPressed: _onCheckout,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onCheckout() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => CheckOutPage()),
        (Route<dynamic> route) => false);
  }
}

class Chart {
  final int id;
  final Product product;
  final int jumlah;

  Chart(this.id, this.product, this.jumlah);
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

class ChartWidget extends StatelessWidget {
  final Chart chart;

  ChartWidget(this.chart);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Checkbox(
                activeColor: Colors.green,
                value: true,
                onChanged: null,
              ),
            ),
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
                    "Rp." + chart.product.price.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.remove_circle,
                          size: 18,
                        ),
                        onPressed: null,
                      ),
                      Text(chart.jumlah.toString()),
                      IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.green,
                          size: 18,
                        ),
                        onPressed: null,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
