import 'package:flutter/material.dart';
import 'package:zoo_feed/features/auth/widgets/auth_password_field.dart';

import '../../../common/router/router.dart';
import '../../../common/utils/coloors.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController nameC = TextEditingController();
  final TextEditingController ageC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return const Text(
        'Register',
        style: TextStyle(
          color: Colors.black,
          fontSize: 40,
          fontWeight: FontWeight.w500,
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.goNamed(Routes.login);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Coloors.green,
            weight: 50,
            size: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            title(),
            const SizedBox(height: 30),
            AuthTextField(
              image: 'assets/icon/Name.png',
              controller: nameC,
              label: 'Full Name',
              keyBoardType: TextInputType.text,
            ),
            AuthTextField(
              image: 'assets/icon/calendar.png',
              controller: ageC,
              label: 'Age',
              keyBoardType: TextInputType.number,
            ),
            AuthTextField(
              image: 'assets/icon/Mail.png',
              controller: emailC,
              label: 'Email',
              keyBoardType: TextInputType.emailAddress,
            ),
            AuthPasswordField(
              controller: passwordC,
              icon: "assets/icon/Lock.png",
            ),
            const SizedBox(height: 30),
            AuthButton(
              onPressed: () {},
              text: "Submit",
            ),
            AuthFooter(
                text: 'Already have an account?',
                title: 'Sign In',
                onTap: () {
                  context.goNamed(Routes.login);
                }),
          ],
        ),
      ),
    );
  }
}
