class Product {
  final String name;
  final String description;
  final double price;

  Product({required this.name, required this.description, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      description: json['description'],
      price: json['price'],
    );
  }
}
