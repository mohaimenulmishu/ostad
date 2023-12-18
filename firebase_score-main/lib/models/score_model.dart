class ScoreModel {
  String id;
  String teamAName;
  String teamBName;
  int teamAScore;
  int teamBScore;
  double totalTime;
  double spendTime;

  ScoreModel({
    required this.id,
    required this.teamAName,
    required this.teamBName,
    required this.teamAScore,
    required this.teamBScore,
    required this.totalTime,
    required this.spendTime,
  });
}
