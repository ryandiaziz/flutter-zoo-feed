import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoo_feed/common/themes/cubit/theme_cubit.dart';

import 'features/auth/bloc/auth_bloc.dart';
import 'app.dart';

void main() {
  runApp(
    const Provider(),
  );
}

class Provider extends StatelessWidget {
  const Provider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: const MyApp(),
    );
  }
}
