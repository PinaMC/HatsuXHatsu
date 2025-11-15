//ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/favoritos_provider.dart';


class ManipulacionScreen extends StatelessWidget {
  const ManipulacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Manipulación'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 2,
        actions: [
          Consumer<FavoritesProvider>(
            builder: (context, favProvider, _) {
              final isFav = favProvider.isFavorite('manipulacion');
              return IconButton(
                icon: Icon(
                  isFav ? Icons.star : Icons.star_border,
                  color: isFav ? Colors.amber : colorScheme.onPrimary,
                ),
                iconSize: 28,
                onPressed: () {
                  favProvider.toggleFavorite('manipulacion');
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
            _buildHeader(context, 'Manipulación',
                colorScheme.primaryContainer),

            const SizedBox(height: 20),

            _buildInfoCard(
              context,
              title: '¿Qué es la Manipulación?',
              content:
                  'Los Manipuladores (操作系, Sōsakei) pueden controlar objetos animados e inanimados, '
                  'e incluso otros seres vivos. Su poder radica en el control preciso y las condiciones '
                  'que establecen. Cuantas más restricciones y condiciones impongan, más poderosa será su manipulación.',
              color: colorScheme.primaryContainer,
            ),

            const SizedBox(height: 16),

            _buildSectionTitle(context, 'Características'),
            const SizedBox(height: 12),

            _buildFeatureItem(
              context,
              title: 'Control de objetivos',
              description:
                  'Pueden manipular personas, animales u objetos según las condiciones establecidas.',
            ),
            _buildFeatureItem(
              context,
              title: 'Sistema de condiciones',
              description:
                  'El poder aumenta proporcionalmente a las restricciones y reglas que se auto-imponen.',
            ),
            _buildFeatureItem(
              context,
              title: 'Manipulación indirecta',
              description:
                  'No necesitan contacto constante una vez establecido el control inicial.',
            ),

            const SizedBox(height: 24),

            _buildInfoCard(
              context,
              title: 'Personalidad típica',
              content:
                  'Los Manipuladores son lógicos, argumentativos y racionales. '
                  'Tienden a avanzar a su propio ritmo y no les gusta que otros interfieran. '
                  'Son estratégicos, calculadores y disfrutan tener el control de las situaciones. '
                  'A menudo son perfeccionistas con sus planes.',
              color: colorScheme.secondaryContainer,
            ),

            const SizedBox(height: 16),

            _buildSectionTitle(context, 'Métodos de manipulación'),
            const SizedBox(height: 12),

            _buildMethodCard(
              context,
              title: 'Objetos físicos',
              description:
                  'Insertar agujas, antenas u otros objetos en el objetivo para controlarlo.',
              requirement: 'Requiere contacto físico inicial',
            ),
            _buildMethodCard(
              context,
              title: 'Marcas o símbolos',
              description:
                  'Colocar marcas especiales que permiten rastrear o controlar al objetivo.',
              requirement: 'El objetivo debe cumplir ciertas condiciones',
            ),
            _buildMethodCard(
              context,
              title: 'Criaturas intermediarias',
              description:
                  'Usar animales o seres creados como extensiones para manipular indirectamente.',
              requirement: 'Control limitado por la distancia',
            ),

            const SizedBox(height: 24),

            _buildSectionTitle(context, 'Usuarios destacados'),
            const SizedBox(height: 12),

            _buildCharacterCard(
              context,
              name: 'Illumi Zoldyck',
              description:
                  'Manipula personas insertando agujas especiales en sus cuerpos, controlándolos completamente.',
              ability: 'Needle People (Control total con agujas)',
            ),
            _buildCharacterCard(
              context,
              name: 'Shalnark',
              description:
                  'Usa antenas para controlar personas como si fueran marionetas a través de un móvil.',
              ability: 'Black Voice (Autopilot Mode)',
            ),
            _buildCharacterCard(
              context,
              name: 'Morel Mackernasey',
              description:
                  'Manipula humo para crear construcciones complejas y criaturas semi-autónomas.',
              ability: 'Deep Purple (Soldados de humo)',
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
                      'Control absoluto',
                      'Versatilidad estratégica',
                      'Poder escalable',
                      'Efectivo contra múltiples objetivos',
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
                      'Requiere preparación',
                      'Condiciones complejas',
                      'Vulnerable sin objetivos',
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
              title: 'Teoría de las restricciones',
              content:
                  'En la Manipulación, mientras más estrictas sean las condiciones y limitaciones '
                  'que el usuario se impone, mayor será el poder de control obtenido. '
                  'Por ejemplo, Kurapika limitó Chain Jail solo a la Brigada Fantasma, '
                  'haciendo esa habilidad extremadamente poderosa contra ellos específicamente.',
              color: colorScheme.tertiaryContainer,
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
            child: Icon(Icons.control_camera, size: 40, color: Theme.of(context).colorScheme.primary),
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
          color: colorScheme.primaryContainer.withValues(alpha: 0.3),
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

  Widget _buildMethodCard(BuildContext context,
      {required String title, required String description, required String requirement}) {
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
            title,
            style: TextStyle(
              fontSize: 17,
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
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Requisito: $requirement',
              style: TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: colorScheme.onSurfaceVariant,
              ),
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
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Habilidad: $ability',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: colorScheme.onPrimaryContainer,
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