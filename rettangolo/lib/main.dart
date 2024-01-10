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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'rettangolo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double perimetro = 0;
  double base = 0;
  double altezza = 0;
  double area = 0;

  final _controllerBase = TextEditingController();
  final _controllerAlteza = TextEditingController();

  void _calcola() {
    double base = double.parse(_controllerBase.text);
    double altezza = double.parse(_controllerAlteza.text);
    setState(() {
      perimetro = base + altezza *2 ;
      area = base * altezza;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const Text(
            'Base:',
          ),
          TextField(
            controller: _controllerBase,
          ),
          const Text(
            'Altezza:',
          ),
          TextField(
            controller: _controllerAlteza,
          ),
          ElevatedButton(onPressed: _calcola, child: Text("calcola area+ perimetro")),
          Text("perimetro: $perimetro"),
          Text("area: $area")

        ],
      ),
    );
  }
}