import 'package:flutter/material.dart';
import 'package:zoo_feed/common/widgets/custom_elevated_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget image() {
      return Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/img/Animal care.png'),
            const SizedBox(height: 10),
            const Text(
              'interaction with animals',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'feed the animals for an awesome experience',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image(),
          const Expanded(child: SizedBox()),
          Container(
            margin: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
            child: Column(
              children: [
                CustomElevatedButton(
                    onPressed: () => {}, text: 'Explore', isOutline: false),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  onPressed: () => {},
                  text: 'Sign Up',
                  isOutline: true,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
