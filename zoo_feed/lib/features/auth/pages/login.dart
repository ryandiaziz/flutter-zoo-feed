import 'package:flutter/material.dart';
import 'package:zoo_feed/common/widgets/custom_elevated_button.dart';
import 'package:zoo_feed/common/widgets/custom_passwordfield.dart';
import 'package:zoo_feed/common/widgets/custom_textfield.dart';
import 'package:zoo_feed/features/auth/pages/register.dart';
import 'package:zoo_feed/features/auth/widgets/footer.dart';

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
      body: Container(
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
            CustomElevatedButton(
              onPressed: () {},
              text: 'Log In',
              isOutline: false,
            ),
            Footer(
              text: 'Don’t have an account?',
              title: 'Sign Up',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
