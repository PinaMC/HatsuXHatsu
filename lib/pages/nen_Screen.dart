// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import '../Funcions/app_drawer.dart';
import 'tiposNen/Intensificacion.dart';
import 'tiposNen/Transmutador.dart';
import 'tiposNen/Materializador.dart';
import 'tiposNen/Emisor.dart';
import 'tiposNen/Manipulador.dart';
import 'tiposNen/Especialista.dart';

class NenScreen extends StatelessWidget {
  const NenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Nen y sus clases'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 2,
      ),
      drawer: buildAppDrawer(context, current: 'Nen'),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Imagen inicial referencial
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  'assets/nen_assets/clases_Nen3.png',
                  width: 260,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// Título principal
            Text(
              '¿Qué es el Nen?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),

            const SizedBox(height: 12),

            /// Texto introductorio
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainer.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colorScheme.outline.withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                'El Nen (念ネン, Nen) es una de las formas de definir la energía producida por todos los seres vivos, '
                'necesaria para la supervivencia. El Nen es la técnica que permite a un usuario viviente usar y '
                'manipular su propia aura vital. Esta técnica es la base de muchos desarrollos sobrenaturales en '
                'el mundo de Hunter x Hunter.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),

            const SizedBox(height: 28),

            /// Sección: Los Cuatro Ejercicios Principales
            _buildSectionTitle(context, 'Los Cuatro Ejercicios Principales'),
            const SizedBox(height: 12),

            _buildPrincipleCard(
              context,
              title: 'Ten (纏テン, Ten)',
              description:
                  'Mantiene el aura en el cuerpo, evitando que se disperse. Es la base defensiva del Nen.',
              icon: Icons.shield_outlined,
              color: colorScheme.primaryContainer,
            ),
            const SizedBox(height: 8),

            _buildPrincipleCard(
              context,
              title: 'Zetsu (絶ゼツ, Zetsu)',
              description:
                  'Detiene el flujo de aura, haciéndote indetectable. Útil para ocultarse de otros usuarios de Nen.',
              icon: Icons.visibility_off_outlined,
              color: colorScheme.secondaryContainer,
            ),
            const SizedBox(height: 8),

            _buildPrincipleCard(
              context,
              title: 'Ren (錬レン, Ren)',
              description:
                  'Aumenta la cantidad de aura producida. Es fundamental para ataques poderosos.',
              icon: Icons.bolt_outlined,
              color: colorScheme.tertiaryContainer,
            ),
            const SizedBox(height: 8),

            _buildPrincipleCard(
              context,
              title: 'Hatsu (発ハツ, Hatsu)',
              description:
                  'El hatsu es la expresión personal del Nen. Cada usuario desarrolla habilidades únicas basadas en su tipo de aura.',
              icon: Icons.auto_awesome_outlined,
              color: colorScheme.errorContainer,
            ),

            const SizedBox(height: 32),

            /// Segunda imagen
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  'assets/nen_assets/clases_Nen2.png',
                  width: 260,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// Texto complementario
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surfaceVariant.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colorScheme.outline.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Tipos de Aura',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Todo usuario de Nen pertenece a una de las seis categorías principales. '
                    'La afinidad determina qué tipo de técnicas puede dominar con mayor facilidad y eficiencia. '
                    'Tu tipo se puede descubrir mediante la Prueba de la Adivinación del Agua.',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// Subtítulo de la lista
            _buildSectionTitle(context, 'Las Seis Categorías del Nen'),
            const SizedBox(height: 16),

            /// NUEVA: Lista de tipos de Nen (reemplaza el Grid)
            _buildNenTypeList(context),
          ],
        ),
      ),
    );
  }

  /// Helper: Título de sección
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  /// Helper: Card de principio del Nen
  Widget _buildPrincipleCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 24),
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
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.3,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// NUEVA: Lista de tipos de Nen (reemplaza el Grid)
  Widget _buildNenTypeList(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final nenTypes = [
      {
        'name': 'Intensificación',
        'page': const IntensificacionScreen(),
        'description':
            'Potencian las propiedades naturales de un objeto o el cuerpo. Son luchadores directos y poderosos.',
        'icon': Icons.fitness_center,
        'color': colorScheme.primaryContainer,
        'ejemplos': 'Gon, Uvogin, Phinks',
      },
      {
        'name': 'Transmutación',
        'page': const TransmutacionScreen(),
        'description':
            'Cambian las propiedades del aura imitando otras sustancias. Son caprichosos e impredecibles.',
        'icon': Icons.water_drop,
        'color': colorScheme.secondaryContainer,
        'ejemplos': 'Killua, Hisoka, Machi',
      },
      {
        'name': 'Materialización',
        'page': const MaterializacionScreen(),
        'description':
            'Crean objetos físicos a partir de su aura. Son meticulosos y perfeccionistas.',
        'icon': Icons.construction,
        'color': colorScheme.tertiaryContainer,
        'ejemplos': 'Kurapika, Shizuku, Kortopi',
      },
      {
        'name': 'Emisión',
        'page': const EmisionScreen(),
        'description':
            'Separan su aura del cuerpo y la controlan a distancia. Son impacientes y de mentalidad rápida.',
        'icon': Icons.sports_baseball,
        'color': colorScheme.errorContainer,
        'ejemplos': 'Leorio, Razor, Franklin',
      },
      {
        'name': 'Manipulación',
        'page': const ManipulacionScreen(),
        'description':
            'Controlan objetos o seres vivos con su aura. Son lógicos y calculadores.',
        'icon': Icons.control_camera,
        'color': colorScheme.primaryContainer.withValues(alpha: 0.7),
        'ejemplos': 'Illumi, Shalnark, Morel',
      },
      {
        'name': 'Especialización',
        'page': const EspecializacionScreen(),
        'description':
            'Habilidades únicas que no encajan en otras categorías. Son independientes e individualistas.',
        'icon': Icons.auto_awesome,
        'color': colorScheme.secondaryContainer.withValues(alpha: 0.7),
        'ejemplos': 'Chrollo, Kurapika (ojos escarlata), Neon',
      },
    ];

    return Column(
      children: nenTypes.map((type) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => type['page'] as Widget),
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      (type['color'] as Color).withValues(alpha: 0.3),
                      colorScheme.surface,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Ícono
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: type['color'] as Color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        type['icon'] as IconData,
                        size: 28,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Contenido
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nombre
                          Text(
                            type['name'] as String,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 6),

                          // Descripción
                          Text(
                            type['description'] as String,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.4,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Ejemplos
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceVariant.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'Ejemplos: ${type['ejemplos']}',
                              style: TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Flecha
                    Icon(
                      Icons.chevron_right,
                      color: colorScheme.onSurfaceVariant,
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}