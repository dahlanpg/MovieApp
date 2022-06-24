import 'package:flutter/material.dart';
import 'package:projeto01/components/login/custom_login_button.dart';
import 'package:projeto01/controllers/login_controller.dart';
import 'package:projeto01/views/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        color: Colors.blueGrey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.people,
                  size: MediaQuery.of(context).size.height * 0.3),
              CustomTextField(
                onChanged: _loginController.setLogin,
                label: 'Usuário',
              ),
              CustomTextField(
                onChanged: _loginController.setPassword,
                label: 'Senha',
                obscure: true,
              ),
              SizedBox(height: 50),
              CustomLoginButton(loginController: _loginController),
            ]),
      ),
    );
  }
}
