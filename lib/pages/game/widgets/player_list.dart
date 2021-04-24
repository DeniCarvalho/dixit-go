import 'package:dixit_go/models/game_model.dart';
import 'package:dixit_go/pages/game/widgets/player_empty_widget.dart';
import 'package:flutter/material.dart';

class PlayerList extends StatefulWidget {
  final List<PlayerModel> players;
  PlayerList({
    required this.players,
  });
  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  List<PlayerModel> mountedList() {
    List<PlayerModel> _list = [];
    for (var i = 0; i < widget.players.length; i++) {
      if (!_list.any((p) => p.email == widget.players[i].email)) {
        _list.add(widget.players[i]);
      }
    }
    for (var i = 0; i < (6 - widget.players.length); i++) {
      _list.add(
        new PlayerModel(sorted: 0),
      );
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 320) / 2;
    final double itemWidth = size.width / 2;

    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        physics: BouncingScrollPhysics(),
        childAspectRatio: (itemWidth / itemHeight),
        children: List.generate(mountedList().length, (index) {
          return Center(
            child: PlayerEmptyWidget(
              index: index,
              user: mountedList()[index].sorted != 0
                  ? mountedList()[index]
                  : null,
            ),
          );
        }),
      ),
    );
  }
}
