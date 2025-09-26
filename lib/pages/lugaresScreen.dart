import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/lugarYorknewCity.dart';
/*
import 'my_home_page.dart';
import 'personajesScreen.dart';
import 'about.dart';
*/
//import 'package:google_fonts/google_fonts.dart';
import '../Funcions/app_drawer.dart';

//pantalla de la lista de lugares de HxH
class LugaresScreen extends StatelessWidget {
  const LugaresScreen({super.key});

  //lista de imagenes y titulos de los lugares

  final List<String> pixelArt = const [
    "assets/Lugares/Mapa_HxH.jpg",
    "assets/Lugares/yorknew.webp",
    "assets/Lugares/Greed_Island.webp",
  ];
  static const List<String> titles = [
    "Mapa de HxH",
    "Yorknew City",
    "Greed Island",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lugares de HxH'),
      ),
      drawer: buildAppDrawer(context, current: 'lugares'),
      //muestra el contenido en una lista de Cards con imagenes y titulos
      body: ListView.builder(
        itemCount: pixelArt.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LugarYorknewCity()),
              );
            },
          child: Card(
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
                  titles[index],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ));
        },
      ),
    );
  }
}