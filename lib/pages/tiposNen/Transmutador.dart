//ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/favoritos_provider.dart';

class TransmutacionScreen extends StatelessWidget {
  const TransmutacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Transmutación'),
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
        elevation: 2,
        actions: [
          Consumer<FavoritesProvider>(
            builder: (context, favProvider, _) {
              final isFav = favProvider.isFavorite('transmutacion');
              return IconButton(
                icon: Icon(
                  isFav ? Icons.star : Icons.star_border,
                  color: isFav ? Colors.amber : colorScheme.onPrimary,
                ),
                iconSize: 28,
                onPressed: () {
                  favProvider.toggleFavorite('transmutacion');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isFav 
                            ? 'Eliminado de favoritos' 
                            : 'Agregado a favoritos',
                      ),
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, Icons.water_drop, 'Transmutación',
                colorScheme.secondaryContainer),

            const SizedBox(height: 20),

            _buildInfoCard(
              context,
              title: '¿Qué es la Transmutación?',
              content:
                  'Los Transmutadores (変化系, Henkakei) pueden cambiar las propiedades de su aura para imitar las propiedades de otras sustancias. '
                  'Pueden replicar electricidad, elasticidad, veneno, o cualquier característica física sin crear objetos reales.',
              color: colorScheme.secondaryContainer,
            ),

            const SizedBox(height: 16),

            _buildSectionTitle(context, 'Características'),
            const SizedBox(height: 12),

            _buildFeatureItem(
              context,
              icon: Icons.transform,
              title: 'Versatilidad extrema',
              description:
                  'Pueden imitar casi cualquier sustancia: electricidad, goma, fuego, etc.',
            ),
            _buildFeatureItem(
              context,
              icon: Icons.flash_on,
              title: 'Rapidez de cambio',
              description:
                  'Pueden alternar entre diferentes propiedades rápidamente en combate.',
            ),
            _buildFeatureItem(
              context,
              icon: Icons.psychology,
              title: 'Creatividad ilimitada',
              description:
                  'Solo limitados por su imaginación y capacidad de entrenamiento.',
            ),

            const SizedBox(height: 24),

            _buildInfoCard(
              context,
              title: '🧠 Personalidad típica',
              content:
                  'Los Transmutadores son caprichosos, mentirosos y poco confiables. '
                  'Tienden a ser impredecibles, ingeniosos y disfrutan engañar a sus oponentes. '
                  'Son maestros del engaño y la manipulación psicológica.',
              color: colorScheme.tertiaryContainer,
            ),

            const SizedBox(height: 16),

            _buildSectionTitle(context, 'Usuarios destacados'),
            const SizedBox(height: 12),

            _buildCharacterCard(
              context,
              name: 'Killua Zoldyck',
              description:
                  'Transforma su aura en electricidad después de un intenso entrenamiento con tortura eléctrica.',
              ability: 'Godspeed (Velocidad Divina)',
            ),
            _buildCharacterCard(
              context,
              name: 'Hisoka Morow',
              description:
                  'Crea una sustancia elástica y adhesiva que puede usar ofensiva y defensivamente.',
              ability: 'Bungee Gum (Goma Elástica)',
            ),
            _buildCharacterCard(
              context,
              name: 'Machi Komacine',
              description:
                  'Transmuta su aura en hilos extremadamente resistentes para coser y atrapar.',
              ability: 'Nen Thread (Hilos de Nen)',
            ),

            const SizedBox(height: 24),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildProConCard(
                    context,
                    title: 'Ventajas',
                    items: [
                      'Altamente versátiles',
                      'Impredecibles en combate',
                      'Adaptables a situaciones',
                      'Creatividad sin límites',
                    ],
                    color: Colors.green.shade100,
                    icon: Icons.thumb_up,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildProConCard(
                    context,
                    title: 'Desventajas',
                    items: [
                      'Requiere imaginación',
                      'Entrenamiento complejo',
                      'Menor poder bruto',
                      'Depende de creatividad',
                    ],
                    color: Colors.red.shade100,
                    icon: Icons.thumb_down,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Los mismos widgets helpers de IntensificacionScreen
  Widget _buildHeader(
      BuildContext context, IconData icon, String title, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 40, color: Theme.of(context).colorScheme.secondary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context,
      {required String title, required String content, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha:0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context,
      {required IconData icon,
      required String title,
      required String description}) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 20, color: colorScheme.secondary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterCard(BuildContext context,
      {required String name,
      required String description,
      required String ability}) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer.withValues(alpha:0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outline.withValues(alpha:0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person, color: colorScheme.secondary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '⚡ $ability',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSecondaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProConCard(BuildContext context,
      {required String title,
      required List<String> items,
      required Color color,
      required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha:0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}