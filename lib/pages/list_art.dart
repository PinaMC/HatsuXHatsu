import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'list_creation.dart';
import 'about.dart';
import 'package:google_fonts/google_fonts.dart';

//pantalla de la lista de lugares de HxH
class ListArtScreen extends StatelessWidget {
  const ListArtScreen({super.key});

  //lista de imagenes y titulos de los lugares

  final List<String> pixelArt = const [
    "assets/Pixel-Art-Pizza-2.webp",
    "assets/Pixel-Art-Hot-Pepper-2-1.webp",
    "assets/Pixel-Art-Watermelon-3.webp",
  ];
  static const List<String> titles = [
    "Pizza",
    "Ají",
    "Sandía",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lugares de HxH'),
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
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: '2022479045')),
                  //devolverse a la pantalla de inicio
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.landscape),
              title: const Text('Lista de lugares de HxH'),
              onTap: () {
                Navigator.pop(context);
              },
              //ya estamos en esta pantalla
              //asi que no hacemos nada
              selected: true,
            ),
            ListTile(
              leading: const Icon(Icons.people_sharp),
              title: const Text('Personajes'), //esto llevara a la pantalla de personajes de HxH
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ListCreationScreen()),
                  //lelva a la pantalla de la lista de personajes de HxH
                );
              },
            ),
            ListTile( //esto es para mostrar info de la app
              leading: const Icon(Icons.info),
              title: const Text('Acerca de'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()), 
                  //lleva a la pantalla de info de la app
                );
              },
            ),
          ],
        ),
      ),
      //muestra el contenido en una lista de Cards con imagenes y titulos
      body: ListView.builder(
        itemCount: pixelArt.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.asset(
                    pixelArt[index],
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  pixelArt[index],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }
}