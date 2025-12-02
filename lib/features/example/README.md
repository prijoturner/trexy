# Example Feature with BLoC

This is an example feature demonstrating how to use BLoC pattern in this project.

## Structure

```
example/
├── domain/              # Business logic (not implemented in this example)
├── data/                # Data layer (not implemented in this example)
└── presentation/        # UI layer
    ├── bloc/            # BLoC state management
    │   ├── example_bloc.dart
    │   ├── example_event.dart
    │   └── example_state.dart
    ├── pages/           # Screen widgets
    │   └── example_page.dart
    └── widgets/         # Reusable components
```

## How to Use BLoC

### 1. Define Events

Events represent user actions or system events that trigger state changes.

```dart
abstract class ExampleEvent extends Equatable {
  const ExampleEvent();
  @override
  List<Object> get props => [];
}

class LoadExampleEvent extends ExampleEvent {}
```

### 2. Define States

States represent different UI states your screen can be in.

```dart
abstract class ExampleState extends Equatable {
  const ExampleState();
  @override
  List<Object> get props => [];
}

class ExampleInitial extends ExampleState {}
class ExampleLoading extends ExampleState {}
class ExampleLoaded extends ExampleState {
  final String data;
  const ExampleLoaded({required this.data});
}
```

### 3. Create BLoC

BLoC handles events and emits states.

```dart
class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleInitial()) {
    on<LoadExampleEvent>(_onLoadExample);
  }

  Future<void> _onLoadExample(
    LoadExampleEvent event,
    Emitter<ExampleState> emit,
  ) async {
    emit(ExampleLoading());
    // Business logic here
    emit(ExampleLoaded(data: 'Success!'));
  }
}
```

### 4. Use in UI

Provide BLoC and listen to state changes.

```dart
BlocProvider(
  create: (context) => ExampleBloc(),
  child: BlocBuilder<ExampleBloc, ExampleState>(
    builder: (context, state) {
      if (state is ExampleLoading) {
        return CircularProgressIndicator();
      }
      // Handle other states
    },
  ),
)
```

### 5. Dispatch Events

Trigger events from UI.

```dart
context.read<ExampleBloc>().add(LoadExampleEvent());
```

## BLoC Widgets

- **BlocProvider**: Provides BLoC to widget tree
- **BlocBuilder**: Rebuilds UI based on state changes
- **BlocListener**: Performs side effects (navigation, snackbars)
- **BlocConsumer**: Combines Builder and Listener
- **MultiBlocProvider**: Provides multiple BLoCs

## Best Practices

1. Keep BLoC logic pure and testable
2. Use Equatable for state comparison
3. Handle all possible states in UI
4. Use BlocListener for side effects
5. Dispose BLoC properly (automatic with BlocProvider)
