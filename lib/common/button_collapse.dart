import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:video_game_app/styleguide/colors.dart';

class ButtonCollapse extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  ButtonCollapse({this.onPressed, this.tooltip, this.icon});

  @override
  _ButtonCollapseState createState() => _ButtonCollapseState();
}

class _ButtonCollapseState extends State<ButtonCollapse>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _animationColor;
  Animation<Color> _animationColorIcon;
  Animation<Color> _animationColorSub;
  Animation<Color> _animationColorIconSub;
  Animation<double> _animationIcon;
  Animation<double> _translateButton;
  Animation<double> _elevationButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animationIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _elevationButton =
        Tween<double>(begin: 0.0, end: 5.0).animate(_animationController);
    _animationColor = ColorTween(begin: Colors.white, end: primaryColor)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.00, 1.00, curve: Curves.linear),
    ));
    _animationColorSub = ColorTween(begin: primaryColor, end: Colors.white)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.00, 1.00, curve: Curves.linear),
    ));
    _animationColorIconSub = ColorTween(begin: Colors.white, end: primaryColor)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.00, 1.00, curve: _curve),
    ));
    _animationColorIcon = ColorTween(begin: primaryColor, end: Colors.white)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.00, 1.00, curve: _curve),
    ));
    _translateButton = Tween<double>(begin: _fabHeight, end: -14.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 0.75, curve: _curve)));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _animatedButton() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget image() {
    return new Container(
      child: FloatingActionButton(
        backgroundColor: _animationColorSub.value,
        elevation: _elevationButton.value,
        onPressed: null,
        tooltip: 'Image',
        heroTag: 'image',
        child: Icon(
          Icons.image,
          color: _animationColorIconSub.value,
        ),
      ),
    );
  }

  Widget inbox() {
    return new Container(
      child: FloatingActionButton(
        backgroundColor: _animationColorSub.value,
        elevation: _elevationButton.value,
        onPressed: null,
        heroTag: 'inbox',
        tooltip: 'Inbox',
        child: Icon(
          Icons.inbox,
          color: _animationColorIconSub.value,
        ),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        onPressed: _animatedButton,
        tooltip: 'Toggle',
        heroTag: 'toggle',
        backgroundColor: _animationColor.value,
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animationIcon,
          color: _animationColorIcon.value,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, top: 10.0),
      child: Align(
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Transform(
                transform: Matrix4.translationValues(
                  _translateButton.value*2.0,
                 0.0,
                  0.0,
                ),
                child: image(),
              ),
              Transform(
                transform: Matrix4.translationValues(
                  _translateButton.value,
                  0.0,
                  0.0,
                ),
                child: inbox(),
              ),
              toggle(),
            ],
          )),
    );
  }
}
