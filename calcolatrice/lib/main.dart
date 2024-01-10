import 'package:flutter/material.dart';

void main() {
  runApp(const Calcolatrice());
}

class Calcolatrice extends StatelessWidget {
  const Calcolatrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const PaginaHome(),
    );
  }
}

class PaginaHome extends StatefulWidget {
  const PaginaHome({Key? key}) : super(key: key);

  @override
  State<PaginaHome> createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<PaginaHome> {
  var numeri = [0.0];
  double _currentSliderValue1 = 0;
  final controllerTesto = TextEditingController();

  void cancellaRiga(int index) {
    setState(() {
      numeri.removeAt(index);
    });
  }

  void piu() {
    double numeroletto = double.tryParse(controllerTesto.text) ?? 0.0;
    setState(() {
      numeri.add(numeri.last + numeroletto);
    });
  }

  Widget generaVoceLista(context, index) {
    if(numeri[index]>=0) {
      return GestureDetector(
        onLongPress: () => cancellaRiga(index),
        child: ListTile(
          title: Text("parigi",style: Image(image: AssetImage('immagini/parigi.jpeg'))),
          subtitle: Text('150.0 per notte'),
          tileColor: Colors.yellow,
        ),
      );
    }else{
      return GestureDetector(
        onLongPress: () => cancellaRiga(index),
        child: ListTile(
          leading: const Icon(Icons.accessible_forward_sharp),
          title: Text("${numeri[index]}"),
          tileColor: Colors.red,
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("world tour"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: Material(
              color: Colors.blue,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    Container(
                      child: Text("")
                    ),
                itemBuilder: generaVoceLista,
                itemCount: numeri.length,
                padding: const EdgeInsets.all(5),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text("dove:",style: TextStyle(fontWeight:FontWeight.bold ),),
                TextField(
                  controller: controllerTesto,
                ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("notti:",style: TextStyle(fontWeight: FontWeight.bold),),
                      Slider(
                        max: 10,
                        divisions: 10,
                        value: _currentSliderValue1,
                        label: _currentSliderValue1.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue1 = value;
                          });
                        },
                      ),
                      Column(
                        children: [
                          ElevatedButton(onPressed: piu, child: const Text("aggiungi al viaggio")),
                        ],
                      ),
                  ],

                  ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
