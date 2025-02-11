import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockbay/data/bloc/auth_bloc.dart';
import 'package:stockbay/data/bloc/product_bloc.dart';
import 'package:stockbay/data/services/auth_service.dart';
import 'package:stockbay/data/services/product_service.dart';
import 'package:stockbay/ui/widget/home_screen.dart';
import 'package:stockbay/ui/widget/insert_product.dart';
import 'package:stockbay/ui/widget/login_screen.dart';
import 'package:stockbay/ui/widget/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(AuthService()),
        ),
        BlocProvider(
          create: (context) => ProductBloc(ProductService()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/login",
        routes: {
          "/login": (context) => LoginScreen(),
          "/register": (context) => RegisterScreen(),
          "/home": (context) => HomeScreen(),
          "/insert": (context) => ProductCreateScreen(),
        },
      ),
    );
  }
}
