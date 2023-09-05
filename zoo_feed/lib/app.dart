import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoo_feed/common/themes/bloc/theme_bloc.dart';

import 'common/router/router.dart';
import 'common/themes/dark_theme.dart';
import 'common/themes/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Zoo Feed',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: state.mode,
          routerConfig: router,
        );
      },
    );
  }
}
