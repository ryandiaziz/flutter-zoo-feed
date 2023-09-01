import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoo_feed/common/router/router.dart';
import 'package:zoo_feed/features/auth/bloc/auth_bloc.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Zoo Feed',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routerConfig: router,
      ),
    );
  }
}
