import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Immagini e Testo'),
        ),
        body: Column(
          children: [
            Image(image: AssetImage("immagini/cavallo-curiosita.jpg")),
            Text('Immagini e Testo'),
            Image(image: AssetImage("immagini/x.jpg"))
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
    );
  }
}
