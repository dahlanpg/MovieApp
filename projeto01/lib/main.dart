import 'package:flutter/material.dart';
import 'package:projeto01/pages/details_page.dart';
import 'package:projeto01/pages/login_page.dart';
import 'package:projeto01/pages/splash_page.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto 01',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) => LoginPage(),
        '/home': (_) => const HomePage(),
        '/details': (_) => const DetailsPage(),
      },
    );
  }
}
