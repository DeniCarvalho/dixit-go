import '../../../../../core/core.dart';
import '../../../../auth/presentation/auth_routes.dart';
import 'home_state.dart';

class HomeViewModel extends ViewModel<HomeState> {
  final CheckAuth _checkAuth;

  /// Creates an [HomeViewModel]
  HomeViewModel({
    required CheckAuth checkAuth,
  })  : _checkAuth = checkAuth,
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
}
