import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../core/core.dart';

class UserModel {
  late String name;
  late String username;
  late String email;
  String? pathAvatar;
  String? urlAvatar;

  UserModel({
    required this.name,
    required this.username,
    required this.email,
    this.pathAvatar = "",
    this.urlAvatar = "",
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
    pathAvatar = json['pathAvatar'];
    urlAvatar = json['urlAvatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['pathAvatar'] = pathAvatar ?? "";
    data['urlAvatar'] = urlAvatar ?? "";
    return data;
  }

  String firstName() {
    if (name == '') return 'Indefinido';
    List<String> arrString = name.split(" ");
    return arrString.first != '' ? arrString.first : "Indefinido";
  }

  ImageProvider<Object> getAvatar() {
    if (urlAvatar != null && urlAvatar != '') {
      return FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: urlAvatar ?? '',
      ).image;
    }
    return AssetImage(AppImages().getAvatar(pathAvatar ?? ''));
  }
}
