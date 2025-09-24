import 'package:flutter/material.dart';
import 'package:interactive_physics_widget/ball_widget.dart';
import 'package:interactive_physics_widget/target_widget.dart';

class ColorMatchGame extends StatefulWidget {
  const ColorMatchGame({super.key});

  @override
  State<ColorMatchGame> createState() => _ColorMatchGameState();
}

class _ColorMatchGameState extends State<ColorMatchGame> {
  // Using a Map to track which ball has been successfully dropped
  final Map<Color, bool> _successfulMatches = {};
  int _score = 0;

  // The set of colors for balls and targets
  final List<Color> _ballColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  // Helper method to reset the game state
  void _resetGame() {
    setState(() {
      _successfulMatches.clear();
      _score = 0;
    });
  }

  // Callback function for when a ball is accepted by a target
  void _onBallAccepted(Color color) {
    setState(() {
      _score++;
      _successfulMatches[color] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Match Game | Score: $_score'),
        backgroundColor: ThemeData().colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetGame,
            tooltip: 'Reset Game',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTargetSection(),
            const Divider(height: 50),
            _buildBallSection(),
          ],
        ),
      ),
    );
  }

  /// Builds the row of drop target containers using the new widget
  Widget _buildTargetSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _ballColors.map((color) {
        return TargetWidget(
          color: color,
          isMatched: _successfulMatches[color] ?? false,
          onAccept: _onBallAccepted,
        );
      }).toList(),
    );
  }

  /// Builds the row of draggable balls using the new widget
  Widget _buildBallSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _ballColors.map((color) {
        // If a ball is already matched, show an empty space
        if (_successfulMatches[color] ?? false) {
          return const SizedBox(width: 70, height: 70);
        }
        return BallWidget(color: color);
      }).toList(),
    );
  }
}
