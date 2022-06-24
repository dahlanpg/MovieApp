import 'package:flutter/material.dart';
import 'package:projeto01/models/post_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostModel args = ModalRoute.of(context)!.settings.arguments as PostModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Container(
        padding: EdgeInsets.all(28),
        child: Column(children: [Text(args.body)]),
      ),
    );
  }
}
