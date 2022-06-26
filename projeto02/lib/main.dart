import 'package:flutter/material.dart';
import 'package:projeto02/pages/details_page.dart';
import 'package:projeto02/pages/home_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieApp',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (_) => const HomePage(),
      },
    );
  }
}
