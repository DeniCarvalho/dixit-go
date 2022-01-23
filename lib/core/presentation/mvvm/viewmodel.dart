import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'mvvm.dart';

/// A view model that is used by [View] to handle application states and
/// interact with usecases
abstract class ViewModel<State extends ViewModelState> extends Cubit<State>
    implements Disposable {
  /// Creates a [ViewModel]
  ViewModel(initialState) : super(initialState);

  @override
  void emit(State state) {
    super.emit(state);
  }

  @override
  State get state {
    return super.state;
  }

  @override
  Stream<State> get stream {
    return super.stream;
  }

  @override
  void dispose() {
    super.close();
  }
}
