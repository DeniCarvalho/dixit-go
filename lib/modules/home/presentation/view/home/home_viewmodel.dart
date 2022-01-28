import '../../../../../core/core.dart';
import '../../../../auth/presentation/auth_routes.dart';
import 'home_state.dart';

class HomeViewModel extends ViewModel<HomeState> {
  final CheckAuth _checkAuth;
  final SignOut _signOut;

  /// Creates an [HomeViewModel]
  HomeViewModel({
    required CheckAuth checkAuth,
    required SignOut signOut,
  })  : _checkAuth = checkAuth,
        _signOut = signOut,
        super(HomeState.initial());

  /// Get auth
  void fetch() async {
    emit(state.copyWith(isLoading: true, user: null, error: ""));

    final failureOrUser = await _checkAuth(NoParams());
    failureOrUser.fold((failure) {
      Nav.navigate(AuthRoutes.login.asAuthRoutesChild);
    }, (user) {
      emit(state.copyWith(
        user: user,
        isLoading: false,
        error: "",
      ));
    });
  }

  void signOut() async {
    emit(state.copyWith(isLoading: true, error: ""));

    final failureOrUser = await _signOut(NoParams());
    failureOrUser.fold((failure) {
      emit(state.copyWith(
        isLoading: false,
        error: failure.message,
      ));
    }, (_) => Nav.navigate(AuthRoutes.login.asAuthRoutesChild));
  }
}
