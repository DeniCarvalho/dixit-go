import '../../../../../core/core.dart';
import 'splash_state.dart';

/// PasswordCard ViewModel
class SplashViewModel extends ViewModel<SplashState> {
  final CheckAuth _checkAuth;

  /// Creates an [SplashViewModel]
  SplashViewModel({
    required CheckAuth checkAuth,
  })  : _checkAuth = checkAuth,
        super(SplashState.initial());

  /// Get auth
  void fetch() async {
    emit(state.copyWith(isLoading: true, user: null, error: ""));

    final failureOrUser = await _checkAuth(NoParams());
    failureOrUser.fold((failure) {
      emit(state.copyWith(
        error: failure.message,
        user: null,
        isLoading: false,
      ));
    }, (user) {
      emit(state.copyWith(
        user: user,
        isLoading: false,
        error: "",
      ));
    });
  }
}
