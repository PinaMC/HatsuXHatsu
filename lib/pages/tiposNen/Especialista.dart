//ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/favoritos_provider.dart';

class EspecializacionScreen extends StatelessWidget {
  const EspecializacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Especialización'),
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
        elevation: 2,
        actions: [
          Consumer<FavoritesProvider>(
            builder: (context, favProvider, _) {
              final isFav = favProvider.isFavorite('especializacion');
              return IconButton(
                icon: Icon(
                  isFav ? Icons.star : Icons.star_border,
                  color: isFav ? Colors.amber : colorScheme.onPrimary,
                ),
                iconSize: 28,
                onPressed: () {
                  favProvider.toggleFavorite('especializacion');
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
            _buildHeader(context, 'Especialización',
                colorScheme.secondaryContainer),

            const SizedBox(height: 20),

            _buildInfoCard(
              context,
              title: '¿Qué es la Especialización?',
              content:
                  'La Especialización (特質系, Tokushitsukei) es la categoría más misteriosa y única del Nen. '
                  'Incluye habilidades que no encajan en ninguna de las otras cinco categorías. '
                  'Los Especialistas pueden desarrollar poderes completamente únicos e impredecibles.',
              color: colorScheme.secondaryContainer,
            ),

            const SizedBox(height: 16),

            _buildSectionTitle(context, 'Características'),
            const SizedBox(height: 12),

            _buildFeatureItem(
              context,
              title: 'Habilidades únicas',
              description:
                  'Cada Especialista tiene poderes completamente distintos e irrepetibles.',
            ),
            _buildFeatureItem(
              context,
              title: 'Impredecibilidad',
              description:
                  'No hay patrones claros, haciendo imposible anticipar sus capacidades.',
            ),
            _buildFeatureItem(
              context,
              title: 'Potencial ilimitado',
              description:
                  'No están limitados por las reglas convencionales de las otras categorías.',
            ),

            const SizedBox(height: 24),

            _buildInfoCard(
              context,
              title: 'Personalidad típica',
              content:
                  'Los Especialistas son individualistas e independientes. '
                  'Tienden a ser carismáticos pero también misteriosos. '
                  'No siguen las normas convencionales y prefieren forjar su propio camino. '
                  'Son difíciles de categorizar tanto en personalidad como en habilidades.',
              color: colorScheme.tertiaryContainer,
            ),

            const SizedBox(height: 16),

            _buildSectionTitle(context, 'Formas de obtener Especialización'),
            const SizedBox(height: 12),

            _buildPathCard(
              context,
              number: '1',
              title: 'Nacimiento',
              description:
                  'Nacer directamente como Especialista, el caso más raro de todos los tipos.',
            ),
            _buildPathCard(
              context,
              number: '2',
              title: 'Evolución desde Manipulación',
              description:
                  'Los Manipuladores pueden evolucionar a Especialización con entrenamiento extremo.',
            ),
            _buildPathCard(
              context,
              number: '3',
              title: 'Evolución desde Materialización',
              description:
                  'Los Materializadores también pueden desarrollar capacidades de Especialización.',
            ),
            _buildPathCard(
              context,
              number: '4',
              title: 'Condiciones especiales',
              description:
                  'Activarse bajo circunstancias específicas, como los ojos escarlata de Kurapika.',
            ),

            const SizedBox(height: 24),

            _buildSectionTitle(context, 'Usuarios destacados'),
            const SizedBox(height: 12),

            _buildCharacterCard(
              context,
              name: 'Chrollo Lucilfer',
              description:
                  'Puede robar las habilidades Nen de otros y usarlas como propias bajo ciertas condiciones.',
              ability: 'Skill Hunter (Ladrón de Habilidades)',
            ),
            _buildCharacterCard(
              context,
              name: 'Kurapika (Ojos Escarlata)',
              description:
                  'Se convierte en Especialista cuando activa sus ojos escarlata, ganando acceso al 100% de todas las categorías.',
              ability: 'Emperor Time (Tiempo del Emperador)',
            ),
            _buildCharacterCard(
              context,
              name: 'Neon Nostrade',
              description:
                  'Puede predecir el futuro de las personas escribiendo poemas proféticos automáticamente.',
              ability: 'Lovely Ghostwriter',
            ),
            _buildCharacterCard(
              context,
              name: 'Meruem',
              description:
                  'Rey de las Hormigas Quimera, puede consumir a otros usuarios de Nen y absorber sus habilidades.',
              ability: 'Aura Synthesis (Absorción de habilidades)',
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
                      'Habilidades únicas',
                      'Extremadamente versátiles',
                      'Potencial infinito',
                      'Difícil de contrarrestar',
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
                      'Difícil de entrenar',
                      'No hay guías establecidas',
                      'Extremadamente raro',
                      'Condiciones complejas',
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
                  'La Especialización es el único tipo que no puede ser aprendido por otros. '
                  'Mientras que un Potenciador puede aprender algo de Emisión o Transmutación, '
                  'un Potenciador NUNCA podrá usar Especialización. Solo los que nacen con ella '
                  'o evolucionan desde Manipulación/Materialización pueden acceder a este tipo.',
              color: colorScheme.errorContainer,
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
            child: Icon(Icons.auto_awesome, size: 40, color: Theme.of(context).colorScheme.secondary),
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
          color: colorScheme.secondaryContainer.withValues(alpha: 0.3),
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

  Widget _buildPathCard(BuildContext context,
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
              color: colorScheme.secondaryContainer,
              shape: BoxShape.circle,
              border: Border.all(
                color: colorScheme.secondary,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSecondaryContainer,
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
              color: colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Habilidad: $ability',
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