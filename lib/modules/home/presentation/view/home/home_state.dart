import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/core.dart';

part 'home_state.freezed.dart';

/// Tracking Card State
@Freezed()
class HomeState extends ViewModelState with _$HomeState {
  /// Creates an [HomeState]
  const factory HomeState({
    User? user,
    @Default(false) bool isLoading,
    @Default('') String error,
  }) = _HomeState;

  ///State initial
  factory HomeState.initial() => const HomeState();
}
