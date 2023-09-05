import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/show_snackbar.dart';
import '../../../common/router/router.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_password_field.dart';
import '../widgets/auth_text_field.dart';

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
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Center(
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
                ),
                AuthTextField(
                  image: 'assets/icon/Mail.png',
                  controller: emailC,
                  label: 'Email',
                  keyBoardType: TextInputType.emailAddress,
                ),
                AuthPasswordField(
                  controller: passwordC,
                  icon: 'assets/icon/Lock.png',
                ),
                const SizedBox(height: 25),
                AuthButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthEventLogin(
                          email: emailC.text,
                          password: passwordC.text,
                        ));
                  },
                  text: 'Log In',
                ),
                AuthFooter(
                  text: 'Don’t have an account?',
                  title: 'Create account',
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
