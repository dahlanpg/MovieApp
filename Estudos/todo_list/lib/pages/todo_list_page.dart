import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _TEcontroller = TextEditingController();

  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text('Lista de Tarefas'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          TextField(
            controller: _TEcontroller,
          ),
          Container(
            height: 300,
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tarefas[index]),
                    onLongPress: () {
                      setState(() {
                        tarefas.removeAt(index);
                      });
                    },
                  );
                }),
          )
        ]),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              if (_TEcontroller.text.length > 0) {
                setState(() {
                  tarefas.add(_TEcontroller.text);
                });
                _TEcontroller.clear();
              }
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              setState(() {
                tarefas.removeAt(tarefas.length - 1);
              });
              _TEcontroller.clear();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
