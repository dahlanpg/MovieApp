import 'package:flutter/material.dart';
import 'package:movieapp/controllers/login_controller.dart';

import '../components/custom_login_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(28),
          color: Color.fromRGBO(66, 66, 66, 1),
          child: Column(children: [
            Icon(
              Icons.person_pin,
              size: MediaQuery.of(context).size.height * 0.4,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Usuário'),
                hintText: 'seed',
              ),
              onChanged: _controller.setLogin,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Senha'),
                hintText: 'dees',
              ),
              onChanged: _controller.setPassword,
              obscureText: true,
            ),
            SizedBox(height: 50),
            CustomLoginButton(loginController: _controller),
          ]),
        ),
      ),
    );
  }
}
