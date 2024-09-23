import 'package:flutter/material.dart';

class Wallcome extends StatelessWidget {
  const Wallcome({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
      width: size.width * 0.9,
      child: const Text(
        'Olá, Bem-Vindo a Stockbay',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  final String label;
  const TextForm({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      width: size.width * 0.9,
      child: Text(
        label,
        textAlign: TextAlign.left,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class ContainerEdit extends StatelessWidget {
  final Widget child;
  const ContainerEdit({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
