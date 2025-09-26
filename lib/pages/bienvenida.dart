import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'my_home_page.dart'; // me lleva a la pantalla principal

class BienvenidaScreen extends StatelessWidget {
  const BienvenidaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("BienvenidaScreen cargada"); // mensaje de bienvenida

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo de tu app
            Image.asset(
              'assets/Otros/hxh_logo.png', 
              width: 200,
              height: 200,
            ),
            const Text(
              'Hatsu x Hatsu',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyHomePage(
                            title: "Hatsu x Hatsu",
                          )),
                );
              },
              child: const Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}
