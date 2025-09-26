import 'package:flutter/material.dart';
/*import 'my_home_page.dart';
import 'lugaresScreen.dart';
import 'personajesScreen.dart';
import 'package:google_fonts/google_fonts.dart';
*/
import 'package:logger/logger.dart';
import '../Funcions/app_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("AboutScreen cargada"); // mensaje de about screen cargada

    return Scaffold(
    appBar: AppBar(
      title: const Text('Acerca de'),
    ),
    drawer: buildAppDrawer(context, current: 'about'), 
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'App del anime Hunter x Hunter',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Esta es una app prototipo que funciona como una wiki del anime HxH.\n'
            'Contacto: vicentefariaspina@gmail.com\n'
            'Institución: Universidad de Talca\n'
            'Desarrollado por: Vicente Farías Piña\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Regresar'),
          ),
        ],
      ),
    ),
  );

  }
}