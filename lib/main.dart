import 'package:flutter/material.dart';
import 'package:interactive_physics_widget/color_match_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draggable Physics Demo',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const ColorMatchGame(),
    );
  }
}

