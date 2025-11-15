import 'package:flutter/material.dart';

/// Clase para representar un ítem favorito
class FavoriteItem {
  final String id;
  final String name;
  final IconData icon;
  final String description;
  final String category;

  const FavoriteItem({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.category,
  });

  //Esto sirve como una base de datos local
  static const List<FavoriteItem> allItems = [
    // Tipos de Nen
    FavoriteItem(
      id: 'intensificacion',
      name: 'Intensificación',
      icon: Icons.fitness_center,
      description: 'Potencian las propiedades naturales de un objeto o el cuerpo',
      category: 'nen',
    ),
    FavoriteItem(
      id: 'transmutacion',
      name: 'Transmutación',
      icon: Icons.water_drop,
      description: 'Cambian las propiedades del aura imitando otras sustancias',
      category: 'nen',
    ),
    FavoriteItem(
      id: 'materializacion',
      name: 'Materialización',
      icon: Icons.construction,
      description: 'Crean objetos físicos a partir de su aura',
      category: 'nen',
    ),
    FavoriteItem(
      id: 'emision',
      name: 'Emisión',
      icon: Icons.sports_baseball,
      description: 'Separan su aura del cuerpo y la controlan a distancia',
      category: 'nen',
    ),
    FavoriteItem(
      id: 'manipulacion',
      name: 'Manipulación',
      icon: Icons.control_camera,
      description: 'Controlan objetos o seres vivos con su aura',
      category: 'nen',
    ),
    FavoriteItem(
      id: 'especializacion',
      name: 'Especialización',
      icon: Icons.auto_awesome,
      description: 'Habilidades únicas que no encajan en otras categorías',
      category: 'nen',
    ),
    
    // Personajes
    FavoriteItem(
      id: 'personaje_gon',
      name: 'Gon Freecss',
      icon: Icons.person,
      description: 'Protagonista principal de Hunter x Hunter',
      category: 'personaje',
    ),
    FavoriteItem(
      id: 'personaje_leorio',
      name: 'Leorio Paradinight',
      icon: Icons.person,
      description: 'Cazador Médico con gran corazón',
      category: 'personaje',
    ),
    FavoriteItem(
      id: 'personaje_kurapika',
      name: 'Kurapika',
      icon: Icons.person,
      description: 'Último superviviente del Clan Kurta',
      category: 'personaje',
    ),
    FavoriteItem(
      id: 'personaje_killua',
      name: 'Killua Zoldyck',
      icon: Icons.person,
      description: 'Heredero de la familia de asesinos Zoldyck',
      category: 'personaje',
    ),
    
    // Lugares
    FavoriteItem(
      id: 'lugar_mapa',
      name: 'Mapa de HxH',
      icon: Icons.map,
      description: 'Mapa completo del mundo de Hunter x Hunter',
      category: 'lugar',
    ),
    FavoriteItem(
      id: 'lugar_yorknew',
      name: 'Yorknew City',
      icon: Icons.location_city,
      description: 'La ciudad que nunca duerme',
      category: 'lugar',
    ),
    FavoriteItem(
      id: 'lugar_greed',
      name: 'Greed Island',
      icon: Icons.videogame_asset,
      description: 'El videojuego legendario creado por Ging',
      category: 'lugar',
    ),
  ];

  static FavoriteItem? getById(String id) {
    try {
      return allItems.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }
}