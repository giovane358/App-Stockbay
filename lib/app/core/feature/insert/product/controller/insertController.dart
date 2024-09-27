import 'dart:convert';

import 'package:application_prof/app/data/api/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final controllerName = TextEditingController();
final controllerPrice = TextEditingController();
final controllerdtCompra = TextEditingController();

Future<void> postProduct(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token') ?? 'Nenhum token encontrado';

  final response = await http.post(Uri.parse('$baseUrl/product'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "name": controllerName.text,
        "dtCompra": controllerdtCompra.text,
        "price_in_cents": controllerPrice.text
      }));

  if (response.statusCode == 200) {
    print('object');
  } else {
    throw Exception('Falha ao carregar produtos ');
  }
}
