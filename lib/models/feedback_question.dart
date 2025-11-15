class FeedbackQuestion {
  final String titulo;
  int valor;
  final String min;
  final String max;

  FeedbackQuestion({
    required this.titulo,
    required this.valor,
    required this.min,
    required this.max,
  });

  factory FeedbackQuestion.fromJson(Map<String, dynamic> json) {
    return FeedbackQuestion(
      titulo: json['titulo'] as String,
      valor: json['valor'] as int,
      min: json['min'] as String,
      max: json['max'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'valor': valor,
      'min': min,
      'max': max,
    };
  }
}

class FeedbackCategories {
  final List<FeedbackQuestion> usabilidad;
  final List<FeedbackQuestion> contenido;
  final List<FeedbackQuestion> compartir;

  FeedbackCategories({
    required this.usabilidad,
    required this.contenido,
    required this.compartir,
  });

  factory FeedbackCategories.fromJson(Map<String, dynamic> json) {
    return FeedbackCategories(
      usabilidad: (json['usabilidad'] as List)
          .map((q) => FeedbackQuestion.fromJson(q))
          .toList(),
      contenido: (json['contenido'] as List)
          .map((q) => FeedbackQuestion.fromJson(q))
          .toList(),
      compartir: (json['compartir'] as List)
          .map((q) => FeedbackQuestion.fromJson(q))
          .toList(),
    );
  }

  List<FeedbackQuestion> getAllQuestions() {
    return [...usabilidad, ...contenido, ...compartir];
  }
}