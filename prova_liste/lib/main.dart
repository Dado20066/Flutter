import 'package:flutter/material.dart';

void main() {
  runApp(ListApp());
}

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListScreen(),
    );
  }
}

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
 List<int> items = List.generate(15, (index) => (index + 1) * 2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(items[index].toString()),

          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController controller = TextEditingController();

              return AlertDialog(
                title: Text('Aggiungi elemento'),
                content: TextField(
                  controller: controller,
                ),
                actions: <Widget>[
                ],
              );
            },
          );
        },
      ),
    );
  }
}