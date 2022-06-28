import 'package:flutter/material.dart';
import 'package:movieapp/services/prefs_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.wait([PrefsService.isAuth(), Future.delayed(Duration(seconds: 2))])
        .then((ret) {
      if (ret[0]) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else
        Navigator.of(context).pushReplacementNamed('/login');
    });
    // Future.delayed(Duration(seconds: 2))
    //     .then((_) => Navigator.of(context).pushReplacementNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[700],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.grey[500],
          ),
        ],
      ),
    );
  }
}
