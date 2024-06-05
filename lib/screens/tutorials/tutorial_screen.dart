import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiny_recognizer3/providers/app_color_provider.dart';
import 'package:tiny_recognizer3/providers/prediccion_provider.dart';
import 'package:tiny_recognizer3/screens/class/class_screen.dart';
import 'package:tiny_recognizer3/utils/app_color.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import 'package:shop_app/providers/providers.dart';
// import 'package:shop_app/components/init_app_bar.dart';
// import 'package:shop_app/utils/app_color.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class TutorialScreen extends ConsumerStatefulWidget {
  const TutorialScreen({super.key});

  static String routeName = "tutorial/";

  @override
  TutorialScreenState createState() => TutorialScreenState();
}

class TutorialScreenState extends ConsumerState<TutorialScreen> {

  final files = ["borrador.jpg","calculadora.jpg","sacapuntas.jpg","grapadora.jpg","lapiz.png" ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      child: Center(child: ListView(
      shrinkWrap: true,
      children: [
        Center(child: Text("Objetos", style: TextStyle(color: Colors.black,
          fontWeight: FontWeight.bold, fontSize: 30)),),
        SizedBox(height: 10),
        Center(child: Text("Aquí podrás encontrar los objetos detectables")),
        SizedBox(height: 20),
        Container(
          width: 500,
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Borrador" ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: Image.asset("assets/images/${files[0]}").image)
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text("Calculadora" ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: Image.asset("assets/images/${files[1]}").image)
                    ),
                  )
                ],
              )
            ]),
        ),
        Container(
          width: 500,
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Sacapuntas" ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: Image.asset("assets/images/${files[3]}").image)
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text("Calculadora" ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: Image.asset("assets/images/${files[2]}").image)
                    ),
                  )
                ],
              )
            ]),
        ),
        Container(
          width: 500,
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Lapiz" ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: Image.asset("assets/images/${files[4]}").image)
                    ),
                  )
                ],
              ),
            ]),
        )
      ],
    )));
  }
}
