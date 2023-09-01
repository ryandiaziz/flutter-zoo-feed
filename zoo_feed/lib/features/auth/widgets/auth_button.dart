import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoo_feed/common/router/router.dart';

import '../../../common/utils/coloors.dart';
import '../bloc/auth_bloc.dart';

class CustomAuthButton extends StatelessWidget {
  final double? buttonWidth;
  final VoidCallback onPressed;
  final String text;
  final bool? isLoading;

  const CustomAuthButton(
      {Key? key,
      this.buttonWidth,
      required this.onPressed,
      required this.text,
      this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: buttonWidth ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Coloors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthStateComplete) {
              context.goNamed(Routes.home);
            }
          },
          builder: (context, state) {
            if (state is AuthStateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Text(text);
          },
        ),
      ),
    );
  }
}
