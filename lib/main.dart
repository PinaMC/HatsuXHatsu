//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/bienvenida.dart';
import 'package:logger/logger.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/my_home_page.dart';
import 'pages/bienvenida.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("Logger is working! (main dart)"); // Se supone que sale al inicio

    return MaterialApp(
      title: 'Hatsu x Hatsu',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme,),
        useMaterial3: true, //es como un estilo visual nuevo de google
      ),
      home: const BienvenidaScreen(),
    );  
  }
}