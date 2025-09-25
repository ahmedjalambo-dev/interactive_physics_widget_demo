# Draggable Color Match Game

This Flutter project is a mini physics simulation that demonstrates the use of `Draggable` and `DragTarget` widgets. Users can drag colored balls and drop them into containers of a matching color to score points.

The project is designed to showcase how to handle drag-and-drop gestures, provide visual feedback during the interaction, and manage state in a simple, interactive application.

## Demo

*(This animation demonstrates dragging balls to both correct and incorrect targets, the visual feedback on hover, and the success state after a correct match.)*

-----

## 📱 App Preview

Here is a preview of the color-matching game in action.
<p align="center">
<img src="https://github.com/user-attachments/assets/949e5c46-134c-4fab-aaef-5721257f69ed" alt="App Demo GIF" width="250" />
</p>

-----

## ✨ Features

  * ✅ **Drag & Drop Gameplay**: Users can physically pick up and move colored balls around the screen.
  * 🎯 **Matching Logic**: Drop targets will only accept balls that match their own color.
  * 👀 **Visual Feedback**: The UI provides instant feedback when a ball is being dragged, when it hovers over a valid target, and when a match is successful.
  * 🎉 **Success State**: When a correct match is made, a checkmark appears in the container, and the ball is removed from the starting area.
  * 🔄 **Reset Functionality**: A refresh button in the app bar allows the user to reset the score and start the game over.

-----

## 🛠️ Implementation Highlights

This project is a practical example of combining several key Flutter widgets to create an interactive experience.

  * **`Draggable<T>`**: Each ball is wrapped in a `Draggable` widget. The `data` property carries its `Color` value, the `feedback` property renders the floating ball that follows the user's finger, and `childWhenDragging` leaves a placeholder behind.
  * **`DragTarget<T>`**: Each container is a `DragTarget`. Its `onWillAcceptWithDetails` property contains the core logic to validate a drop (`details.data == color`), and `onAcceptWithDetails` is the callback that triggers the state change for a successful match.
  * **State Management**: A top-level `StatefulWidget` (`ColorMatchGame`) holds the application state, including the current score and a `Map<Color, bool>` to track which colors have already been successfully matched.
  * **Reusable Widgets**: The UI has been refactored into clean, reusable `BallWidget` and `TargetWidget` components. These widgets receive data via their constructors, making the main screen's build method declarative and easy to read.

-----

## 📂 Project Structure

The project code is organized with a focus on separation of concerns, with the UI logic for individual components extracted into a dedicated `widgets` directory.

```
lib/
├── widgets/
│   ├── ball_widget.dart     # The reusable draggable ball widget.
│   └── target_widget.dart   # The reusable drop target widget.
└── main.dart                  # The main screen, state management, and app entry point.
```

-----

## 🚀 Getting Started

To run this project locally, follow these steps:

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/ahmedjalambo-dev/interactive_physics_widget_demo
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd interactive_physics_widget_demo
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the app:**
    ```sh
    flutter run
    ```
