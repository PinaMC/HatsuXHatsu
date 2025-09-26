import 'package:flutter/material.dart';

class LugarYorknewCity extends StatelessWidget {
  const LugarYorknewCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yorknew City'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/Lugares/Yorknew_City2.webp'),
              const SizedBox(height: 16),
              const Text(
                'Yorknew City',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Yorknew City es una ciudad ficticia en el universo de Hunter x Hunter, conocida por ser un centro de comercio y cultura. Es famosa por su arquitectura impresionante, sus mercados bulliciosos y su vibrante vida nocturna. La ciudad es también el escenario de varios eventos importantes en la serie, incluyendo la subasta de objetos raros y la batalla entre los cazadores y la mafia.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              const Text(
                'En Yorknew City, los personajes principales de Hunter x Hunter se enfrentan a numerosos desafíos y peligros, lo que hace que esta ciudad sea un lugar crucial en la trama de la serie. La atmósfera única de Yorknew City, combinada con su importancia en la historia, la convierte en uno de los lugares más memorables del anime.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 25),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Regresar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}