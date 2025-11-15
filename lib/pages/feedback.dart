import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import '../models/feedback_question.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _nombreController = TextEditingController();
  FeedbackCategories? _feedbackData;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadFeedbackQuestions();
  }

  Future<void> _loadFeedbackQuestions() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/feedback_questions.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      setState(() {
        _feedbackData = FeedbackCategories.fromJson(jsonData);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error al cargar las preguntas: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _enviarFeedback() async {
  if (_nombreController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Por favor ingresa tu nombre'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  final allQuestions = _feedbackData!.getAllQuestions();
  final unanswered = allQuestions.where((q) => q.valor == 0).length;

  if (unanswered > 0) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Por favor responde todas las preguntas ($unanswered pendientes)'),
        backgroundColor: Colors.orange,
      ),
    );
    return;
  }

  final emailBody = _generarCuerpoEmail();
  final emailSubject = 'Feedback de Hatsu x Hatsu - ${_nombreController.text}';
  
  final subject = Uri.encodeComponent(emailSubject);
  final body = Uri.encodeComponent(emailBody);
  
  final Uri emailUri = Uri.parse(
    'mailto:vicentefariaspina@gmail.com?subject=$subject&body=$body',
  );

  try {
    await launchUrl(
      emailUri,
      mode: LaunchMode.externalApplication,
    );
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Abriendo aplicación de correo...'),
          backgroundColor: Colors.green,
        ),
      );
    }
  } catch (e) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No se pudo abrir la aplicación de correo. Asegúrate de tener una app de correo instalada.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 4),
        ),
      );
    }
  }
}
  String _generarCuerpoEmail() {
    final buffer = StringBuffer();
    buffer.writeln('FEEDBACK DE USUARIO');
    buffer.writeln('===================\n');
    buffer.writeln('Nombre: ${_nombreController.text}\n');
    buffer.writeln('Fecha: ${DateTime.now().toString().split('.')[0]}\n');
    buffer.writeln('---\n');

    buffer.writeln('USABILIDAD');
    buffer.writeln('----------');
    for (var q in _feedbackData!.usabilidad) {
      buffer.writeln('${q.titulo}');
      buffer.writeln('Calificación: ${q.valor}/5 estrellas\n');
    }

    buffer.writeln('CONTENIDO');
    buffer.writeln('---------');
    for (var q in _feedbackData!.contenido) {
      buffer.writeln('${q.titulo}');
      buffer.writeln('Calificación: ${q.valor}/5 estrellas\n');
    }

    buffer.writeln('COMPARTIR');
    buffer.writeln('---------');
    for (var q in _feedbackData!.compartir) {
      buffer.writeln('${q.titulo}');
      buffer.writeln('Calificación: ${q.valor}/5 estrellas\n');
    }

    final promedio = _feedbackData!.getAllQuestions()
        .map((q) => q.valor)
        .reduce((a, b) => a + b) / _feedbackData!.getAllQuestions().length;
    
    buffer.writeln('---');
    buffer.writeln('PROMEDIO GENERAL: ${promedio.toStringAsFixed(2)}/5 estrellas');

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Valorar la App'),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Valorar la App'),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              _errorMessage!,
              style: TextStyle(color: colorScheme.error, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Valorar la App'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.feedback, color: colorScheme.primary, size: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Tu opinión es importante',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Por favor, tómate un momento para calificar tu experiencia con Hatsu x Hatsu',
                    style: TextStyle(
                      fontSize: 14,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            TextField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: 'Tu nombre',
                hintText: 'Ingresa tu nombre',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: colorScheme.surfaceContainer.withValues(alpha: 0.3),
              ),
            ),

            const SizedBox(height: 32),

            _buildCategorySection('Usabilidad', _feedbackData!.usabilidad, colorScheme),
            const SizedBox(height: 24),
            _buildCategorySection('Contenido', _feedbackData!.contenido, colorScheme),
            const SizedBox(height: 24),
            _buildCategorySection('Compartir', _feedbackData!.compartir, colorScheme),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _enviarFeedback,
                icon: const Icon(Icons.send),
                label: const Text('Enviar Valoración'),
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

  Widget _buildCategorySection(String title, List<FeedbackQuestion> questions, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        ...questions.map((question) => _buildQuestionCard(question, colorScheme)).toList(),
      ],
    );
  }

  Widget _buildQuestionCard(FeedbackQuestion question, ColorScheme colorScheme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.titulo,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final starValue = index + 1;
              return IconButton(
                icon: Icon(
                  starValue <= question.valor ? Icons.star : Icons.star_border,
                  size: 36,
                ),
                color: starValue <= question.valor ? Colors.amber : colorScheme.onSurfaceVariant,
                onPressed: () {
                  setState(() {
                    question.valor = starValue;
                  });
                },
              );
            }),
          ),
          if (question.valor > 0)
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${question.valor} ${question.valor == 1 ? 'estrella' : 'estrellas'}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onPrimaryContainer,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          const SizedBox(height: 8),
          Text(
            question.min,
            style: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurfaceVariant,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            question.max,
            style: TextStyle(
              fontSize: 12,
              color: colorScheme.onSurfaceVariant,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }
}