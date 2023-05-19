import 'package:flutter/material.dart';
import 'package:zoo_feed/features/auth/widgets/footer.dart';

import '../../../common/utils/coloors.dart';
import '../../../common/widgets/custom_elevated_button.dart';
import '../../../common/widgets/custom_passwordfield.dart';
import '../../../common/widgets/custom_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
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
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_rounded,
          color: Coloors.green,
          weight: 50,
          size: 30,
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
              image: 'assets/icon/Mail.png',
              controller: emailC,
              hintText: 'Email',
              keyBoardType: TextInputType.emailAddress,
              read: false,
            ),
            CustomPasswordField(controller: passwordC),
            const SizedBox(height: 30),
            CustomElevatedButton(
              onPressed: () => {},
              text: 'Sign Up',
              isOutline: false,
            ),
            const Footer(
              text: 'Already have an account?',
              title: 'Sign In',
            )
          ],
        ),
      ),
    );
  }
}
