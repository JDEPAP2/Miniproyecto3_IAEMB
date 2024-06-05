import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiny_recognizer3/providers/app_color_provider.dart';
import 'package:tiny_recognizer3/providers/prediccion_provider.dart';
import 'package:tiny_recognizer3/screens/class/class_screen.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static String routeName = "home/";

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  String url = "http://192.168.167.77";
  final controller = TextEditingController(text: "http://192.168.167.77");

  @override
  Widget build(BuildContext context) {
    final appColor = ref.watch(appColorProvider);
    controller.selection = TextSelection.collapsed(offset: url.length);
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Text(
              "Mis útiles",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 100),
          Center(
            child: Icon(Icons.edit, size: 120,)
          ),
          SizedBox(height: 100),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.05)
            ),
            height: 60,
            width: 200,
            child: TextField(
                cursorColor: Colors.black,
                controller: controller,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: "http://192.168.167.77"
                ),
                onChanged: (value) =>  setState(() {
                  controller.value = TextEditingValue(text: value);
                  url = value;
                })
              ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
              onPressed: () {
                ref.read(prediccionProvider.notifier).fetchData(url: url);
                log(controller.text);
                Navigator.pushNamed(context, ClassScreen.routeName);
              },
              child: Text('Escanear'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            ),
          ),
        ],
      )
    );
  }
}
