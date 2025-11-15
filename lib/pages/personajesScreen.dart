// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:hatsuxhatsu/pages/personajeGon.dart';
import 'package:hatsuxhatsu/pages/personajeKillua.dart';
import 'package:hatsuxhatsu/pages/personajeLeorio.dart';
import 'package:hatsuxhatsu/pages/personajeKurapika.dart';
import '../Funcions/app_drawer.dart';

class PersonajesScreen extends StatelessWidget {
  const PersonajesScreen({super.key});

  final List<String> personajesImages = const [
    "assets/Personajes/Gon-Head.png",
    "assets/Personajes/Killua-Head.png",
    "assets/Personajes/Leorio-Head.png",
    "assets/Personajes/Kurapika-Head.png",
  ];

  static const List<String> titles = [
    "Gon Freecss",
    "Killua Zoldyck",
    "Leorio Paradinight",
    "Kurapika",
  ];

  List<Widget> get _personajePages => const [
    PersonajeGon(),
    PersonajeKillua(),
    PersonajeLeorio(),
    PersonajeKurapika(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primaryContainer,
      appBar: AppBar(
        title: const Text('Personajes de HxH'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      drawer: buildAppDrawer(context, current: 'personajes'),
      body: ListView.builder(
        itemCount: personajesImages.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => _personajePages[index],
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8),
              child: SizedBox(
                height: 120,
                child: Image.asset(
                  personajesImages[index],
                  width: double.infinity,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}