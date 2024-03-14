import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class TeamsData {
  int teamJerseyColor;
  String teamName;
  String conference;
  String location;
  String coachName;
  TeamsData({
    required this.teamJerseyColor,
    required this.teamName,
    required this.conference,
    required this.location,
    required this.coachName,
  });
}
