import 'package:video_game_app/model/topic.dart';

class Forum {
  final String title;
  final String imagePath;
  final String rank;
  final List<Topic> topics;
  final String threads;
  final String subs;

  Forum(
      {this.title,
      this.imagePath,
      this.rank,
      this.topics,
      this.threads,
      this.subs});
}

final fortniteForum = Forum(
    title: "Fortnite",
    imagePath: "assets/images/fortnite-avatar.png",
    rank: "31",
    threads: "88",
    subs: "500+",
    topics: fortniteTopics);

final pubgForum = Forum(
    title: "PUBG",
    imagePath: "assets/images/pubg.png",
    rank: "25",
    threads: "120",
    subs: "1000+",
    topics: pubgTopics);

final LOLForum = Forum(
    title: "LOL",
    imagePath: "assets/images/leagueoflegends.jpg",
    rank: "45",
    threads: "130",
    subs: "140+",
    topics: pubgTopics);

final pokemonGoForum = Forum(
    title: "Poke Go",
    imagePath: "assets/images/pokemon-go.png",
    rank: "21",
    threads: "450",
    subs: "1400+",
    topics: pubgTopics);

final forums = [fortniteForum, pubgForum, LOLForum, pokemonGoForum];
