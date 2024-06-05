import 'package:flutter/material.dart';
import 'package:tiny_recognizer3/screens/class/class_screen.dart';
import 'package:tiny_recognizer3/screens/home/home_screen.dart';
import 'package:tiny_recognizer3/screens/init_screen.dart';
import 'package:tiny_recognizer3/screens/tutorials/tutorial_screen.dart';

final Map<String, WidgetBuilder> routes = {
  InitScreen.routeName: (context) => const InitScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ClassScreen.routeName: (context) => const ClassScreen(),
  TutorialScreen.routeName: (context) => const TutorialScreen(),
};
