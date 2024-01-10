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
          title: const Text("Organizzazione"),
        ),
        body: Column(children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.yellow,
              child: const Center(
                  child: Text('riga 1',
                      style: TextStyle(
                          backgroundColor: Colors.red, fontSize: 50))),
            ),
          ),

        Expanded(child: Spacer(
        )

        ),
          Expanded(child: Container(
            color: Colors.green,
              child: const Align(
              alignment: Alignment.centerRight,
              child: Text('riga 2')
          )
          )),

          Expanded(child: Container(
            color: Colors.blue,
                   child: Text('riga 3')
    )
          )

    ]
        )
    );



  }
}


