import 'package:flutter/material.dart';
import 'package:video_game_app/common/app_background.dart';
import 'package:video_game_app/common/label_value_widget.dart';
import 'package:video_game_app/model/forum.dart';
import 'package:video_game_app/styleguide/colors.dart';
import 'package:video_game_app/styleguide/text_styles.dart';

class DetailsPage extends StatelessWidget {
  final Forum forum;

  DetailsPage({this.forum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstColor: firstOrangeCircleColor,
            secondColor: secondOrangeCircleColor,
            thirdColor: thirdOrangeCircleColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 100.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    LabelValueWidget(
                      value: forum.topics.length.toString(),
                      label: "topics",
                      labelStyle: whiteLabelTextStyle,
                      valueStyle: whiteValueTextStyle,
                    ),
                    LabelValueWidget(
                      value: forum.threads,
                      label: "threads",
                      labelStyle: whiteLabelTextStyle,
                      valueStyle: whiteValueTextStyle,
                    ),
                    LabelValueWidget(
                      value: forum.subs,
                      label: "subs",
                      labelStyle: whiteLabelTextStyle,
                      valueStyle: whiteValueTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              ClipRRect(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60.0)),
                  child: Image.asset(forum.imagePath)),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0)),
              child: Container(
                height: 250.0,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 210.0,
            right: 30.0,
            child: Material(
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(forum.rank, style: rankBigStyle,)
              ),
              color: Colors.white,
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
