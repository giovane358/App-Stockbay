// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:application_prof/app/core/modal/product.dart';
import 'package:application_prof/app/data/api/config.dart';
import 'package:http/http.dart' as http;
import 'package:application_prof/app/core/feature/login/screen/login.page.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Product>> fetchProducts() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token') ?? 'Nenhum token encontrado';

  final response = await http.get(
    Uri.parse('$baseUrl/product'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body);
    return body.map((dynamic item) => Product.fromJson(item)).toList();
  } else {
    throw Exception('Falha ao carregar produtos ');
  }
}

Future<void> logout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  await prefs.remove('username');

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const LoginPage()),
  );
}
