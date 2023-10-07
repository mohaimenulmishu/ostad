class Product {
  String image;
  String name;
  String color;
  String size;
  int quantity = 0;
  int price;
  int totalAmount =0;


  Product(
      {required this.image,
        required this.name,
        required this.color,
        required this.size,
        required this.price});
}