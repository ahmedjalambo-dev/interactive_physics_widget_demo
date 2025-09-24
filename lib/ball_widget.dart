import 'package:flutter/material.dart';

class BallWidget extends StatelessWidget {
  final Color color;

  const BallWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Draggable<Color>(
      // The data that will be dropped on the target
      data: color,
      // The widget that follows the user's finger (the feedback)
      feedback: Material(
        elevation: 8.0,
        shape: const CircleBorder(),
        child: CircleAvatar(backgroundColor: color, radius: 45),
      ),
      // The widget that is left behind in the original position
      childWhenDragging: CircleAvatar(
        backgroundColor: color.withAlpha(100),
        radius: 35,
      ),
      // The widget that is displayed when not being dragged
      child: CircleAvatar(backgroundColor: color, radius: 35),
    );
  }
}
