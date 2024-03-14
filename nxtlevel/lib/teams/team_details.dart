import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nxtlevel/teams/players/player_add_edit.dart';
import 'package:nxtlevel/teams/players/player_details.dart';
import 'package:nxtlevel/teams/players/player_model.dart';
import 'package:nxtlevel/teams/team_model.dart';

class TeamDetails extends StatefulWidget {
  final dynamic listKey;
  final TeamsData? teamsData;

  const TeamDetails({super.key, this.listKey, this.teamsData});

  @override
  State<TeamDetails> createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late TextEditingController teamNameController;
  late TextEditingController coachNameController;
  late TextEditingController conferenceController;
  late TextEditingController locationController;
  late Box<PlayersData> playersBox;

  @override
  void initState() {
    super.initState();
    playersBox = Hive.box<PlayersData>('playerBox');

    teamNameController =
        TextEditingController(text: widget.teamsData!.teamName);
    coachNameController =
        TextEditingController(text: widget.teamsData!.coachName);
    conferenceController =
        TextEditingController(text: widget.teamsData!.conference);
    locationController =
        TextEditingController(text: widget.teamsData!.location);
  }

  bool myTeamSwitch = false;
  int selectedJerseyIndex = 0;
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.yellow),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Ballers',
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) =>
                      PlayerAddEdit(teamName: widget.teamsData!.teamName));
            },
            child: const Text('Add Players',
                style: TextStyle(color: Colors.yellow)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Card(
            color: Colors.black,
            shape: const BeveledRectangleBorder(),
            elevation: 2.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    pickImage();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.width * 0.1,
                        child: bytes != null && bytes.isNotEmpty
                            ? Image.memory(bytes)
                            : Image.asset(
                                'images/basketball.jpg',
                              ),
                      ),
                      const Text(
                        'Touch to change',
                        style: TextStyle(color: Colors.yellow),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    children: [
                      Expanded(
                        child: Form(
                          key: key,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Team',
                                style: TextStyle(color: Colors.yellow),
                              ),
                              TextFormField(
                                controller: teamNameController,
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(color: Colors.yellow),
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                validator: (value) => null,
                              ),
                              const Text(
                                'Coach',
                                style: TextStyle(color: Colors.yellow),
                              ),
                              TextFormField(
                                controller: coachNameController,
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(),
                                  labelStyle: TextStyle(color: Colors.yellow),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                validator: (value) => null,
                              ),
                              const Text(
                                'Conference',
                                style: TextStyle(color: Colors.yellow),
                              ),
                              TextFormField(
                                controller: conferenceController,
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(),
                                  labelStyle: TextStyle(color: Colors.yellow),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                validator: (value) => null,
                              ),
                              const Text(
                                'Location',
                                style: TextStyle(color: Colors.yellow),
                              ),
                              TextFormField(
                                controller: locationController,
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(),
                                  labelStyle: TextStyle(color: Colors.yellow),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                validator: (value) => null,
                              ),
                              const Text('Jersey:',
                                  style: TextStyle(color: Colors.yellow)),
                              GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 10,
                                  ),
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedJerseyIndex = index;
                                        });
                                      },
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        child: Stack(
                                          children: [
                                            selectedJerseyIndex == index
                                                ? bytes != null
                                                    ? Center(
                                                        child:
                                                            Image.memory(bytes))
                                                    : Center(
                                                        child: Image.asset(
                                                          'images/basketball.jpg',
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.05,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                        ),
                                                      )
                                                : const SizedBox.shrink(),
                                            Center(
                                              child: Image.asset(
                                                'images/team_jersey.png',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.03,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.08,
                                                color: getColor(index),
                                              ),
                                            ),
                                            const Center(
                                              child: Text(
                                                '23',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      'My Team',
                      style: TextStyle(color: Colors.yellow),
                    ),
                    CupertinoSwitch(
                        value: myTeamSwitch,
                        onChanged: (bool? value) {
                          setState(() {
                            myTeamSwitch = value!;
                          });
                        })
                  ],
                )
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable: playersBox.listenable(),
            builder: ((context, Box<PlayersData> box, child) {
              final List<PlayersData> teamPlayers = box.values
                  .where(
                      (player) => player.teamName == widget.teamsData!.teamName)
                  .toList();
              if (box.isEmpty) {
                return const SizedBox.shrink();
              } else {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15.0),
                  child: DataTable(
                    dividerThickness: 1.0,
                    columns: const [
                      DataColumn(
                        label: Text(''),
                      ),
                      DataColumn(
                        label: Text(''),
                      ),
                      DataColumn(
                        label: Text(''),
                      ),
                      DataColumn(
                        label: Text(''),
                      ),
                      DataColumn(
                        label: Text(''),
                      ),
                      DataColumn(
                        label: Text(''),
                      ),
                      DataColumn(
                        label: Text(''),
                      ),
                      DataColumn(
                        label: Text(''),
                      ),
                      DataColumn(
                        label: Text(''),
                      ),
                    ],
                    rows: teamPlayers.map<DataRow>((key) {
                      return DataRow(
                        cells: [
                          DataCell(Text(
                            key.jerseyNumber,
                            style: const TextStyle(color: Colors.white),
                          )),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image.asset(
                                'images/team_jersey.png',
                                width: 25,
                                height: 25,
                                color:
                                    getColor(widget.teamsData!.teamJerseyColor),
                              ),
                            ),
                          ),
                          DataCell(
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PlayerDetails(playersData: key)));
                              },
                              child: Text(
                                "${key.firstName} ${key.lastName}",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          DataCell(CupertinoSwitch(
                              value: false, onChanged: (bool? value) {})),
                          DataCell(CupertinoSwitch(
                              value: false, onChanged: (bool? value) {})),
                          const DataCell(Text('Total Points - 0',
                              style: TextStyle(color: Colors.white))),
                          const DataCell(Text('Total Assists - 0',
                              style: TextStyle(color: Colors.white))),
                          const DataCell(Text('Total Rebounds - 0',
                              style: TextStyle(color: Colors.white))),
                          DataCell(
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.info_outline,
                                  color: Colors.yellow,
                                )),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              }
            }),
          ),
        ]),
      ),
    );
  }

  dynamic bytes;

  Future pickImage() async {
    try {
      final imagePicker = ImagePicker();
      final selectedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      final readByte = await selectedImage!.readAsBytes();
      setState(() {
        if (readByte.isNotEmpty) {
          bytes = readByte;
        }
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
