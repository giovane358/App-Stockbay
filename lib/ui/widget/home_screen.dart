import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockbay/data/bloc/auth_bloc.dart';
import 'package:stockbay/data/bloc/product_bloc.dart';
import 'package:stockbay/data/services/product_service.dart';
import 'package:stockbay/domain/models/product_models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
              Navigator.pushReplacementNamed(context, "/insert");
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) =>
            ProductBloc(ProductService())..add(FetchProductsEvent()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  Product product = state.products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text("\$${product.priceInCents.toString()}"),
                  );
                },
              );
            } else if (state is ProductError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('No products available'));
            }
          },
        ),
      ),
    );
  }
}
