import 'dart:typed_data';

class Prediccion {
  final Uint8List image;
  final List<dynamic> annotations;

  Prediccion({required this.image, required this.annotations});
}
