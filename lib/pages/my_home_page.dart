//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../pages/about.dart';
import '../../pages/list_art.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../pages/list_creation.dart';

//pagina inicial de la app 
//aqui se mostrara un icono inicial de la app 
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//clase del estado de la pagina inicial
class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("Logger is working! in build method of _MyHomePageState");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menú',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.create),
              title: const Text('Lugares de HxH'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListArtScreen()),
                  //lleva a la pantalla de la lista de lugares de HxH
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Personajes de HxH'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListCreationScreen()),
                  //lleva a la pantalla de la lista de personajes de HxH
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Acerca de'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                  //leva a la pantalla de info de la app
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '“Pixel Art sobre una grilla personalizable"',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                
                // imágenes
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Image.asset('assets/Pixel-Art-Hot-Pepper-2-1.webp',
                          width: 120, height: 120, fit: BoxFit.cover),
                      const SizedBox(width: 10),
                      Image.asset('assets/Pixel-Art-Pizza-2.webp',
                          width: 120, height: 120, fit: BoxFit.cover),
                      const SizedBox(width: 10),
                      Image.asset('assets/Pixel-Art-Watermelon-3.webp',
                          width: 120, height: 120, fit: BoxFit.cover),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // botones crear y compartir
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ListArtScreen()),
                        );
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Crear'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Logger().d("Botón Compartir presionado");
                      },
                      icon: const Icon(Icons.share),
                      label: const Text('Compartir'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          
        ],
      ),
    );
  }
}
