import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestaOCroce(),
    );
  }
}

class TestaOCroce extends StatefulWidget {
  @override
  _TestaOCroceState createState() => _TestaOCroceState();
}

class _TestaOCroceState extends State<TestaOCroce> {
  String selezionaimmagine = '';
  bool haVinto = false;

  void selectImage(String immagine) {
    setState(() {
      selezionaimmagine = immagine;
      generateResult();
    });
  }

  void generateResult() {
    if (selezionaimmagine == '') {
      haVinto = false;
    } else {
      if (Random().nextBool()) {
        haVinto = true;
      } else {
        haVinto = false;
      }
    }
  }

  void rigioca() {
    setState(() {
      selezionaimmagine = '';
      haVinto = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testa o Croce'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => selectImage('immagini/dietroEuro.png'),
                child: Column(
                  children: [
                    Image.asset('immagini/dietroEuro.png', width: 150, height: 150),
                    Text('TESTA', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => selectImage('immagini/euroFronte.png'),
                child: Column(
                  children: [
                    Image.asset('immagini/euroFronte.png', width: 150, height: 150),
                    Text('CROCE', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          if (haVinto)
            Column(
              children: [
                Text(
                  'Hai vinto!',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
              ],
            ),
          if (!haVinto && selezionaimmagine != '')
            Column(
              children: [
                Text(
                  'Hai perso!',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
              ],
            ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: rigioca,
            child: Text('RIGIOCA'),
          ),
        ],
      ),
    );
  }
}