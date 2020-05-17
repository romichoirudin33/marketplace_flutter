import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Product {
  final int id;
  final String image;
  final String name;
  final double price;
  final int rating;
  final int countSell;

  Product(
      this.id, this.image, this.name, this.price, this.rating, this.countSell);
}

class ProductWidget extends StatelessWidget {
  final Product product;

  ProductWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                product.image,
                width: 155,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 33,
                    alignment: Alignment.topLeft,
                    child: Text(
                      product.name.toUpperCase(),
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Container(
                    height: 14,
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Rp." + product.price.toString(),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      RatingBar(
                        initialRating: product.rating.toDouble(),
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 12,
                        ignoreGestures: true,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text("(" + product.countSell.toString() + ")",
                          style: TextStyle(
                            fontSize: 12,
                          )),
                      Image.network(
                        "https://pngimage.net/wp-content/uploads/2018/06/gratis-ongkir-png-5-300x200.png",
                        height: 25,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Product> productList = [
  new Product(
    1,
    "https://pngimage.net/wp-content/uploads/2018/06/gratis-ongkir-png-5-300x200.png",
    "name 1",
    200000,
    3,
    2,
  ),
  new Product(
    2,
    "https://pngimage.net/wp-content/uploads/2018/06/gratis-ongkir-png-5-300x200.png",
    "name 2",
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
