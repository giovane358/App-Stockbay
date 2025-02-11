import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockbay/data/services/product_service.dart';
import 'package:stockbay/domain/models/product_models.dart';

// Estados
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductCreating extends ProductState {}

class ProductCreated extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}

// Eventos
abstract class ProductEvent {}

class CreateProductEvent extends ProductEvent {
  final Product product;
  CreateProductEvent(this.product);
}

class FetchProductsEvent extends ProductEvent {}

// Bloc
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService productService;

  ProductBloc(this.productService) : super(ProductInitial()) {
    // Registrando o handler para o evento `FetchProductsEvent`
    on<FetchProductsEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        List<Product> products = await productService.getProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError("Falha ao carregar produtos"));
      }
    });

    // Registrando o handler para o evento `CreateProductEvent`
    on<CreateProductEvent>((event, emit) async {
      emit(ProductCreating());
      try {
        await productService.createProduct(event.product);
        emit(ProductCreated()); // Produto criado com sucesso
      } catch (e) {
        emit(ProductError("Erro ao criar produto: $e"));
      }
    });
  }
}
