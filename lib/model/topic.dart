class Topic {
  final String question;
  final String recentAnswer;
  final String answerCount;

  Topic({this.question, this.recentAnswer, this.answerCount});
}

final fortniteTopics = [
  Topic(
      question: "Should we drop early?",
      recentAnswer:
          "I hear this question often, so I figured I'd start a thread. When I drop early it usually",
      answerCount: "1241"),
  Topic(
      question:
          "Changing background color of archive drop down on product page?",
      recentAnswer:
          "Has anyone identified a code that would allow me to change the background color and font color?",
      answerCount: "549")
];

final pubgTopics = [
  Topic(
      question: "Quitting FN because of this",
      recentAnswer:
          "Literally done with game until they balance the map better so that the blue corner",
      answerCount: "112"),
  Topic(
      question: "Code Injection to solve LinkedIn broken image issue",
      recentAnswer:
          "I need to add the following code to my Squarespace site to make the thumbnail image show up",
      answerCount: "445")
];
