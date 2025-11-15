//ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:hatsuxhatsu/pages/lugaresScreen/mapaHxHScreen.dart';
import 'package:hatsuxhatsu/pages/lugaresScreen/YorknewCity.dart';
import 'package:hatsuxhatsu/pages/lugaresScreen/greedisland.dart';
import '../Funcions/app_drawer.dart';

class LugaresScreen extends StatelessWidget {
  const LugaresScreen({super.key});

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

  List<Widget> get _lugarPages => const [
    LugarMapaHxH(),
    LugarYorknewCity(),
    LugarGreedIsland(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primaryContainer,

      appBar: AppBar(
        title: const Text('Lugares de HxH'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      drawer: buildAppDrawer(context, current: 'lugares'),
      body: ListView.builder(
        itemCount: lugaresImages.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => _lugarPages[index],
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Image.asset(
                        lugaresImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      titles[index],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}