import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nxtlevel/teams/team_add_edit.dart';
import 'package:nxtlevel/teams/team_model.dart';
import 'package:nxtlevel/teams/team_details.dart';

class TeamListing extends StatefulWidget {
  const TeamListing({super.key});

  @override
  State<TeamListing> createState() => _TeamListingState();
}

class _TeamListingState extends State<TeamListing> {
  late Box<TeamsData> teamsBox;
  @override
  void initState() {
    super.initState();
    teamsBox = Hive.box<TeamsData>('teamsBox');
  }

  Color getColor(int index) {
    switch (index) {
      case 0:
        return Colors.white;
      case 1:
        return Colors.red;
      case 2:
        return Colors.cyan;
      case 3:
        return Colors.purple;
      case 4:
        return Colors.green;
      case 5:
        return Colors.black;
      case 6:
        return Colors.grey;
      case 7:
        return Colors.orange;
      case 8:
        return Colors.yellow;
      case 9:
        return Colors.blue;

      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Teams',
            style: TextStyle(fontSize: 12, color: Colors.white)),
        centerTitle: true,
        leading: TextButton(
          onPressed: () {},
          child: const Text('Edit', style: TextStyle(color: Colors.yellow)),
        ),
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const TeamAddEdit(
                        listKey: null,
                      ));
            },
            child: const Text('Add team',
                style: TextStyle(
                  color: Colors.yellow,
                )),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: teamsBox.listenable(),
        builder: ((context, Box<TeamsData> box, child) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: DataTable(
                dividerThickness: 1.0,
                columns: [
                  DataColumn(
                    label: Text('Teams(${teamsBox.length})',
                        style: const TextStyle(color: Colors.yellow)),
                  ),
                  const DataColumn(
                    label: Text('Conference',
                        style: TextStyle(color: Colors.yellow)),
                  ),
                  const DataColumn(
                    label: Text('Location',
                        style: TextStyle(color: Colors.yellow)),
                  ),
                  const DataColumn(
                    label: Text(''),
                  ),
                ],
                rows: box.keys
                    .map((key) => DataRow(
                          cells: [
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TeamDetails(
                                              listKey: key,
                                              teamsData: box.get(key))));
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Image.asset(
                                        'images/team_jersey.png',
                                        width: 25,
                                        height: 25,
                                        color: getColor(
                                            box.get(key)!.teamJerseyColor),
                                      ),
                                    ),
                                    Text(box.get(key)!.teamName),
                                  ],
                                ),
                              ),
                            ),
                            DataCell(
                              Text(box.get(key)!.conference),
                            ),
                            DataCell(
                              Text(box.get(key)!.location),
                            ),
                            DataCell(
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => TeamAddEdit(
                                              listKey: key,
                                            ));
                                  },
                                  icon: const Icon(
                                    Icons.info_outline,
                                    color: Colors.yellow,
                                  )),
                            ),
                          ],
                        ))
                    .toList()),
          );
        }),
      ),
    );
  }
}
