// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:stockbay/domain/models/product_models.dart';

class ProductService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8080"));

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get("/product");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((product) => Product.fromJson(product)).toList();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception("Failed to load products: $e");
    }
  }

  Future<void> createProduct(Product product) async {
    try {
      final response = await _dio.post(
        "/product",
        data: {
          'name': product.name,
          'dtCompra': product.dtCompra.toIso8601String(),
          'priceInCents': product.priceInCents ??
              0, // Garantir que priceInCents não seja nulo
          'active': product.active ?? true,
        },
      );
    } catch (e) {
      if (e is DioException) {
        // Verifica se há uma resposta com erro
        if (e.response != null) {
        } else {}
      } else {}
    }
  }
}
