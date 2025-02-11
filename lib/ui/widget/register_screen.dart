// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:stockbay/data/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void _register() async {
    String? message = await _authService.register(
      loginController.text,
      passwordController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message ?? "Erro ao registrar")),
    );

    if (message == "Usuário registrado com sucesso!") {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrar")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: loginController,
              decoration: InputDecoration(labelText: "login"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Senha"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _register,
              child: Text("Registrar"),
            ),
          ],
        ),
      ),
    );
  }
}
