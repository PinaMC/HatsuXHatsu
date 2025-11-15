//ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:hatsuxhatsu/pages/lugarYorknewCity.dart';
import '../Funcions/app_drawer.dart';


//pantalla de la lista de lugares de HxH
class LugaresScreen extends StatelessWidget {
  const LugaresScreen({super.key});

  //lista de imagenes y titulos de los lugares

  final List<String> lugaresImages = const [
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

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primaryContainer, //  Fondo del scaffold
      appBar: AppBar(
        title: const Text('Lugares de HxH'),
        backgroundColor: colorScheme.primary, //  Color primario del tema
        foregroundColor: colorScheme.onPrimary, //  Color sobre primario
      ),
      //barra lateral de navegacion
      drawer: buildAppDrawer(context, current: 'lugares'),
      //muestra el contenido en una lista de Cards con imagenes y titulos
      body: ListView.builder(
        itemCount: lugaresImages.length,
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
                  width: 200,
                  height: 150,
                  child: Image.asset(
                    lugaresImages[index],
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