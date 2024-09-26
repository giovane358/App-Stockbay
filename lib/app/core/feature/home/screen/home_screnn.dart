import 'package:application_prof/app/core/feature/login/controller/login_controller.dart';
import 'package:application_prof/app/data/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>> futureProducts;
  String _token = "";

  @override
  void initState() {
    super.initState();
    loadToken();
  }
  //função para verificar se o usuario esta logado

  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token') ?? 'Nenhum token encontrado';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('$_token'),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.blue,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.exit_to_app),
            label: 'Sair do Aplicativo',
            onTap: () {
              logout(context);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.add),
            label: 'Adicionar',
          ),
          SpeedDialChild(
            child: const Icon(Icons.contact_phone),
            label: 'Fornecedores',
          ),
          SpeedDialChild(
            child: const Icon(Icons.settings),
            label: 'Configuração',
          ),
        ],
      ),
    );
  }
}
