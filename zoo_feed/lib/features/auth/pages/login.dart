import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoo_feed/common/helper/show_snackbar.dart';
import 'package:zoo_feed/features/auth/bloc/auth_bloc.dart';
import 'package:zoo_feed/features/auth/widgets/auth_text_field.dart';

import '../../../common/router/router.dart';
import '../../../common/widgets/custom_passwordfield.dart';
import '../widgets/auth_button.dart';
import '../widgets/footer.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthStateError) {
              ShowSnackbar.failed(
                context: context,
                message: state.message,
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: ListView(
              children: [
                Center(
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/img/zoo_feed-01.png',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                AuthTextField(
                  image: 'assets/icon/Mail.png',
                  controller: emailC,
                  label: 'Email',
                  keyBoardType: TextInputType.emailAddress,
                  isRead: false,
                ),
                CustomPasswordField(controller: passwordC),
                const SizedBox(height: 30),
                CustomAuthButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthEventLogin(
                          email: emailC.text,
                          password: passwordC.text,
                        ));
                  },
                  text: 'Log In',
                ),
                Footer(
                  text: 'Don’t have an account?',
                  title: 'Sign Up',
                  onTap: () {
                    context.goNamed(Routes.register);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
