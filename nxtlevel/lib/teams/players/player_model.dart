// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class PlayersData {
  String jerseyNumber;
  String teamName;
  String firstName;
  String lastName;
  String position;
  String year;
  String height;
  String weight;
  String eMailAddress;
  PlayersData({
    required this.jerseyNumber,
    required this.teamName,
    required this.firstName,
    required this.lastName,
    required this.position,
    required this.year,
    required this.height,
    required this.weight,
    required this.eMailAddress,
  });
}
