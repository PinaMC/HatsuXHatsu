//ignore_for_file: file_names
//ignore for_file: unused_imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/favoritos_provider.dart';

class EmisionScreen extends StatelessWidget {
  const EmisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Emisión'),
        backgroundColor: colorScheme.error,
        foregroundColor: colorScheme.onError,
        elevation: 2,
        actions: [
          Consumer<FavoritesProvider>(
            builder: (context, favProvider, _) {
              final isFav = favProvider.isFavorite('Emision');
              return IconButton(
                icon: Icon(
                  isFav ? Icons.star : Icons.star_border,
                  color: isFav ? Colors.amber : colorScheme.onPrimary,
                ),
                iconSize: 28,
                onPressed: () {
                  favProvider.toggleFavorite('Emision');
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
            _buildHeader(context, 'Emisión', colorScheme.errorContainer),

            const SizedBox(height: 20),

            _buildInfoCard(
              context,
              title: '¿Qué es la Emisión?',
              content:
                  'Los Emisores (放出系, Hōshutsukei) pueden separar su aura de su cuerpo y controlarla a distancia. '
                  'A diferencia de otros tipos, mantienen el poder de su aura incluso cuando está lejos de ellos. '
                  'Son especialistas en ataques a larga distancia y proyectiles de aura.',
              color: colorScheme.errorContainer,
            ),

            const SizedBox(height: 16),

            _buildSectionTitle(context, 'Características'),
            const SizedBox(height: 12),

            _buildFeatureItem(
              context,
              title: 'Control a distancia',
              description:
                  'Pueden mantener el control de su aura incluso cuando está separada de su cuerpo.',
            ),
            _buildFeatureItem(
              context,
              title: 'Ataques de largo alcance',
              description:
                  'Excelentes para combate a distancia, mantienen el poder de impacto.',
            ),
            _buildFeatureItem(
              context,
              title: 'Versatilidad táctica',
              description:
                  'Pueden combinar Emisión con Transmutación o Manipulación para efectos especiales.',
            ),

            const SizedBox(height: 24),

            _buildInfoCard(
              context,
              title: 'Personalidad típica',
              content:
                  'Los Emisores son impacientes, de temperamento explosivo y acción rápida. '
                  'No les gusta perder tiempo en planificación elaborada y prefieren la acción directa. '
                  'Tienden a ser honestos, directos y pueden ser algo impulsivos en sus decisiones.',
              color: colorScheme.secondaryContainer,
            ),

            const SizedBox(height: 16),

            _buildSectionTitle(context, 'Tipos de técnicas de Emisión'),
            const SizedBox(height: 12),

            _buildTechniqueCard(
              context,
              title: 'Proyectiles de aura',
              description:
                  'Disparar bolas o ráfagas de aura concentrada hacia objetivos.',
              example: 'Razor lanza esferas de aura destructivas',
            ),
            _buildTechniqueCard(
              context,
              title: 'Teletransportación',
              description:
                  'Algunos emisores avanzados pueden usar portales o moverse instantáneamente.',
              example: 'Knov crea dimensiones de bolsillo',
            ),
            _buildTechniqueCard(
              context,
              title: 'Aura separada',
              description:
                  'Mantener parte del aura operando de forma autónoma lejos del cuerpo.',
              example: 'APR de Palm funciona independientemente',
            ),

            const SizedBox(height: 24),

            _buildSectionTitle(context, 'Usuarios destacados'),
            const SizedBox(height: 12),

            _buildCharacterCard(
              context,
              name: 'Leorio Paradinight',
              description:
                  'Puede emitir su aura a través de objetos para golpear a distancia.',
              ability: 'Remote Punch (Puñetazo Remoto)',
            ),
            _buildCharacterCard(
              context,
              name: 'Razor',
              description:
                  'Crea proyectiles de aura extremadamente poderosos en forma de esferas.',
              ability: '14 Devils (Emisión + Materialización)',
            ),
            _buildCharacterCard(
              context,
              name: 'Franklin Bordeau',
              description:
                  'Dispara ráfagas de aura desde sus dedos como si fueran balas de ametralladora.',
              ability: 'Double Machine Gun',
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
                      'Excelente rango',
                      'No requiere contacto',
                      'Poder sostenido a distancia',
                      'Difícil de contraatacar',
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
                      'Consume mucha aura',
                      'Vulnerable en corto alcance',
                      'Requiere concentración',
                      'Menor poder que Intensificación',
                    ],
                    color: Colors.red.shade100,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            _buildInfoCard(
              context,
              title: 'Compatibilidad con otras categorías',
              content:
                  'Los Emisores pueden aprender Intensificación (80%) y Transmutación (60%) con relativa facilidad. '
                  'Muchos combinan Emisión con estas categorías para crear técnicas híbridas más poderosas. '
                  'La combinación con Manipulación (60%) también es común para controlar proyectiles.',
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
            child: Icon(Icons.sports_baseball, size: 40, color: Theme.of(context).colorScheme.error),
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
          color: colorScheme.errorContainer.withValues(alpha: 0.3),
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

  Widget _buildTechniqueCard(BuildContext context,
      {required String title, required String description, required String example}) {
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
              color: colorScheme.errorContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Ejemplo: $example',
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
              color: colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Habilidad: $ability',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: colorScheme.onErrorContainer,
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