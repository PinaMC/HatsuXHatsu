import 'package:flutter/material.dart';
import 'package:hatsuxhatsu/Funcions/app_drawer.dart';
import '/pages/noticias/noticia1.dart';
import '/pages/noticias/noticia2.dart';
import '/pages/noticias/noticia3.dart';
import '/pages/nen_Screen.dart';
import '/pages/personajesScreen.dart';
import '/pages/lugaresScreen.dart';
import '/pages/favoritos.dart';


import 'package:logger/logger.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final List<Map<String, dynamic>> noticias = [
    {
      'id': 'noticia1',
      'imagen': 'assets/Otros/Noticias1.webp',
      'titulo': 'Se confirma nuevo estreno en plataformas de streaming',
      'fecha': '1 de Septiembre de 2025',
      'categoria': 'Anime',
      'resumen': 'La adaptación animada de Hunter x Hunter llegará pronto a nuevas plataformas.',
      'page': const Noticia1Screen(),
    },
    {
      'id': 'noticia2',
      'imagen': 'assets/Otros/Noticias2.webp',
      'titulo': 'Togashi vuelve a dar señales de vida luego de 9 meses',
      'fecha': '19 de Agosto de 2025',
      'categoria': 'Manga',
      'resumen': 'El mangaka publicó actualizaciones sobre el progreso del manga en redes sociales.',
      'page': const Noticia2Screen(),
    },
    {
      'id': 'noticia3',
      'imagen': 'assets/Otros/Noticias3.webp',
      'titulo': 'Togashi cambia la clasificación de Ging',
      'fecha': '20 de Octubre de 2024',
      'categoria': 'Manga',
      'resumen': 'Nueva información revelada sobre el tipo de Nen de Ging Freecss.',
      'page': const Noticia3Screen(),
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("Logger is working! in build method of _MyHomePageState");

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        title: Text(widget.title),
        elevation: 2,
      ),
      drawer: buildAppDrawer(context, current: 'home'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeBanner(context, colorScheme),
            
            const SizedBox(height: 24),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.newspaper,
                    color: colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Últimas Noticias",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: noticias.length,
              itemBuilder: (context, index) {
                return _buildNewsCard(
                  context,
                  noticia: noticias[index],
                );
              },
            ),
            
            const SizedBox(height: 24),
            
            _buildQuickAccessSection(context, colorScheme),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeBanner(BuildContext context, ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary,
            colorScheme.primaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¡Bienvenido a Hatsu x Hatsu!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tu enciclopedia completa del mundo de Hunter x Hunter',
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onPrimary.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildNewsCard(BuildContext context, {required Map<String, dynamic> noticia}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => noticia['page'] as Widget,
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Stack(
                  children: [
                    Image.asset(
                      noticia['imagen'],
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 180,
                          color: colorScheme.errorContainer,
                          child: Icon(
                            Icons.broken_image,
                            color: colorScheme.onErrorContainer,
                            size: 48,
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          noticia['categoria'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      noticia['titulo'],
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      noticia['resumen'],
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          noticia['fecha'],
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward,
                          size: 20,
                          color: colorScheme.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAccessSection(BuildContext context, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Acceso Rápido',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          // Primera fila
          Row(
            children: [
              // Card Nen
              Expanded(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NenScreen()),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.flash_on, size: 40, color: colorScheme.onSurface),
                          const SizedBox(height: 8),
                          Text('Tipos de Nen', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: colorScheme.onSurface), textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Card Personajes
              Expanded(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PersonajesScreen()),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.people, size: 40, color: colorScheme.onSurface),
                          const SizedBox(height: 8),
                          Text('Personajes', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: colorScheme.onSurface), textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Segunda fila
          Row(
            children: [
              // Card Lugares
              Expanded(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LugaresScreen()),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.place, size: 40, color: colorScheme.onSurface),
                          const SizedBox(height: 8),
                          Text('Lugares', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: colorScheme.onSurface), textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Card Favoritos
              Expanded(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FavoritosScreen()),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.star, size: 40, color: colorScheme.onSurface),
                          const SizedBox(height: 8),
                          Text('Favoritos', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: colorScheme.onSurface), textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}