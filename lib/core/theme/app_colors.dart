import 'package:flutter/material.dart';

class AppColors {
  static final Color primary = Color(0xFF10495A);

  static final Color secundary = Color(0xFF166276);
  static final Color tertiary = Color(0xFF0F8094);
  static final Color quaternary = Color(0xFF268CAF);
  static final Color ligth = Color(0xFFffffff);

  static final Color quinary = Color(0xFFD0C8C4);
  static final Color gold = Color(0xFFEAC289);
  static final Color contrastPrimary = Color(0xFF042a33);
  static final Color contrastSecundary = Color(0xFF063f4f);

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
