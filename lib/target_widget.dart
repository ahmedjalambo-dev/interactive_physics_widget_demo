import 'package:flutter/material.dart';

class TargetWidget extends StatelessWidget {
  final Color color;
  final bool isMatched;
  final Function(Color) onAccept; // Callback when a ball is accepted

  const TargetWidget({
    super.key,
    required this.color,
    required this.isMatched,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<Color>(
      // The builder provides the UI for the drop target
      builder: (context, candidateData, rejectedData) {
        // candidateData contains data of draggables hovering over the target
        bool isHovering = candidateData.isNotEmpty;
        bool isCorrectHover = isHovering && candidateData.first == color;

        return Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: isCorrectHover ? color.withAlpha(200) : color.withAlpha(100),
            border: Border.all(
              color: isHovering ? Colors.white : color,
              width: isHovering ? 4 : 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          // Show a checkmark if a correct ball was dropped
          child: isMatched
              ? const Icon(Icons.check_circle, color: Colors.white, size: 50)
              : null,
        );
      },
      // onWillAccept is called when a draggable is about to be dropped.
      // It must return true to allow the drop.
      onWillAcceptWithDetails: (details) {
        return details.data == color && !isMatched;
      },
      // onAccept is called when a draggable is successfully dropped.
      onAcceptWithDetails: (details) {
        onAccept(details.data);
      },
    );
  }
}
