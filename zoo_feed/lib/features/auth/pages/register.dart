import 'package:flutter/material.dart';

import '../../../common/router/router.dart';
import '../../../common/utils/coloors.dart';
import '../../../common/widgets/custom_elevated_button.dart';
import '../../../common/widgets/custom_passwordfield.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../widgets/footer.dart';

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
        'Sign Up',
        style: TextStyle(
            color: Colors.black, fontSize: 40, fontWeight: FontWeight.w500),
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
              image: 'assets/icon/Name.png',
              controller: nameC,
              hintText: 'Full Name',
              keyBoardType: TextInputType.text,
              read: false,
            ),
            CustomTextField(
              image: 'assets/icon/calendar.png',
              controller: ageC,
              hintText: 'Age',
              keyBoardType: TextInputType.number,
              read: false,
            ),
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
              onPressed: () {},
              text: 'Sign Up',
              isOutline: false,
            ),
            Footer(
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
