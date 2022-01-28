import '../../../../../core/core.dart';
import '../../../../home/presentation/home_routes.dart';
import 'login_state.dart';

class LoginViewModel extends ViewModel<LoginState> {
  final SignInFacebook _signInFacebook;

  /// Creates an [LoginViewModel]
  LoginViewModel({
    required SignInFacebook signInFacebook,
  })  : _signInFacebook = signInFacebook,
        super(LoginState.initial());

  void signInFacebook() async {
    emit(state.copyWith(isLoadingFacebook: true, user: null, error: ""));

    final failureOrUser = await _signInFacebook(NoParams());
    failureOrUser.fold((failure) {
      emit(state.copyWith(
        isLoadingFacebook: false,
        error: failure.message,
      ));
    }, (user) {
      emit(state.copyWith(
        isLoadingFacebook: false,
        user: user,
        error: '',
      ));
      Nav.navigate(HomeRoutes.home.asHomeChild);
    });
  }
}
