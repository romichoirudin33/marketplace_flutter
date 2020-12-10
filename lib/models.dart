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

class Chart {
  final int id;
  final Product product;
  final int jumlah;

  Chart(this.id, this.product, this.jumlah);
}