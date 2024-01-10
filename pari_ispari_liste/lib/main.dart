import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var uno = "";
  var due = "";

  var lungaUno = [];
  var lungaDue = [];

  double _currentSliderValue1 = 0;

  void faQualcosa() {
    setState(() {
      if (_currentSliderValue1 % 2 == 0) {
        uno = "${_currentSliderValue1}";
        lungaUno.add(_currentSliderValue1.toInt());
      } else {
        due = "$_currentSliderValue1";
        lungaDue.add(_currentSliderValue1.toInt());
      }
    });
  }

  ListTile genera(context, index) {
    return ListTile(
      tileColor: Colors.blue,
      title: Text("${lungaUno[index]}", style: TextStyle(color: Colors.yellow, fontSize: 30)),
      leading: Icon(Icons.add, color: Colors.red, size: 30),
      onTap: () {
        setState(() {
          lungaDue.add(lungaUno[index]);
          lungaUno.removeAt(index);
        });
      },
    );
  }

  ListTile generaSeconda(context, index) {
    return ListTile(
      tileColor: Colors.green,
      title: Text("${lungaDue[index]}", style: TextStyle(color: Colors.white, fontSize: 30)),
      leading: Icon(Icons.accessibility_new, color: Colors.red, size: 30),
      onTap: () {
        setState(() {
          lungaUno.add(lungaDue[index]);
          lungaDue.removeAt(index);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme!.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: ListView.builder(itemBuilder: genera, itemCount: lungaUno.length)),
            Expanded(
              child: Row(
                children: [
                  Slider(
                    max: 5,
                    divisions: 5,
                    value: _currentSliderValue1,
                    label: _currentSliderValue1.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue1 = value;
                      });
                    },
                  ),
                  FloatingActionButton(
                    onPressed: faQualcosa,
                    child: Text("Più"),
                  ),
                ],
              ),
            ),
            Expanded(child: ListView.builder(itemBuilder: generaSeconda, itemCount: lungaDue.length))
          ],
        ),
      ),
    );
  }
}
