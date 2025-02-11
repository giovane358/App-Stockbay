import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockbay/data/bloc/product_bloc.dart';
import 'package:stockbay/domain/models/product_models.dart';

class ProductCreateScreen extends StatelessWidget {
  const ProductCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productBloc =
        BlocProvider.of<ProductBloc>(context); // Pegando o ProductBloc

    final TextEditingController nameController = TextEditingController();
    final TextEditingController dtCompraController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Produto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome do Produto'),
            ),
            TextField(
              controller: dtCompraController,
              decoration: InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final product = Product(
                  id: '1', // Defina um ID válido
                  name: nameController.text,
                  dtCompra: DateTime.now(),
                  priceInCents: int.parse(priceController.text) *
                      100, // Convertendo para centavos
                  active: true,
                );
                productBloc.add(CreateProductEvent(
                    product)); // Disparando o evento para criar o produto
              },
              child: Text('Criar Produto'),
            ),
            BlocListener<ProductBloc, ProductState>(
              listener: (context, state) {
                if (state is ProductCreated) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Produto criado com sucesso!')),
                  );
                }
                if (state is ProductError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              child:
                  Container(), // Placeholder para evitar erro de renderização
            ),
          ],
        ),
      ),
    );
  }
}
