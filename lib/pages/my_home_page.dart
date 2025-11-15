import 'package:flutter/material.dart';
import 'package:hatsuxhatsu/Funcions/app_drawer.dart';
import 'package:logger/logger.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("Logger is working! in build method of _MyHomePageState");

    // Obtener el tema actual
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primaryContainer, //  Fondo del scaffold
      appBar: AppBar(
        backgroundColor: colorScheme.primary, //  Color primario del tema
        foregroundColor: colorScheme.onPrimary, //  Color sobre primario
        title: Text(widget.title),
      ),
      drawer: buildAppDrawer(context, current: 'home'),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Últimas noticias:",
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface, //  Usa color del tema
            ),
          ),
          const SizedBox(height: 10),
          Expanded( //  Cambiado de SizedBox a Expanded
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                _buildNewsCard(
                  context,
                  imagePath: "assets/Otros/Noticias1.webp",
                  title: "Se confirma nuevo estreno en plataformas de streaming.",
                  date: "1 de Septiembre de 2025",
                ),
                _buildNewsCard(
                  context,
                  imagePath: "assets/Otros/Noticias2.webp",
                  title: "Togashi vuelve a dar señales de vida luego de 9 meses.",
                  date: "19 de Agosto de 2025",
                ),
                _buildNewsCard(
                  context,
                  imagePath: "assets/Otros/Noticias3.webp",
                  title: "Togashi cambia la clasificación de Gin.",
                  date: "20 de Octubre de 2024",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Método helper para crear las cards de noticias
  Widget _buildNewsCard(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String date,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: const EdgeInsets.all(5),
      elevation: 2,
      color: colorScheme.surfaceContainerHighest, //  Color del tema
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: colorScheme.errorContainer,
                    child: Icon(
                      Icons.error_outline,
                      color: colorScheme.onErrorContainer,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded( //  Para que el texto no se desborde
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface, //  Color del tema
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: colorScheme.onSurfaceVariant, //  Color del tema
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant, //  Color del tema
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}