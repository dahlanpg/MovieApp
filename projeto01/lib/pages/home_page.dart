import 'package:flutter/material.dart';
import 'package:projeto01/controllers/home_controller.dart';
import 'package:projeto01/pages/home_repository_imp.dart';
import 'package:projeto01/services/prefs_service.dart';
//import 'package:projeto01/repositories/home_repository_hidden.dart';

import '../models/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final HomeController _controller = HomeController(HomeRepositoryHidden());
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Lista')),
        actions: [
          IconButton(
              onPressed: () {
                PrefsService.logout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login', (_) => true);
              },
              icon: Icon(Icons.exit_to_app_rounded))
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
          valueListenable: _controller.posts,
          builder: (_, lst, __) {
            return ListView.separated(
                itemCount: lst.length,
                separatorBuilder: (_, __) => Divider(),
                itemBuilder: (_, idx) => ListTile(
                      leading: Text(lst[idx].id.toString()),
                      trailing: Icon(Icons.arrow_forward),
                      title: Text(lst[idx].title),
                      onTap: () => Navigator.of(context).pushNamed(
                        '/details',
                        arguments: lst[idx],
                      ),
                    ));
          }),
    );
  }
}
