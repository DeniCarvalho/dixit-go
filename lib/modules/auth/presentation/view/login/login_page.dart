import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/core.dart';
import 'login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ViewState<LoginPage, LoginViewModel> {
  // late TextEditingController _emailController;
  // late TextEditingController _passController;
  // final FocusNode _passFocus = FocusNode();
  // late bool _loading = false;

  @override
  void initState() {
    // _emailController = TextEditingController();
    // _passController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ViewModelConsumer<LoginViewModel, LoginState>(
        viewModel: viewModel,
        listener: (_, state) {
          if (!state.isLoading) {
            if (state.error.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Ocorreu um erro'),
              ));
            }
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    BackgroundComponent(
                      alignment: Alignment.center,
                      image: Image.asset(
                        AppImages.background,
                        gaplessPlayback: true,
                      ).image,
                    ),
                    Container(
                      color: Colors.transparent,
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 50.responsiveHeight,
                          horizontal: 15.responsiveWidth,
                        ),
                        child: LogoComponent(
                          height: 50.responsiveWidth,
                          isHero: true,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: AppColors.backgroundColor,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ButtonDefaultComponent(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImages.google,
                            height: 20.responsiveHeight,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: 8.responsiveWidth,
                          ),
                          const Text(
                            'Entrar com Google',
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      action: () {},
                      backgroundColor: AppColors.light,
                    ),
                    SizedBox(
                      height: 15.responsiveHeight,
                    ),
                    ButtonDefaultComponent(
                      loadingColor: Colors.blue[800],
                      isLoading: state.isLoadingFacebook,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImages.facebook,
                            height: 20.responsiveHeight,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: 8.responsiveWidth,
                          ),
                          const Text(
                            'Entrar com Facebook',
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      action: viewModel.signInFacebook,
                      backgroundColor: AppColors.light,
                    ),
                  ],
                ),

                //  TextFieldComponent(
                //   controller: _emailController,
                //   placeholder: 'email'.i18n(context),
                //   keyboardType: TextInputType.emailAddress,
                //   textInputAction: TextInputAction.next,
                //   onFieldSubmitted: (val) {
                //     FocusScope.of(context).requestFocus(_passFocus);
                //   },
                //   validator: (val) {
                //     if (val == null || val.isEmpty) return 'Campo obrigatório';

                //     bool emailValid = RegExp(
                //             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                //         .hasMatch(val);
                //     if (!emailValid) return 'invalidEmail'.i18n(context);

                //     return null;
                //   },
                // ),
              ),
            ],
          );
        },
      ),
    );
  }
}
