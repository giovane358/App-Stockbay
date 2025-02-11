import 'package:intl/intl.dart';

class Product {
  final String id;
  final String name;
  final DateTime dtCompra;
  final int priceInCents;
  final bool active;

  Product({
    required this.id,
    required this.name,
    required this.dtCompra,
    required this.priceInCents,
    required this.active,
  });

  // Método para criar um Product a partir de um JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      dtCompra:
          DateTime.parse(json['dtCompra'] as String), // Convertendo a data
      priceInCents: json['priceInCents'] as int,
      active: json['active'] as bool,
    );
  }

  // Método para converter o Product para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dtCompra': DateFormat('yyyy-MM-dd').format(dtCompra), // Formatar a data
      'priceInCents': priceInCents,
      'active': active,
    };
  }
}
