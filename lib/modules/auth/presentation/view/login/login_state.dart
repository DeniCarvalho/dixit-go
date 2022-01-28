import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/core.dart';

part 'login_state.freezed.dart';

/// Tracking Card State
@Freezed()
class LoginState extends ViewModelState with _$LoginState {
  /// Creates an [LoginState]
  const factory LoginState({
    User? user,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingFacebook,
    @Default(false) bool isLoadingGoogle,
    @Default('') String error,
  }) = _LoginState;

  ///State initial
  factory LoginState.initial() => const LoginState();
}
