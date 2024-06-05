import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiny_recognizer3/providers/app_color_provider.dart';
import 'package:tiny_recognizer3/providers/prediccion_provider.dart';
import 'package:tiny_recognizer3/utils/app_color.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class ClassScreen extends ConsumerStatefulWidget {
  const ClassScreen({super.key});

  static String routeName = "class/";

  @override
  _ClassScreenState createState() => _ClassScreenState();
}

class _ClassScreenState extends ConsumerState<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    final prediccion = ref.watch(prediccionProvider);
    final appColor = ref.watch(appColorProvider);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: appColor.gradient,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),

              // Image widget
              prediccion.when(
                data: (data){
                  if(data != null){
                    return Container(
                      width: 320,
                      height: 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: MemoryImage(Uint8List.fromList(data.image)), fit: BoxFit.fill)
                      ),
                      child: Stack(
                        children: data.annotations.map<Widget>((e){
                          var em = e as Map<String, dynamic>;
                          return Positioned(
                            top: em["y"] * 3.33,
                            left: em["x"] * 2.5,
                            child: Container(
                              color: Colors.red.withOpacity(0.2),
                              width: em["width"] * 3.33,
                              height: em["height"] * 2.5,
                            )
                            );
                          }).toList(),
                      ),
                    );
                  }else{
                    return SizedBox.shrink();
                  }
                },
                error: (error, stackTrace) => Text('Error: $error'),
                loading: () => CircularProgressIndicator(
                  color: appColor.getContrastColor(),
                ),
              ),
              SizedBox(height: 20),

              // Annotations (if available)
              Center(
                child: Container(
                height: 400,
                child: prediccion.when(
                data: (data) => data?.annotations != null
                    ? ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(height: 20),
                      itemBuilder: (context, index) => Text("{ ${data?.annotations[index]["label"]} : ${data?.annotations[index]["value"]} }",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      itemCount: data?.annotations.length??0,
                    )
                    : SizedBox.shrink(),
                error: (error, stackTrace) => SizedBox.shrink(),
                loading: () => SizedBox.shrink(),
              )),
              ),
              // Salir button
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: appColor.getContrastColor(),
                  ),
                  child: Text(
                    "Salir",
                    style: TextStyle(
                      color: appColor.secondary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onTap: () {
                  ref.read(prediccionProvider.notifier).stopRead();
                  Navigator.of(context).maybePop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
