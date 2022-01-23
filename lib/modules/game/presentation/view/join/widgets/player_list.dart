import 'package:flutter/material.dart';

import '../../../../../../models/game_model.dart';
import 'player_empty_widget.dart';

class PlayerList extends StatefulWidget {
  final List<PlayerModel> players;
  const PlayerList({
    Key? key,
    required this.players,
  }) : super(key: key);
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
        PlayerModel(sorted: 0),
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
        physics: const BouncingScrollPhysics(),
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
