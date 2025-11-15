import 'package:flutter/material.dart';
import 'package:hatsuxhatsu/pages/my_home_page.dart';
import 'package:logger/logger.dart';
import '../Funcions/app_drawer.dart';
import 'package:hatsuxhatsu/pages/feedback.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("AboutScreen cargada"); // mensaje de about screen cargada
    
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primaryContainer, //  Fondo del scaffold
      appBar: AppBar(
        title: const Text('Acerca de'),
        backgroundColor: colorScheme.primary, //  Color primario del tema
        foregroundColor: colorScheme.onPrimary, //  Color sobre primario
        elevation: 2,
      ),
      drawer: buildAppDrawer(context, current: 'about'), 
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título principal
              Center(
                child: Text(
                  'Hatsu x Hatsu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Subtítulo
              Center(
                child: Text(
                  'App del anime Hunter x Hunter',
                  style: TextStyle(
                    fontSize: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Descripción
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Esta es una app prototipo que funciona como una wiki del anime HxH. '
                    'Aquí encontrarás información sobre personajes, lugares y el sistema de Nen.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Información del desarrollador
              _buildInfoRow(
                context,
                icon: Icons.person,
                label: 'Desarrollado por:',
                value: 'Vicente Farías Piña',
              ),
              const SizedBox(height: 12),

              _buildInfoRow(
                context,
                icon: Icons.email,
                label: 'Contacto:',
                value: 'vicentefariaspina@gmail.com',
              ),
              const SizedBox(height: 12),

              _buildInfoRow(
                context,
                icon: Icons.school,
                label: 'Institución:',
                value: 'Universidad de Talca',
              ),
              const SizedBox(height: 32),
              
              //boton para valorar la app
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FeedbackScreen()),
                    );
                  },
                  child: const Text('Valorar la App'),
                ),
              ),
            //Botón de para volver a la pantalla inicial
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navega a MyHomePage
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(title: 'Hatsu x Hatsu'),
                      ),
                    );
                  },
                  child: const Text('Regresar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper: Fila de información
  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: colorScheme.primary, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}