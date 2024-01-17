import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Fiori Piantati'),
    );
  }
}

class Piante {
  final String name;
  int quantita;
  final String? imagePath;
  final String? info;

  Piante({required this.name, required this.quantita, this.imagePath, this.info});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Color> backgroundColors = [
    Colors.yellow,
    Colors.white,
    Colors.purple,
    Colors.orange,
    Colors.white,
    Colors.red,
    Colors.purple,
    Colors.purple,
    Colors.blue,
    Colors.red,
    Colors.white,
    Colors.green,
    Colors.green,
  ];

  List<Piante> piante = [
    Piante(name: 'Primula', quantita: 0, imagePath: 'immagini/primula.jpeg'),
    Piante(name: 'Narciso', quantita: 0, imagePath: 'immagini/narciso.jpeg'),
    Piante(name: 'Viola', quantita: 0, imagePath: 'immagini/viola.jpeg'),
    Piante(name: 'Ranuncolo', quantita: 0, imagePath: 'immagini/ranunculo.jpeg'),
    Piante(name: 'Margherita', quantita: 0, imagePath: 'immagini/margherita.jpeg'),
    Piante(name: 'Rosa', quantita: 0, imagePath: 'immagini/rosa.jpeg'),
    Piante(name: 'Lavanda', quantita: 0, imagePath: 'immagini/lavanda.jpeg'),
    Piante(name: 'Aster', quantita: 0, imagePath: 'immagini/aster.jpeg'),
    Piante(name: 'Agapanto', quantita: 0, imagePath: 'immagini/agapanto.jpeg'),
    Piante(name: 'Dalia', quantita: 0, imagePath: 'immagini/dalia.jpeg'),
    Piante(name: 'Crisantemo', quantita: 0, imagePath: 'immagini/crisantemo.jpeg'),
    Piante(name: 'Pino Mugo', quantita: 0, imagePath: 'immagini/pino-mugo.jpeg'),
    Piante(name: 'Ginepro', quantita: 0, imagePath: 'immagini/ginepro.jpeg'),
  ];

  List<Piante> pianteSelezionate = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Lista delle piante disponibili
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8, // Larghezza 80% dello schermo
                child: ListView.builder(
                  itemCount: piante.length,
                  itemBuilder: (context, index) {
                    final Piante pianta = piante[index];
                    final Color backgroundColor = backgroundColors[index % backgroundColors.length];

                    return Dismissible(
                      key: Key(pianta.name),
                      onDismissed: (direction) {
                        setState(() {
                          piante.removeAt(index);
                        });
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            pianteSelezionate.add(Piante(
                              name: pianta.name,
                              quantita: 1,
                              imagePath: pianta.imagePath,
                              info: pianta.info,
                            ));
                          });
                        },
                        child: Container(
                          color: backgroundColor,
                          child: ListTile(
                            onLongPress: () {
                              setState(() {
                                piante.removeAt(index);
                              });
                            },
                            leading: pianta.imagePath != null
                                ? SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset(pianta.imagePath!),
                            )
                                : null,
                            title: Text(pianta.name),
                            subtitle: Text(pianta.info ?? ''),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Quantità: ${pianta.quantita}'),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      pianta.quantita++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20), // Spazio tra le due liste
            // Lista delle piante selezionate
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8, // Larghezza 80% dello schermo
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Piante Selezionate',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: pianteSelezionate.length,
                        itemBuilder: (context, index) {
                          final Piante piantaSelezionata = pianteSelezionate[index];
                          final Color backgroundColor = backgroundColors[index % backgroundColors.length];
                          return ListTile(
                            tileColor: backgroundColor, // Aggiunto il colore di sfondo
                            title: Text(piantaSelezionata.name),
                            subtitle: Row(
                              children: [
                                Text('Quantità: ${piantaSelezionata.quantita}'),
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (piantaSelezionata.quantita > 1) {
                                        piantaSelezionata.quantita--;
                                      } else {
                                        pianteSelezionate.removeAt(index);
                                      }
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      piantaSelezionata.quantita++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
