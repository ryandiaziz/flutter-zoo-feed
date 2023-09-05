import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'common/bloc/theme/theme_bloc.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/home/bloc/user/user_bloc.dart';

void main() {
  runApp(
    const AppProvider(),
  );
}

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: const MyApp(),
    );
  }
}
