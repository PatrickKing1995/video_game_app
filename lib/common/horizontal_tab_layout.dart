import 'package:flutter/material.dart';
import 'package:video_game_app/common/forum_card.dart';
import 'package:video_game_app/common/tab_text.dart';
import 'package:video_game_app/model/forum.dart';

class HorizontalTabLayout extends StatefulWidget {
  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout>
    with SingleTickerProviderStateMixin {
  int selectedTabIndex = 2;
  AnimationController _controller;
  Animation<Offset> _animation;
  Animation<double> _fadeAnimation;
  ScrollController _scrollController;
  GlobalKey _keyListView = GlobalKey();

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {}
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {}
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(-0.05, 0))
        .animate(_controller);
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  _getSizes() {
    final RenderBox renderBoxRed =
        _keyListView.currentContext.findRenderObject();
    final sizeListView = renderBoxRed.size;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: -20,
            bottom: 0,
            top: 0,
            width: 110.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TabText(
                    text: "Media",
                    isSelected: selectedTabIndex == 0,
                    onTabTap: () {
                      onTabTap(0);
                    },
                  ),
                  TabText(
                    text: "Streamers",
                    isSelected: selectedTabIndex == 1,
                    onTabTap: () {
                      onTabTap(1);
                    },
                  ),
                  TabText(
                    text: "Forum",
                    isSelected: selectedTabIndex == 2,
                    onTabTap: () {
                      onTabTap(2);
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 65.0),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
              },
              child: FutureBuilder(
                future: playAnimation(),
                builder: (context, snapshot) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: ListView(
                      key: _keyListView,
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      children: getList(selectedTabIndex),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getList(index) {
    return [
      [
        SlideTransition(
            position: _animation, child: ForumCard(forum: pubgForum)),
        SlideTransition(
            position: _animation, child: ForumCard(forum: pokemonGoForum)),
      ],
      [
        SlideTransition(
            position: _animation, child: ForumCard(forum: LOLForum)),
        SlideTransition(
            position: _animation, child: ForumCard(forum: fortniteForum)),
      ],
      [
        SlideTransition(
            position: _animation, child: ForumCard(forum: fortniteForum)),
        SlideTransition(
            position: _animation, child: ForumCard(forum: pubgForum)),
      ],
    ][index];
  }

  _moveUp() {
    _scrollController.animateTo(_scrollController.offset - forums.length * 280,
        curve: Curves.linear, duration: Duration(milliseconds: 2));
  }

  onTabTap(int index) {
    setState(() {
      selectedTabIndex = index;
    });
//    _getSizes();
    _moveUp();
  }
}
