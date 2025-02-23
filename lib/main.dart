import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiny_recognizer3/screens/init_screen.dart';
import 'routes.dart';
import 'theme.dart';

void main() {
  runApp(
    ProviderScope(child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mis Utiles',
      theme: AppTheme.lightTheme(context),
      initialRoute: InitScreen.routeName,
      routes: routes,
    );
  }
}