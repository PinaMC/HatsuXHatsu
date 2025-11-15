//ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/favoritos_provider.dart';

class MaterializacionScreen extends StatelessWidget {
  const MaterializacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Materialización'),
        backgroundColor: colorScheme.tertiary,
        foregroundColor: colorScheme.onTertiary,
        elevation: 2,
        actions: [
          Consumer<FavoritesProvider>(
            builder: (context, favProvider, _) {
              final isFav = favProvider.isFavorite('materializacion');
              return IconButton(
                icon: Icon(
                  isFav ? Icons.star : Icons.star_border,
                  color: isFav ? Colors.amber : colorScheme.onPrimary,
                ),
                iconSize: 28,
                onPressed: () {
                  favProvider.toggleFavorite('materializacion');
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
            _buildHeader(context, 'Materialización',
                colorScheme.tertiaryContainer),

            const SizedBox(height: 20),

            _buildInfoCard(
              context,
              title: '¿Qué es la Materialización?',
              content:
                  'Los Materializadores (具現化系, Gugenkakei) pueden crear objetos físicos reales a partir de su aura. '
                  'A diferencia de la Transmutación, estos objetos son tangibles y pueden ser vistos y tocados por personas sin Nen. '
                  'El proceso requiere una comprensión profunda del objeto que se desea crear.',
              color: colorScheme.tertiaryContainer,
            ),

            const SizedBox(height: 16),

            _buildSectionTitle(context, 'Características'),
            const SizedBox(height: 12),

            _buildFeatureItem(
              context,
              title: 'Creación de objetos reales',
              description:
                  'Los objetos creados son completamente físicos y funcionales, no ilusiones.',
            ),
            _buildFeatureItem(
              context,
              title: 'Alta complejidad',
              description:
                  'Requiere estudio intensivo y comprensión total del objeto a materializar.',
            ),
            _buildFeatureItem(
              context,
              title: 'Habilidades especiales',
              description:
                  'Los objetos pueden tener propiedades únicas y condiciones especiales programadas.',
            ),

            const SizedBox(height: 24),

            _buildInfoCard(
              context,
              title: 'Personalidad típica',
              content:
                  'Los Materializadores son meticulosos, perfeccionistas y obsesivos con los detalles. '
                  'Tienden a ser introvertidos y pasan mucho tiempo estudiando y analizando. '
                  'Son pacientes y dedicados, dispuestos a invertir años en perfeccionar una sola habilidad.',
              color: colorScheme.secondaryContainer,
            ),

            const SizedBox(height: 16),

            _buildSectionTitle(context, 'Proceso de materialización'),
            const SizedBox(height: 12),

            _buildProcessStep(
              context,
              number: '1',
              title: 'Imagen mental',
              description: 'Visualizar perfectamente el objeto durante horas.',
            ),
            _buildProcessStep(
              context,
              number: '2',
              title: 'Estudio físico',
              description: 'Tocar, sostener y examinar el objeto real repetidamente.',
            ),
            _buildProcessStep(
              context,
              number: '3',
              title: 'Descripción detallada',
              description: 'Escribir características específicas y propiedades del objeto.',
            ),
            _buildProcessStep(
              context,
              number: '4',
              title: 'Meditación profunda',
              description: 'Alcanzar un estado donde el objeto sea parte de ti.',
            ),

            const SizedBox(height: 24),

            _buildSectionTitle(context, 'Usuarios destacados'),
            const SizedBox(height: 12),

            _buildCharacterCard(
              context,
              name: 'Kurapika',
              description:
                  'Materializa cadenas con propiedades especiales. Cada cadena tiene una función única.',
              ability: 'Chain Jail (solo efectiva contra la Brigada Fantasma)',
            ),
            _buildCharacterCard(
              context,
              name: 'Shizuku Murasaki',
              description:
                  'Crea una aspiradora que puede succionar cualquier cosa excepto seres vivos.',
              ability: 'Blinky (Deme-chan)',
            ),
            _buildCharacterCard(
              context,
              name: 'Kortopi',
              description:
                  'Capaz de crear copias perfectas de objetos, incluyendo edificios enteros.',
              ability: 'Gallery Fake',
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
                      'Objetos permanentes',
                      'Habilidades únicas',
                      'Visible para no usuarios',
                      'Gran utilidad estratégica',
                    ],
                    color: Colors.green.shade100,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildProConCard(
                    context,
                    title: 'Desventajas',
                    items: [
                      'Proceso muy largo',
                      'Requiere dedicación extrema',
                      'Consume mucha aura',
                      'Difícil de dominar',
                    ],
                    color: Colors.red.shade100,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            _buildInfoCard(
              context,
              title: 'Dato importante',
              content:
                  'La complejidad del objeto determina el tiempo de entrenamiento. '
                  'Un objeto simple puede tomar meses, mientras que algo complejo con múltiples '
                  'funciones puede requerir años de práctica y estudio intensivo.',
              color: colorScheme.primaryContainer,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String title, Color bgColor) {
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
            child: Icon(Icons.construction, size: 40, color: Theme.of(context).colorScheme.tertiary),
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
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
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
      {required String title, required String description}) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.tertiaryContainer.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
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
    );
  }

  Widget _buildProcessStep(BuildContext context,
      {required String number, required String title, required String description}) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: colorScheme.tertiaryContainer,
              shape: BoxShape.circle,
              border: Border.all(
                color: colorScheme.tertiary,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onTertiaryContainer,
                ),
              ),
            ),
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
        color: colorScheme.surfaceContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
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
              color: colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Habilidad: $ability',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: colorScheme.onTertiaryContainer,
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
      required Color color}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          //los 3 puntos sirven para expandir la lista
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