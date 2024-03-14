import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nxtlevel/teams/players/player_adapter.dart';
import 'package:nxtlevel/teams/players/player_model.dart';
import 'package:nxtlevel/teams/team_adapter.dart';
import 'package:nxtlevel/teams/team_model.dart';
import 'package:nxtlevel/teams/team_listing.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TeamDataAdapter());
  await Hive.openBox<TeamsData>('teamsBox');
  Hive.registerAdapter(PlayerDataAdapter());
  await Hive.openBox<PlayersData>('playerBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nxt Level',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.light(),
      themeMode: ThemeMode.light,
      home: const TeamListing(),
    );
  }
}
