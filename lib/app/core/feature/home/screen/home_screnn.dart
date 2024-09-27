// ignore_for_file: sort_child_properties_last

import 'package:application_prof/app/core/feature/insert/product/screen/insert_product.dart';
import 'package:application_prof/app/core/modal/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    // loadToken();
    futureProducts = fetchProducts();
  }
  //função para verificar se o usuario esta logado

  // Future<void> loadToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _token = prefs.getString('token') ?? 'Nenhum token encontrado';
  //   });
  // }

  Future<void> _refreshProducts() async {
    setState(() {
      futureProducts =
          fetchProducts(); // Recarrega os produtos ao puxar para atualizar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum produto encontrado.'));
          } else {
            return RefreshIndicator(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final product = snapshot.data![index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Preço: ${product.priceInCents}'),
                          Text('Preço: ${product.dtCompra}'),
                        ],
                      ),
                      trailing: product.active
                          ? const Icon(Icons.check)
                          : const Icon(Icons.close),
                    );
                  },
                ),
                onRefresh: _refreshProducts);
          }
        },
      ),
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
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const InsertProduct(),
                ),
              );
            },
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
