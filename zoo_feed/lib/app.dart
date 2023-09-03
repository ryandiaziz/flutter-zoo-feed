import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/router/router.dart';
import 'common/themes/cubit/theme_cubit.dart';
import 'common/themes/dark_theme.dart';
import 'common/themes/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Zoo Feed',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: state ? ThemeMode.light : ThemeMode.dark,
          routerConfig: router,
        );
      },
    );
  }
}
