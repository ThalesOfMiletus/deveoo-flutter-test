# Flutter Test

This repository contains the source code for the Flutter Test at Deveoo.

## Overview

A simple Flutter application demonstrating:

* **Home Screen**: List of posts (`Post 1` to `Post 10`) using `ListView.builder`.
* **Detail Screen**: Displays the post title and fetches comments from JSONPlaceholder API with a loading spinner.
* **Bottom Navigation Bar**: Two tabs (Home and About).
* **Light/Dark Theme**: Global theme configuration with a switch in the AppBar.

## Features

* Dynamic list generation of posts.
* Navigation to detail view with HTTP data fetching.
* `FutureBuilder` for asynchronous UI updates.
* Global theming via `AppTheme` (colors extracted from Deveoo logo).
* ThemeMode toggle between light and dark.

## Prerequisites

* Flutter SDK (>= 3.0.0)
* Dart SDK
* A connected device or emulator

## Getting Started

1. **Clone the repository**

   ```bash
   git clone https://github.com/ThalesOfMiletus/deveoo-flutter-test.git
   cd deveoo-flutter-test
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```

4. **Toggle Theme**

   * Use the switch in the AppBar to switch between light and dark modes.

## Project Structure

```
lib/
├── main.dart           # App entry point
├── screens/
│   ├── home_screen.dart
│   ├── detail_screen.dart
│   └── about_screen.dart (unused, kept for reference)
└── theme/
    └── app_theme.dart  # Global theme settings
```

## API

Comments are fetched from:

```
https://jsonplaceholder.typicode.com/comments?postId={id}
```

## Contact

* **Name:** Thales Martins Cogo
* **Email:** [thalescogo@outlook.com](mailto:thalescogo@outlook.com)
