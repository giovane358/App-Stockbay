import 'dart:convert';

import 'package:application_prof/app/data/api/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final fromKey = GlobalKey<FormState>();
final controllerLogin = TextEditingController();
final controllerPassword = TextEditingController();
String? token;

Future<void> login() async {
  final response = await http.post(
    Uri.parse('$baseUrl/login'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'login': controllerLogin.text,
      'password': controllerPassword.text,
    }),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    token = data['token'];
    print('Login bem-sucedido, token: $data');
  } else {
    print('Erro ao fazer login: ${response.body}');
  }
}
