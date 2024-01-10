import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Cibo {
  String nome;
  double prezzo;
  String immagine;
  List<String> ingredienti; // Added this line

  Cibo(this.nome, this.prezzo, this.immagine, this.ingredienti); // Modified the constructor
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Menu'),
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
  double totale = 0.0;
  var piatti = [
    Cibo("Antipasto", 6.0, "Immagini/antipasto.jpeg", ["salumi", "formaggi"]),
    Cibo("Cappelletti", 10.0, "Immagini/cappelletti.jpeg", ["carne", "brodo"]),
    Cibo("Carbonara", 7.5, "Immagini/carbonara.jpg", ["uovo", "guanciale","spaghetti","pepe"]),
    Cibo("Amatriciana", 6.5, "Immagini/spaghetti.jpg", ["pomodoro", "guanciale"]),
    Cibo("Costarelle", 12.0, "Immagini/costarelle.jpeg", ["pepe", "sale"]),
    Cibo("Dolce", 4.0, "Immagini/dolce.jpg", ["zucchero", "fragole"]),
  ];

  Widget generaVoceLista(int index) {
    final piatto = piatti[index];

    return ListTile(
      title: Text(piatto.nome),
      subtitle: Text("Ingredienti: ${piatto.ingredienti.join(", ")}"),
      leading: IconButton(
        onPressed: () {},
        icon: Image.asset(piatto.immagine),
      ),
      onTap: () {
        aggiungiAlTotale(piatto.prezzo);
      },
    );
  }

  void aggiungiAlTotale(double prezzo) {
    setState(() {
      totale += prezzo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Material(
              color: Colors.orange,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => generaVoceLista(index),
                itemCount: piatti.length,
                padding: const EdgeInsets.all(5),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.orange,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'TOTALE: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('€ $totale', style: TextStyle(fontSize: 22)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
