class Product {
  final String id;
  final String name;
  final String dtCompra;
  final int priceInCents;
  final bool active;

  Product(
      {required this.id,
      required this.name,
      required this.dtCompra,
      required this.priceInCents,
      required this.active});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      dtCompra: json['dtCompra'],
      priceInCents: json['price_in_cents'],
      active: json['active'],
    );
  }
}
