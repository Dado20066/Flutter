import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcolo Panini',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calcolo Panini'),
    );
  }
}


  final controllerLato = TextEditingController();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _calcolaArea() {
    var l = double.parse(_controllerLato.text);
    setState(() {
      _area = l*l;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quadrato')),
    body: Column(
       Text('lato: '),
   TextField(
     controller: _controllerLato,
   ),
      ElevatedButton(
        onPressed: _calcoloArea,
        child: Text('Calcola Area'),
        Text ('area = $_area')
      )
      ),
    );
  }
}
