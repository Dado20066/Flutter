import 'package:flutter/material.dart';

void main() {
  runApp(HelloWorld());
}

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SchermataPrincipale(),
    );
  }
}

class SchermataPrincipale extends StatefulWidget {
  @override
  State<SchermataPrincipale> createState() {
    return _SchermataPrincipaleState();
  }
}

class _SchermataPrincipaleState extends State<SchermataPrincipale> {
  String _testoPulsante = "Hello World!";

  void _saluta() {
    setState(() {
      _testoPulsante = 'Ciao Mondo!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("dimensioni"),
      ),
      body: Column(
         crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.green,
            child: const Text('verde', style: TextStyle(fontSize: 80)),
          ),
          Container(
            width: 300,
            color: Colors.red,
            child: const Text('rosso', style: TextStyle(fontSize: 80)),
          ),
          Container(
            width: 400,
            height:200,
            color: Colors.yellow,
            child: const Text('giallo', style: TextStyle(fontSize:80)),
          ),
          Container(
            width:200,
            color: Colors.blue,
            child: const Text('blu', style: TextStyle(fontSize: 80)),
          ),
         Expanded(
           flex: 5,
           child:
          Container(
            width: 300,
            color: Colors.grey,
            child: const Text('grigio', style: TextStyle(fontSize: 60)),
          ),
         )
        ],
      ),
    );
  }
}