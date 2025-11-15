import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Funcions/app_drawer.dart';
import '../providers/favoritos_provider.dart';
import '../models/nen_category.dart';
//import tipos nen
import 'tiposNen/Intensificacion.dart';
import 'tiposNen/Transmutador.dart';
import 'tiposNen/Materializador.dart';
import 'tiposNen/Emisor.dart';
import 'tiposNen/Manipulador.dart';
import 'tiposNen/Especialista.dart';
//import personajes
import 'personajeGon.dart';
import 'personajeLeorio.dart';
import 'personajeKurapika.dart';
import 'personajeKillua.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Favoritos de HxH'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      drawer: buildAppDrawer(context, current: 'Favoritos'),
      body: Consumer<FavoritesProvider>(
        builder: (context, favProvider, child) {
          if (favProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (favProvider.favorites.isEmpty) {
            return _buildEmptyState(context, colorScheme);
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildHeader(context, colorScheme, favProvider.favoritesCount),
              const SizedBox(height: 16),
              ...favProvider.favorites.map((favoriteId) {
                final item = FavoriteItem.getById(favoriteId);
                if (item == null) return const SizedBox.shrink();
                
                return _buildFavoriteCard(
                  context,
                  colorScheme,
                  item,
                  favProvider,
                );
              }).toList(),
              const SizedBox(height: 16),
              if (favProvider.favorites.isNotEmpty)
                _buildClearButton(context, colorScheme, favProvider),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ColorScheme colorScheme, int count) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: colorScheme.primary,
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tus Favoritos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$count ${count == 1 ? 'elemento guardado' : 'elementos guardados'}',
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

  Widget _buildFavoriteCard(
    BuildContext context,
    ColorScheme colorScheme,
    FavoriteItem item,
    FavoritesProvider favProvider,
  ) {
    final pageMap = {
      'intensificacion': const IntensificacionScreen(),
      'transmutacion': const TransmutacionScreen(),
      'materializacion': const MaterializacionScreen(),
      'emision': const EmisionScreen(),
      'manipulacion': const ManipulacionScreen(),
      'especializacion': const EspecializacionScreen(),
      'personaje_gon': const PersonajeGon(),
      'personaje_leorio': const PersonajeLeorio(),
      'personaje_kurapika': const PersonajeKurapika(),
      'personaje_killua': const PersonajeKillua(),
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: () {
            final page = pageMap[item.id];
            if (page != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => page),
              );
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    item.icon,
                    size: 28,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              item.category == 'nen' ? 'Nen' : 'Personaje',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSecondaryContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.description,
                        style: TextStyle(
                          fontSize: 13,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.star),
                  color: Colors.amber,
                  iconSize: 28,
                  onPressed: () {
                    favProvider.toggleFavorite(item.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.name} eliminado de favoritos'),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, ColorScheme colorScheme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star_border,
              size: 80,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 24),
            Text(
              'No tienes favoritos aún',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Presiona la estrella en cualquier pantalla para marcarla como favorita',
              style: TextStyle(
                fontSize: 16,
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClearButton(
    BuildContext context,
    ColorScheme colorScheme,
    FavoritesProvider favProvider,
  ) {
    return OutlinedButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Limpiar favoritos'),
            content: const Text(
              '¿Estás seguro de que quieres eliminar todos tus favoritos?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  favProvider.clearAllFavorites();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Todos los favoritos han sido eliminados'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Eliminar'),
              ),
            ],
          ),
        );
      },
      icon: const Icon(Icons.delete_outline),
      label: const Text('Limpiar todos los favoritos'),
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.error,
        side: BorderSide(color: colorScheme.error),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}