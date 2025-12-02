# Clean Architecture Structure

This project follows Clean Architecture principles with the following structure:

## Folder Structure

```
lib/
├── core/                          # Core functionality shared across features
│   ├── error/                     # Error handling
│   │   ├── exceptions.dart        # Exception classes
│   │   └── failures.dart          # Failure classes
│   ├── network/                   # Network utilities
│   │   └── network_info.dart      # Network connectivity checker
│   ├── usecases/                  # Base usecase classes
│   │   └── usecase.dart           # UseCase abstract class
│   └── utils/                     # Utility classes
│       └── constants.dart         # App constants
│
├── features/                      # Feature modules
│   └── [feature_name]/            # Each feature has its own folder
│       ├── domain/                # Business logic layer
│       │   ├── entities/          # Business objects
│       │   ├── repositories/      # Repository interfaces
│       │   └── usecases/          # Business use cases
│       ├── data/                  # Data layer
│       │   ├── models/            # Data models (extends entities)
│       │   ├── datasources/       # Data sources (remote/local)
│       │   └── repositories/      # Repository implementations
│       └── presentation/          # UI layer
│           ├── bloc/              # State management (BLoC/Cubit)
│           ├── pages/             # Screen widgets
│           └── widgets/           # Reusable UI components
│
├── config/                        # App configuration
│   ├── routes/                    # Navigation/routing
│   │   └── app_routes.dart
│   └── theme/                     # App theming
│       └── app_theme.dart
│
├── injection_container.dart       # Dependency injection setup
└── main.dart                      # App entry point
```

## Layer Responsibilities

### Domain Layer

- Contains business logic and entities
- Independent of any framework or external library
- Defines repository interfaces (contracts)
- Contains use cases that orchestrate business logic

### Data Layer

- Implements repository interfaces from domain layer
- Contains data models that extend domain entities
- Manages data sources (API, local database, cache)
- Handles data transformation between models and entities

### Presentation Layer

- Contains UI components (pages, widgets)
- Manages state using BLoC/Cubit or other state management
- Depends on domain layer (use cases and entities)
- Should not depend on data layer directly

## Dependencies Flow

```
Presentation → Domain ← Data
```

- Presentation depends on Domain
- Data depends on Domain
- Domain depends on nothing (pure Dart)

## Adding a New Feature

1. Create feature folder: `lib/features/[feature_name]/`
2. Create domain layer:
   - Define entities
   - Define repository interface
   - Create use cases
3. Create data layer:
   - Create models
   - Implement data sources
   - Implement repository
4. Create presentation layer:
   - Create BLoC/Cubit for state management
   - Create pages and widgets
5. Register dependencies in `injection_container.dart`
