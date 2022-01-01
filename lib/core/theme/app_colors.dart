import 'package:flutter/material.dart';

class AppColors {
  static final Color primary = Color(0xFFE58888);
  static final Color secundary = Color(0xFFF1A382);
  static final Color tertiary = Color(0xFFffffff);
  static final Color quaternary = Color(0xFFB5AAA7);
  static final Color quinary = Color(0xFFD0C8C4);
  static final Color gold = Color(0xFFEAC289);
  static final Color contrastPrimary = Color(0xFF5A3B6F);
  static final Color contrastSecundary = Color(0xFF775089);

  static final Color danger = Colors.red.shade400;

  static final ColorModel cardColor1 = new ColorModel(
    name: "AMARELO",
    color: Colors.yellow,
    colorText: Colors.black,
    pin: "assets/images/pin/amarelo.png",
  );
  static final ColorModel cardColor2 = new ColorModel(
    name: "AZUL",
    color: Colors.blue,
    colorText: Colors.white,
    pin: "assets/images/pin/azul.png",
  );
  static final ColorModel cardColor3 = new ColorModel(
    name: "VERMELHO",
    color: Colors.red,
    colorText: Colors.white,
    pin: "assets/images/pin/vermelho.png",
  );
  static final ColorModel cardColor4 = new ColorModel(
    name: "LARANJA",
    color: Colors.orange,
    colorText: Colors.black,
    pin: "assets/images/pin/laranja.png",
  );
  static final ColorModel cardColor5 = new ColorModel(
    name: "VERDE",
    color: Colors.green,
    colorText: Colors.white,
    pin: "assets/images/pin/green.png",
  );
  static final ColorModel cardColor6 = new ColorModel(
    name: "MARROM",
    color: Colors.brown,
    colorText: Colors.white,
    pin: "assets/images/pin/marrom.png",
  );

  ColorModel getColor(String name) {
    switch (name) {
      case 'cardColor1':
        return cardColor1;
      case 'cardColor2':
        return cardColor2;
      case 'cardColor3':
        return cardColor3;
      case 'cardColor4':
        return cardColor4;
      case 'cardColor5':
        return cardColor5;
      case 'cardColor6':
        return cardColor6;
      default:
        return new ColorModel(
          name: "PADRÃO",
          color: contrastSecundary,
          colorText: Colors.white,
          pin: "assets/images/pin/padrao.png",
        );
    }
  }
}

class ColorModel {
  late final String name;
  late final Color color;
  late final Color colorText;
  late final String pin;
  ColorModel({
    required this.name,
    required this.color,
    required this.colorText,
    required this.pin,
  });
}
