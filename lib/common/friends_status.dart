import 'package:flutter/material.dart';
import 'package:video_game_app/model/friend.dart';
import 'package:video_game_app/styleguide/colors.dart';
import 'package:video_game_app/styleguide/text_styles.dart';

class FriendsStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Friends",
            style: headingStyle,
          ),
          Container(
            height: 100.0,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
              },
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _listFriends(),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _listFriends() {
    return [
      ThumbnailFriend(
        friend: Tina,
      ),
      ThumbnailFriend(
        friend: Kiki,
      ),
      ThumbnailFriend(
        friend: Martin,
      ),
      ThumbnailFriend(
        friend: Nancy,
      ),
      ThumbnailFriend(
        friend: Patrick,
      ),
      ThumbnailFriend(
        friend: Ryen,
      ),
    ];
  }
}

class ThumbnailFriend extends StatelessWidget {
  final Friend friend;

  ThumbnailFriend({this.friend});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: FloatingActionButton(
          heroTag: friend.name,
          backgroundColor:
              friend.status == "online" ? primaryColor : Colors.white,
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              child: Image.asset(
                friend.avatarPath,
                fit: BoxFit.fill,
              ),
            ),
          )),
    );
  }
}
