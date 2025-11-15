//ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/favoritos_provider.dart';

class LugarMapaHxH extends StatelessWidget {
  const LugarMapaHxH({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Mapa de HxH'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 2,
        actions: [
    Consumer<FavoritesProvider>(
      builder: (context, favProvider, _) {
        final isFav = favProvider.isFavorite('lugar_mapa');
        return IconButton(
          icon: Icon(
            isFav ? Icons.star : Icons.star_border,
            color: isFav ? Colors.amber : colorScheme.onPrimary,
          ),
          iconSize: 28,
          onPressed: () {
            favProvider.toggleFavorite('lugar_mapa');
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
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/Lugares/Mapa_HxH.jpg',
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Center(
              child: Text(
                'Mapa del Mundo de Hunter x Hunter',
                style: TextStyle(
                  fontSize: 28,
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 24),

            _buildInfoCard(
              context,
              title: 'Descripción',
              content:
                  'El mundo de Hunter x Hunter es vasto y diverso, compuesto por seis continentes conocidos rodeados por un océano masivo. Más allá de estos continentes conocidos, existe el Continente Oscuro (Dark Continent), una tierra misteriosa y peligrosa que pocos han explorado y sobrevivido.',
              color: colorScheme.primaryContainer,
            ),

            const SizedBox(height: 16),

            Text(
              'Continentes Principales',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),

            const SizedBox(height: 12),

            _buildFeatureItem(
              context,
              title: 'Japón',
              value: 'Continente donde se encuentra la Isla Ballena',
              icon: Icons.place,
            ),

            _buildFeatureItem(
              context,
              title: 'República de Padokea',
              value: 'Hogar de la familia Zoldyck',
              icon: Icons.place,
            ),

            _buildFeatureItem(
              context,
              title: 'Yorknew City',
              value: 'Una de las ciudades más grandes del mundo',
              icon: Icons.place,
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Regresar'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
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
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context,
      {required String title, required String value, required IconData icon}) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainer.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 20, color: colorScheme.primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
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