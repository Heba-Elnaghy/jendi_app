# Jendi App

Welcome to the Jendi App! This guide will help you get started with running and understanding the project.

## Prerequisites

Before you start, make sure you have the following installed on your computer:

1. **Flutter SDK**: You can download it from [Flutter's official website](https://flutter.dev/docs/get-started/install).
2. **Dart SDK**: This comes bundled with Flutter.
3. **Android Studio or Xcode**: For running the app on Android or iOS devices/emulators.

## Getting Started

### Step 1: Clone the Repository

First, you need to get a copy of the project on your local machine. Open your terminal and run:

```sh
git clone https://github.com/Heba-Elnaghy/jendi_app.git
cd jendi_app
```

Step 2: Install Dependencies
Next, you need to install the necessary dependencies. Run the following command in the terminal:

```sh
flutter pub get
```

Step 3: Run the App
Now, you can run the app on an emulator or a physical device.

On Android:
Start an Android Emulator: Open Android Studio, go to the AVD Manager, and start an emulator.

Run the App: In the terminal, run:

```sh
flutter run
```

On iOS:
Start an iOS Simulator: Open Xcode, go to the Simulator, and start an iOS device.

Run the App: In the terminal, run:

```sh
flutter run
```

Step 4: Using the App
Once the app is running, you will see the home screen with three buttons:

Enable Sensors: This button will enable the sensors required for the app (Heart Rate, Step Count, Body).
Get Scores: This button will fetch the scores from the Sahha.api.
Load Mock Data: This button will load mock data for testing purposes.

Project Structure
Here's a brief overview of the project structure:

```sh
lib/
├── main.dart          # Entry point of the application
├── app.dart           # Main app configuration
├── core/              # Core functionalities and utilities
│   ├── constants/     # Constant values like API keys
│   ├── utils/         # Utility functions and classes
│   └── widgets/       # Reusable widgets
├── data/              # Data layer of the application
│   ├── models/        # Data models
│   ├── repositories/  # Repository classes for data operations
│   └── services/      # Services interacting with external APIs
├── logic/             # Business logic layer
│   └── cubits/        # Cubit classes for state management
├── presentation/      # Presentation layer of the application
│   ├── pages/         # Different pages/screens of the app
│   └── widgets/       # Widgets specific to the presentation layer
└── routes/            # Route definitions and navigation logic
```

Additional Commands
Build the App: To build the app for release, run:

```sh
flutter build apk   # For Android
flutter build ios   # For iOS
```

Run Tests: To run the tests, use:

```sh
flutter test
```

Troubleshooting
If you encounter any issues, try the following:

1- Check Flutter Doctor: Run flutter doctor in the terminal to check for any missing dependencies.
2- Clean the Project: Run flutter clean to clean the project and then flutter pub get to reinstall dependencies.
3- Restart the IDE: Sometimes, restarting your IDE can resolve issues.

Conclusion
That's it! You are now ready to run and explore the Jendi App. If you have any questions or need further assistance, feel free to reach out.

Happy coding! 🚀
