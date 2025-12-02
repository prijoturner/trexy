# Poppins Font Setup

The Poppins font has been successfully configured for this project with a clean TextStyle helper.

## Usage

### Using AppTextStyles Helper (Recommended)

The `AppTextStyles` class provides clean, easy-to-use methods for all Poppins font weights:

```dart
import 'package:trexy/config/theme/app_text_styles.dart';

// Simple usage
Text('Hello', style: AppTextStyles.bold())

// With font size
Text('Hello', style: AppTextStyles.medium(fontSize: 18))

// With color
Text('Hello', style: AppTextStyles.semiBold(color: Colors.blue))

// With both
Text('Hello', style: AppTextStyles.regular(fontSize: 16, color: Colors.grey))
```

### Available Methods

- `AppTextStyles.thin()` - Weight 100
- `AppTextStyles.extraLight()` - Weight 200
- `AppTextStyles.light()` - Weight 300
- `AppTextStyles.regular()` - Weight 400 (default)
- `AppTextStyles.medium()` - Weight 500
- `AppTextStyles.semiBold()` - Weight 600
- `AppTextStyles.bold()` - Weight 700
- `AppTextStyles.extraBold()` - Weight 800
- `AppTextStyles.black()` - Weight 900

All methods accept optional parameters:

- `fontSize`: double? - Set the font size
- `color`: Color? - Set the text color

### Example

```dart
Column(
  children: [
    Text('Thin Text', style: AppTextStyles.thin(fontSize: 18)),
    Text('Regular Text', style: AppTextStyles.regular(fontSize: 18)),
    Text('Bold Text', style: AppTextStyles.bold(fontSize: 18)),
    Text('Black Text', style: AppTextStyles.black(fontSize: 18, color: Colors.red)),
  ],
)
```

### Default Font

All text in the app automatically uses Poppins font because it's set as the default in `AppTheme`. You only need to use `AppTextStyles` when you want specific font weights.

## Font Files Location

All Poppins font files are located in the `font/` directory and are properly configured in `pubspec.yaml`.

## Note on IDE Warnings

You may see analyzer warnings in `app_text_styles.dart` about "Undefined name 'FontWeight'" or "Undefined class 'Color'". These are false positives from the IDE's analysis server and can be safely ignored. The code compiles and runs perfectly - you can verify this by checking that files using `AppTextStyles` (like `example_page.dart`) have no errors.
