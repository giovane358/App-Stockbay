import 'dart:convert';

import 'package:application_prof/app/data/api/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final fromKey = GlobalKey<FormState>();
final controllerLogin = TextEditingController();
final controllerPassword = TextEditingController();
final controllerConfimPassword = TextEditingController();
String? token;

Future<void> register() async {
  final response = await http.post(
    Uri.parse('$baseUrl/register'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'login': controllerLogin.text,
      'password': controllerPassword.text,
      'role': 'USER' // ou ['ADMIN'] se for admin
    }),
  );

  if (response.statusCode == 200) {
    print('Usuário registrado com sucesso');
  } else {
    print('Erro ao registrar: ${response.body}');
  }
}
