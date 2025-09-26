import 'package:flutter/material.dart';

class PersonajeGon extends StatelessWidget {
  const PersonajeGon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gon Freecss'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/Personajes/Gon_DetalleBW.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Gon Freecss',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Gon Freecss es el protagonista de Hunter x Hunter. Es un joven cazador con una personalidad alegre y determinada. Su objetivo principal es encontrar a su padre, Ging Freecss, quien también es un cazador legendario. A lo largo de la serie, Gon demuestra ser valiente, leal y poseer una gran habilidad para el combate y el uso del Nen.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 10,),
            Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Regresar'),
                ),
              )
          ],
        ),
      ),
    );
  }
}