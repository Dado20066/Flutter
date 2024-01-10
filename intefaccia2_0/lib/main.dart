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
          title: Text('pippo'),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Base'),

            SizedBox(width: 46),
            Text('ooo'),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text('Altezza'),
            SizedBox(width: 30),
            Text('ppp'),
          ],
        ),
        SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          child: Text(
            'Complicato',
            style: TextStyle(
              fontSize: 40,
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 120),
        Container(
          color: Colors.lightBlue,

    alignment: Alignment.center,
          child: Text(
            'Parecchio',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
