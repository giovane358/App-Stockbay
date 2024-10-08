import 'package:application_prof/app/core/feature/login/screen/login.page.dart';
import 'package:application_prof/app/core/widget/widget_form.dart';
import 'package:application_prof/app/core/feature/register/controller/register_controller.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _resul = true;

  void _visibility() {
    setState(() {
      if (_resul == true) {
        _resul = false;
      } else {
        _resul = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 57, 57),
      body: Form(
        key: fromKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Wallcome(),
            const TextForm(label: 'Email'),
            ContainerEdit(
              child: TextFormField(
                controller: controllerLogin,
                decoration: const InputDecoration(
                  hintText: 'stockbay@gmail.com',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Esse campo é obrigatorio';
                  }
                  return null;
                },
              ),
            ),
            const TextForm(label: 'Senha'),
            ContainerEdit(
              child: TextFormField(
                controller: controllerPassword,
                obscureText: _resul,
                decoration: InputDecoration(
                  hintText: '***************',
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _visibility();
                    },
                    icon: const Icon(Icons.visibility_off, color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Esse campo é obrigatorio';
                  }
                  return null;
                },
              ),
            ),
            const TextForm(label: 'Confirme a Senha'),
            ContainerEdit(
              child: TextFormField(
                controller: controllerConfimPassword,
                obscureText: _resul,
                decoration: InputDecoration(
                  hintText: '***************',
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _visibility();
                    },
                    icon: const Icon(Icons.visibility_off, color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Esse campo é obrigatorio';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              width: size.width * 0.7,
              height: size.height * 0.03,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(23)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (fromKey.currentState!.validate()) {
                        register();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Registra-se',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              width: size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ja tenho conta! ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
