import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoo_feed/common/helper/show_snackbar.dart';
import 'package:zoo_feed/features/auth/bloc/auth_bloc.dart';

import '../../../common/router/router.dart';
import '../../../common/widgets/custom_passwordfield.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../widgets/auth_button.dart';
import '../widgets/footer.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return const Text(
        'Log In',
        style: TextStyle(
            color: Colors.black, fontSize: 40, fontWeight: FontWeight.w500),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocListener<AuthBloc, AuthState>(
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
          margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(),
              const SizedBox(height: 30),
              CustomTextField(
                image: 'assets/icon/Mail.png',
                controller: emailC,
                hintText: 'Email',
                keyBoardType: TextInputType.emailAddress,
                read: false,
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
    );
  }
}
