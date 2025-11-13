// ignore_for_file: file_names
import 'package:flutter/material.dart';



class PersonajeGon extends StatelessWidget {
  const PersonajeGon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gon Freecss'),
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
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
            Text(
              'Gon Freecss',
              style: TextStyle(
                fontSize: 24, 
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              
              child: Text(
                'Gon Freecss es el protagonista de Hunter x Hunter. Es un joven cazador con una personalidad alegre y determinada. Su objetivo principal es encontrar a su padre, Ging Freecss, quien también es un cazador legendario. A lo largo de la serie, Gon demuestra ser valiente, leal y poseer una gran habilidad para el combate y el uso del Nen.',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.onSurfaceVariant),
                //style: TextStyle(fontSize: 16, color: Theme.of(context),colorScheme.onSurface,fontWeight: FontWeight.w400)),
                
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