import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:tiny_recognizer3/utils/prediccion.dart';


final prediccionProvider = StateNotifierProvider<PrediccionProvider, AsyncValue<Prediccion?>>(
  (ref) => PrediccionProvider(ref: ref),
);

class PrediccionProvider extends StateNotifier<AsyncValue<Prediccion?>> {
  final StateNotifierProviderRef<PrediccionProvider, AsyncValue<Prediccion?>> ref;
  Timer? _discoveryTimer;

  PrediccionProvider({required this.ref})
      : super(const AsyncData(null));


  void stopRead(){
    _discoveryTimer?.cancel();
  }

  Future<void> fetchData({String url = "https://192.168.143.77"}) async {
    _discoveryTimer = Timer.periodic(Duration(milliseconds: 200), (Timer t) async {
    try {
      log(url);
      final response = await http.get(Uri.parse(url+"/capture"));
      log(response.headers.toString());
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final annotations = data['objects'] as List<dynamic>;
        final prediccion = Prediccion(image: base64.decode(data['image'].toString()), annotations: annotations);
        state = AsyncData(prediccion);
      } else {
        log('Failed to fetch data from URL: $url (Status code: ${response.statusCode})');
      }
    } catch (error) {
      log(error.toString());
      state = const AsyncData(null);
    }
    });
    
  }
}

// // Usage
// final prediccion = ref.watch(prediccionProvider);

// if (prediccion.asData?.value != null) {
//   final imageBase64 = prediccion.value!.imageBase64;
//   final annotations = prediccion.value!.annotations;
//   // Process the image and annotations
// } else if (prediccion.hasError) {
//   // Handle error
// } else {
//   // Handle loading state
// }
