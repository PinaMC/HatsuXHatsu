//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Funcions/app_drawer.dart';
import 'package:logger/logger.dart';
import '../../pages/about.dart';
import 'lugaresScreen.dart';
import 'personajesScreen.dart';
import 'package:google_fonts/google_fonts.dart';


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
        backgroundColor: Colors.red[300],
        title: Text(widget.title),
      ),
      drawer: buildAppDrawer(context, current: 'home'),
      body: 
        Column(
          children: [
            SizedBox(height: 20),
            const Text("Últimas noticias:", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
            SizedBox(
            height: 500,
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Card(
                  margin: const EdgeInsets.all(10),
                  color: Colors.red[200],
                  child: 
                  Row(children: [
                    Image.asset("assets/Otros/Noticias1.webp", width: 100, height: 100,),
                    Column(
                      children: [
                        const Text("Se confirma nuevo estreno en \n plataformas de streaming.",),
                        SizedBox(height: 10,),
                        const Text("Fecha: 1 de Septiembre de 2025")
                      ],
                    )
                  ],)
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  color: Colors.red[200],
                  child: 
                  Row(children: [
                    Image.asset("assets/Otros/Noticias2.webp", width: 100, height: 100,),
                    Column(
                      children: [
                        const Text("Togashi vuelve a dar señales de\n vida luego de 9 meses.",),
                        SizedBox(height: 10,),
                        const Text("Fecha: 19 de Agosto de 2025")
                      ],
                    )
                  ],)
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  color: Colors.red[200],
                  child: 
                  Row(children: [
                    Image.asset("assets/Otros/Noticias3.webp", width: 100, height: 100,),
                    Column(
                      children: [
                        const Text("Togashi cambia la clasificación de\nGin.",),
                        SizedBox(height: 10,),
                        const Text("Fecha: 20 de Octubre de 2024")
                      ],
                    )
                  ],)
                ),
              ],
            )
            )
          ],
          
        )
      ,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          
        ],
      ),
    );
  }
}
