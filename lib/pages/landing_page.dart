import 'package:flutter/material.dart';
import 'package:video_game_app/common/app_background.dart';
import 'package:video_game_app/common/button_collapse.dart';
import 'package:video_game_app/common/friends_status.dart';
import 'package:video_game_app/common/horizontal_tab_layout.dart';
import 'package:video_game_app/styleguide/colors.dart';
import 'package:video_game_app/styleguide/text_styles.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstColor: firstCircleColor,
            secondColor: secondCircleColor,
            thirdColor: thirdCircleColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              ButtonCollapse(),
              HeadingSubHeadingWidget(),
//              SizedBox(
//                height: 20.0,
//              ),
              HorizontalTabLayout(),
              FriendsStatus(),
//              Spacer(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 85.0, vertical: 20.0),
                    child: Text(
                      "New Topic",
                      style: buttonStyle,
                    ),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(40.0))),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class HeadingSubHeadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Forum",
            style: headingStyle,
          ),
          Text(
            "Kick of the conversations",
            style: subHeadingStyle,
          )
        ],
      ),
    );
  }
}
