import 'package:flutter/material.dart';


void main() {

  runApp( HelloWorld() );

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

  State<SchermataPrincipale> createState(){

    return _SchermataPrincipaleState();

  }

}


class _SchermataPrincipaleState extends State<SchermataPrincipale> {

  String _testoPulsante = "Hello World!";


  void _saluta() {

    _testoPulsante = 'Ciao Mondo!';

    setState((){});

  }


  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text("La prima App"),

      ),

      body: Center(

        child: ElevatedButton(

          onPressed: _saluta,

          child: Text( _testoPulsante ),

        ),

      ),

    );

  }

}