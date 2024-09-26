// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:application_prof/app/core/feature/home/screen/home_screnn.dart';
import 'package:application_prof/app/data/api/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//controller do Form
final fromKey = GlobalKey<FormState>();

//controller dos TextField
final controllerLogin = TextEditingController();
final controllerPassword = TextEditingController();

//var onde o token do usuario fica salva
String? token;

//var de retorno do click do usuario na senha
bool resul = true;

//var de retorno do click do usuario se ficar logado
bool isLoading = false;

//função de login
Future<void> login(BuildContext context) async {
  final response = await http.post(
    Uri.parse('$baseUrl/login'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'login': controllerLogin.text,
      'password': controllerPassword.text,
    }),
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    final String token = responseData['token'];
    // Salvar o token usando SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
    print('Login bem-sucedido, token: $token');
  } else {
    print('Erro ao fazer login: ${response.body}');
  }
}
