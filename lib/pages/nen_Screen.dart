import 'package:flutter/material.dart';
import '../Funcions/app_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
//pantalla para mostrar NEN y tipos de NEN
// ignore_for_file: file_names


class NenScreen extends StatelessWidget {
  const NenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tipos de NEN',
          style: GoogleFonts.lato(),
        ),
      ),
      drawer: buildAppDrawer(context, current: 'nen'),
      body: Center(
        child: Text(
          'Contenido sobre NEN y sus tipos irá aquí.',
          style: GoogleFonts.lato(fontSize: 18),
        ),
      ),
    );
  }
}