import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';
import 'pages/bienvenida.dart';
import 'providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar el provider de temas
  final themeProvider = ThemeProvider();
  await themeProvider.initialize();
  
  runApp(
    ChangeNotifierProvider.value(
      value: themeProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("Logger is working! (main dart)");

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        // Mostrar splash screen mientras carga el tema
        if (themeProvider.isLoading) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        return MaterialApp(
          title: 'Hatsu x Hatsu',
          theme: themeProvider.themeData, //  Tema dinámico
          home: const BienvenidaScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}