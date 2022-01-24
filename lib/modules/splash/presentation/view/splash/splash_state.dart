import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/core.dart';

part 'splash_state.freezed.dart';

/// Tracking Card State
@Freezed()
class SplashState extends ViewModelState with _$SplashState {
  /// Creates an [SplashState]
  const factory SplashState({
    User? user,
    @Default(false) bool isLoading,
    @Default('') String error,
  }) = _SplashState;

  ///State initial
  factory SplashState.initial() => const SplashState();
}
