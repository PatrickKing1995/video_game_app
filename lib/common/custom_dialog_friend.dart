import 'package:flutter/material.dart';
import 'package:video_game_app/common/friend_details_widget.dart';
import 'package:video_game_app/model/friend.dart';
import 'package:video_game_app/styleguide/colors.dart';
import 'package:video_game_app/styleguide/text_styles.dart';

class CustomDialogFriend extends StatelessWidget {
  final Friend friend;

  CustomDialogFriend({this.friend});

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
//        Container(
//          padding: EdgeInsets.only(
//            top: Consts.avatarRadius + Consts.padding,
//            bottom: Consts.padding,
//            left: Consts.padding,
//            right: Consts.padding,
//          ),
//          margin: EdgeInsets.only(top: Consts.avatarRadius),
//          decoration: new BoxDecoration(
//            color: Colors.white,
//            shape: BoxShape.rectangle,
//            borderRadius: BorderRadius.circular(Consts.padding),
//            boxShadow: [
//              BoxShadow(
//                color: Colors.black26,
//                blurRadius: 10.0,
//                offset: const Offset(0.0, 10.0),
//              ),
//            ],
//          ),
//          child: Column(
//            mainAxisSize: MainAxisSize.min, // To make the card compact
//            children: <Widget>[
//              Text(
//                friend.name,
//                style: TextStyle(
//                  fontSize: 24.0,
//                  fontWeight: FontWeight.w700,
//                ),
//              ),
//              SizedBox(height: 16.0),
//              Text(
//                friend.status,
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                  fontSize: 16.0,
//                ),
//              ),
//              SizedBox(height: 24.0),
//              Align(
//                alignment: Alignment.bottomRight,
//                child: FlatButton(
//                  onPressed: () {
//                    Navigator.of(context).pop(); // To close the dialog
//                  },
//                  child: Text("Hi"),
//                ),
//              ),
//            ],
//          ),
//        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: FriendDetailsWidget(friend: friend),
        ),
        Hero(
          tag: friend.name,
          child: Container(
            height: 300.0,
            alignment: Alignment.topLeft,
            child: Stack(children: <Widget>[
              CircleAvatar(
                backgroundColor: primaryColor,
                radius: Consts.avatarRadius,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    child: Image.asset(
                      friend.avatarPath,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 90.0),
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color:
                        friend.status == "offline" ? Colors.amber : Colors.green,
                    border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 3.5)),
              ),
              Container(
                margin: EdgeInsets.only(left: 150.0),
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white),
                child: Center(
                    child: Text(
                  friend.countTopic,
                  style: rankBigStyle,
                )),
              ),
            ]),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Consts.padding)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 60.0;
}
