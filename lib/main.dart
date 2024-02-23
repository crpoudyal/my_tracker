import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tracker/dependencies.dart';
import 'package:my_tracker/router/router.dart';

void main() {
  initDependencies();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final router = ref.watch(routerProvider);
      return MaterialApp.router(
        routerConfig: router,
      );
    });
  }
}
