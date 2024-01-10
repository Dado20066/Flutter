import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slot Machine',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imagePaths = [
    'immagini/7machine.png',
    'immagini/banana.png',
    'immagini/cocomero.jpg',

  ];
  List<int> punti = [10, 20, 30];
  int creditiTotali = 0;
  int gettoni = 10;
  int immagine1 = 0;
  int immagine2 = 1;
  int immagine3 = 2;



  bool mostraMessaggio = false;

  void gira() {
    setState(() {
      if (creditiTotali >= 1000 || gettoni <= 0) {
        resetta();
      } else {
        int random1 = Random().nextInt(imagePaths.length);
        int random2 = Random().nextInt(imagePaths.length);
        int random3 = Random().nextInt(imagePaths.length);
        int random4 = Random().nextInt(imagePaths.length);
        int random5 = Random().nextInt(imagePaths.length);
        int random6 = Random().nextInt(imagePaths.length);

        immagine1 = random1;
        immagine2 = random2;
        immagine3 = random3;



        if (immagine1 == immagine2 && immagine2 == immagine3  ) {
          creditiTotali += 30;
        } else if (
            immagine1 == immagine2 ||
            immagine1 == immagine3 ||
            immagine2 == immagine1 ||
            immagine2 == immagine3 ||
            immagine3 == immagine1 ||
            immagine3 == immagine2
        )
        {
          creditiTotali += 20;

        } else if (
        immagine1 != immagine2 && immagine1 != immagine3 && immagine2 != immagine3) {
          creditiTotali += 5;
        }

        gettoni--;
      }
    });
  }

  void resetta() {
    setState(() {
      creditiTotali = 0;
      gettoni = 10;
      mostraMessaggio = true;
    });
  }
  void prendiGettoni() {
    setState(() {
      if (creditiTotali <= 5) {
        mostraMessaggio = true;
      } else {
        gettoni += 10;
        creditiTotali -= 5;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slot Machine'),
        ),
        body: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    imagePaths[immagine1],
                    width: 100,
                    height: 100,
                  ),
                  Image.asset(
                    imagePaths[immagine2],
                    width: 100,
                    height: 100,
                  ),
                  Image.asset(
                    imagePaths[immagine3],
                    width: 100,
                    height: 100,
                  ),

                ],
              ),
              SizedBox(height: 20),
              Text('Crediti Totali: $creditiTotali',style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              Text('Gettoni: $gettoni',style: TextStyle(fontSize: 20,color: Colors.blue),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (creditiTotali >= 10) {
                      gettoni += 10;
                      creditiTotali -= 10;
                    }

                  });
                },
                child: Text('+'),

              ),


              SizedBox(height: 16),
              ElevatedButton(
                onPressed: gira,
                child: Text('GIOCA',style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Text(
                creditiTotali >=1000
                    ? ' HAI VINTO' : '', style: TextStyle(fontSize: 30,color: Colors.purple),
              ),

              gettoni == 0
                  ? Column(
                children: [
                  Text(
                    "Gettoni finiti. Hai perso.",
                    style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Se hai gettoni in più premi sul +",
                    style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                ],
              )
                  : Text(
                (immagine1 == immagine2 && immagine2 == immagine3)
                    ? 'JACKPOT!! Beato teeeee'
                    : '',
                style: TextStyle(fontSize: 30,color: Colors.orange,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
    );
  }
}