// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movieapp/controllers/login_controller.dart';

class CustomLoginButton extends StatelessWidget {
  final LoginController loginController;

  const CustomLoginButton({
    Key? key,
    required this.loginController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.inLoader,
      builder: (_, inLoader, __) => inLoader
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                loginController.auth().then((retorno) {
                  if (retorno) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Login incorreto!'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  }
                });
              },
              child: Text('Entrar',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
    );
  }
}
