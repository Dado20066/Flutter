import 'package:flutter/material.dart';

void main() {
  runApp(const Ristorante());
}

class Ristorante extends StatelessWidget {
  const Ristorante({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const PaginaHome(),
    );
  }
}

class PaginaHome extends StatefulWidget {
  const PaginaHome({super.key});

  @override
  State<PaginaHome> createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<PaginaHome> {
  double quantitaAntipasti = 0;
  double quantitaPrimi = 0;
  double quantitaSecondi =0;
  double prezzoAntipasti =0;
  double prezzoPrimi =0;
 double prezzoSecondi =0;
 double prezzoTotale=0.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Ristorante Veloce"),

        ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("imaginiPranzo/tovaglia2.jpeg"),
              repeat: ImageRepeat.repeat),
        ),

        child: Column(
          children: <Widget>[
            Text('antipasti, 4€',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Image(image: AssetImage("imaginiPranzo/antipasto.jpeg")),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    min: 0,
                    max: 6,
                    divisions: 6,
                    value: quantitaAntipasti,
                    onChanged: (value) {
                      setState(() {
                        quantitaAntipasti = value;
                        prezzoAntipasti=value*4;
                        prezzoTotale=prezzoAntipasti+prezzoPrimi+prezzoSecondi;
                      });
                    },
                  ),
                ),
                Text('$quantitaAntipasti: $prezzoAntipasti',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),


                Text('primi, 6€',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Image(image: AssetImage("imaginiPranzo/primo.jpeg")),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    min: 0,
                    max: 6,
                    divisions: 6,
                    value: quantitaPrimi,
                    onChanged: (value) {
                      setState(() {
                        quantitaPrimi = value;
                        prezzoPrimi=value*6;
                        prezzoTotale=prezzoAntipasti+prezzoPrimi+prezzoSecondi;
                      });
                    },
                  ),
                ),
                Text('$quantitaPrimi: $prezzoPrimi',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),

          Text('secondi, 8€',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Image(image: AssetImage("imaginiPranzo/secondo.jpeg")),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    min: 0,
                    max: 6,
                    divisions: 6,
                    value: quantitaSecondi,
                    onChanged: (value) {
                      setState(() {
                        quantitaSecondi= value;
                        prezzoSecondi=value*8;
                        prezzoTotale=prezzoAntipasti+prezzoPrimi+prezzoSecondi;
                      });
                    },
                  ),
                ),
                Text('$quantitaSecondi: $prezzoSecondi',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),


            Text('TOTALE : $prezzoTotale ',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
          ],
        ),
      )
    );
  }
}
