import 'package:dixit_go/models/user_model.dart';

class GameModel {
  String? roomId;
  late List<PlayerModel> players;
  late GameConfigModel config;

  GameModel({
    this.roomId = "",
    required this.players,
    required this.config,
  });

  GameModel.fromJson(Map<String, dynamic> json) {
    roomId = json['roomId'];
    if (json['players'] != null) {
      players = [];
      json['players'].forEach((v) {
        if (!(v is String)) {
          players.add(new PlayerModel.fromJson(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomId'] = this.roomId != null ? this.roomId : "";
    data['players'] = this.players.map((v) => v.toJson()).toList();
    return data;
  }
}

class PlayerModel extends UserModel {
  late int sorted;
  String? colorCard;

  PlayerModel({
    required this.sorted,
    this.colorCard = "",
  }) : super(
          name: '',
          username: '',
          email: '',
        );

  PlayerModel.fromJson(Map<String, dynamic> json)
      : super(
          name: json['name'],
          username: json['username'],
          email: json['email'],
        ) {
    sorted = json['sorted'];
    colorCard = json['colorCard'];
  }
}

class GameConfigModel {
  late final int minPlayers;
  late final int maxPlayers;

  GameConfigModel({
    this.minPlayers = 3,
    this.maxPlayers = 3,
  });
}
