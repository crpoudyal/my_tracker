import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tracker/Home_page/home_page.dart';
import 'package:my_tracker/appwrite/appwrite.dart';
import 'package:my_tracker/features/login_screen/src/login_screen.dart';
import 'package:my_tracker/features/signup_screen/src/signup_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: [
    GoRoute(
      name: HomePage.name,
      path: '/',
      builder: (_, __) => const HomePage(),
    ),
    GoRoute(
        path: '/signup',
        name: SignupScreen.name,
        builder: (_, __) {
          return SignupScreen(onSignup: (name, email, password) async {
            debugPrint('$name - $email - $password');
            final appwrite = GetIt.instance.get<Appwrite>();
            final user = await appwrite.createAccount(name, email, password);
            debugPrint(jsonEncode(user?.toMap() ?? '{}'));
          });
        }),
        GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (_, __) {
        return LoginScreen(onLogin: (email, password) async {
          debugPrint('$email - $password');
          final appwrite = GetIt.instance.get<Appwrite>();
          final session = await appwrite.createEmailSession(email, password);
          debugPrint(jsonEncode(session?.toMap() ?? '{}'));
        });
      },
    ),
  ]);
});
