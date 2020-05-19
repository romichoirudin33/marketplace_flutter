import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplaceflutterapp/page/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'include/banner.dart';
import 'products.dart';
import 'page/charts.dart';
import 'page/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Market',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final List<Product> productList = [
  new Product(
    1,
    "https://image.made-in-china.com/202f0j00GRNUHFeCZukM/Portable-All-in-One-POS-Computer-Android-Payment-Credit-Card-Reader-for-Small-Business-Resturant-Shops.jpg",
    "Android Payment",
    200000,
    3,
    2,
  ),
  new Product(
    2,
    "https://solidshop-production-f.squarecdn.com/spree/images/567/modal/tile-X2-BranHodor_%281%29.jpg?1518214113",
    "PC Payment",
    200000,
    3,
    2,
  ),
  new Product(
    3,
    "https://pngimage.net/wp-content/uploads/2018/06/gratis-ongkir-png-5-300x200.png",
    "name 3",
    200000,
    3,
    2,
  ),
  new Product(
    4,
    "https://pngimage.net/wp-content/uploads/2018/06/gratis-ongkir-png-5-300x200.png",
    "name 4",
    200000,
    3,
    2,
  ),
];

class _MyHomePageState extends State<MyHomePage> {

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async{
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
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
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context) => MyChartsPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
        ],
      ),

      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  MyBanner(),
                  Card(
                    child: Container(
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: 65.0,
                            height: 80.0,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  margin: EdgeInsets.only(top: 5),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                    size: 24,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 40,
                                  child: Text(
                                    "Favorit",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 65.0,
                            height: 80.0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  margin: EdgeInsets.only(top: 5),
                                  child: Icon(
                                    Icons.fastfood,
                                    color: Colors.lightGreen,
                                    size: 24,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  child: Text(
                                    "Makanan",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 65.0,
                            height: 80.0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  margin: EdgeInsets.only(top: 5),
                                  child: Icon(
                                    Icons.live_tv,
                                    color: Colors.deepOrangeAccent,
                                    size: 24,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  child: Text(
                                    "Entertaint",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 65.0,
                            height: 80.0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  margin: EdgeInsets.only(top: 5),
                                  child: Icon(
                                    Icons.phone_android,
                                    color: Colors.grey,
                                    size: 24,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  child: Text(
                                    "Phone",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 65.0,
                            height: 80.0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  margin: EdgeInsets.only(top: 5),
                                  child: Icon(
                                    Icons.computer,
                                    color: Colors.lightBlue,
                                    size: 24,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  child: Text(
                                    "Komputer",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 65.0,
                            height: 80.0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  height: 40,
                                  margin: EdgeInsets.only(top: 5),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                    size: 24,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  child: Text(
                                    "Favorit",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(top: 5),
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
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                          child: OutlineButton(
                            child: Text("Semua produk",
                                style: TextStyle(fontSize: 13)),
                            borderSide: BorderSide(color: Colors.green),
                            disabledBorderColor: Colors.green,
                            disabledTextColor: Colors.green,
                            shape: StadiumBorder(),
                            onPressed: null,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                          child: OutlineButton(
                            child:
                                Text("Terbaru", style: TextStyle(fontSize: 13)),
                            borderSide: BorderSide(color: Colors.green),
                            shape: StadiumBorder(),
                            onPressed: null,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                          child: OutlineButton(
                            child: Text("Paling Laris",
                                style: TextStyle(fontSize: 13)),
                            borderSide: BorderSide(color: Colors.green),
                            shape: StadiumBorder(),
                            onPressed: null,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                          child: OutlineButton(
                            child: Text("Recomendasi",
                                style: TextStyle(fontSize: 13)),
                            borderSide: BorderSide(color: Colors.green),
                            shape: StadiumBorder(),
                            onPressed: null,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                          child: OutlineButton(
                            child: Text("Promo hari ini",
                                style: TextStyle(fontSize: 13)),
                            borderSide: BorderSide(color: Colors.green),
                            shape: StadiumBorder(),
                            onPressed: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10, bottom: 5),
                    child: Text(
                      "Semua Produk",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
              ),
              delegate: SliverChildListDelegate(productList.map((item) {
                return ProductWidget(item);
              }).toList()),
            )
          ],
        ),
      ),
    );
  }


}
