import 'package:application_prof/app/core/feature/insert/product/controller/insertController.dart';
import 'package:application_prof/app/core/widget/widget_form.dart';
import 'package:flutter/material.dart';

class InsertProduct extends StatefulWidget {
  const InsertProduct({super.key});

  @override
  State<InsertProduct> createState() => _InsertProductState();
}

class _InsertProductState extends State<InsertProduct> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 57, 57),
      body: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Adicionar um novo produto',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          ContainerEdit(
            child: TextFormField(
              controller: controllerName,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Meia',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          ContainerEdit(
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Descrição',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          ContainerEdit(
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Quantidade',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          ContainerEdit(
            child: TextFormField(
              controller: controllerdtCompra,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Data de Compra',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          ContainerEdit(
            child: TextFormField(
              controller: controllerPrice,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Valor de Compra',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          ContainerEdit(
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Valor de Venda',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          ContainerEdit(
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'fornecedor',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: size.width * 0.7,
              height: size.height * 0.03,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(23)),
              child: const Text(
                'Cadastrar produto novo',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            onTap: () {
              postProduct(context);
            },
          )
        ],
      )),
    );
  }
}
