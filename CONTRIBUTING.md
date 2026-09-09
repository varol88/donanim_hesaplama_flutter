# Flutter Build Files

Dart files should have the following imports:

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
```

## Code Organization

- **models/**: Data models and domain entities
- **data/**: Static data and product information
- **providers/**: State management with Provider
- **screens/**: Full screen widgets
- **widgets/**: Reusable UI components
- **utils/**: Utility functions and services

## Naming Conventions

- Classes: `PascalCase` (e.g., `HesapProvider`)
- Methods/Functions: `camelCase` (e.g., `hesapla()`)
- Constants: `SCREAMING_SNAKE_CASE` (e.g., `MAX_WIDTH`)
- Files: `snake_case.dart` (e.g., `hesap_provider.dart`)

## Code Style

- Use const constructors where possible
- Add documentation comments for public APIs
- Use meaningful variable names
- Keep functions small and focused
