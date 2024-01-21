import 'package:minegociomenu/models/client_model.dart';

class PKTModel {
  int id;
  ClientModel emisor;
  ClientModel receptor;
  String preferences;

  PKTModel({
    required this.id,
    required this.emisor,
    required this.receptor,
    required this.preferences,
  });
}
