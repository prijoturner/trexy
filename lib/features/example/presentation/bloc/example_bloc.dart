import 'package:flutter_bloc/flutter_bloc.dart';
import 'example_event.dart';
import 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleInitial()) {
    on<LoadExampleEvent>(_onLoadExample);
  }

  Future<void> _onLoadExample(
    LoadExampleEvent event,
    Emitter<ExampleState> emit,
  ) async {
    emit(ExampleLoading());

    try {
      // Simulate loading data
      await Future.delayed(const Duration(seconds: 1));
      emit(const ExampleLoaded(data: 'Example data loaded!'));
    } catch (e) {
      emit(ExampleError(message: e.toString()));
    }
  }
}
