# Sugar Catch

A mobile app to track hidden sugar in grocery foods and monitor daily consumption.

## Features

- **Barcode Scanning**: Scan product barcodes to instantly check sugar content
- **Hidden Sugar Detection**: Identify added sugars in products that seem healthy
- **Daily Tracking**: Monitor your total sugar intake throughout the day
- **Consumption Graphs**: Visualize your sugar consumption trends over time
- **Food Database**: Powered by OpenFoodFacts API for comprehensive product data

## About

Many grocery products contain hidden added sugars, even in items that appear healthy like oat meal or yogurt. Sugar Catch helps you make informed decisions by revealing the true sugar content of foods and tracking your daily intake.

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

- **mobile_scanner**: Barcode scanning functionality
- **http**: API calls to OpenFoodFacts
- **fl_chart**: Sugar consumption visualization
- **hive_ce & hive_ce_flutter**: Local data storage (Community Edition)
- **json_annotation**: JSON serialization
- **hooks_riverpod**: State management with hooks
- **flutter_hooks**: React-style hooks for Flutter
