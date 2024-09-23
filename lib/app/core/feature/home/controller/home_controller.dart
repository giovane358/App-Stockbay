import 'dart:convert';
import 'dart:ffi';
import 'package:application_prof/app/core/feature/login/controller/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/api/config.dart';

class Product {
  final String id;
  final String name;
  final String dtCompra;
  final double priceInCents;
  final Bool active;

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
      priceInCents: json['priceInCents'],
      active: json['active'],
    );
  }
}

Future<List<Product>> fetchUserProducts() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');

  final response = await http.get(
    Uri.parse(baseUrl),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((product) => Product.fromJson(product)).toList();
  } else {
    throw Exception('Failed to load products: ${response.body}');
  }
}
