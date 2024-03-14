import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nxtlevel/teams/players/player_model.dart';

class PlayerAddEdit extends StatefulWidget {
  final String teamName;
  const PlayerAddEdit({super.key, required this.teamName});

  @override
  State<PlayerAddEdit> createState() => _PlayerAddEditState();
}

class _PlayerAddEditState extends State<PlayerAddEdit> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late TextEditingController numberController;
  late TextEditingController teamNameController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController positionController;
  late TextEditingController yearController;
  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController eMailController;
  late Box<PlayersData> playersBox;
  bool myTeamSwitch = false;
  bool inactivePlayer = false;

  @override
  void initState() {
    super.initState();
    playersBox = Hive.box<PlayersData>('playerBox');
    numberController = TextEditingController();
    teamNameController = TextEditingController(text: widget.teamName);
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    positionController = TextEditingController();
    yearController = TextEditingController();
    heightController = TextEditingController();
    weightController = TextEditingController();
    eMailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const BeveledRectangleBorder(),
      insetPadding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
      elevation: 2.0,
      backgroundColor: Colors.brown[900],
      surfaceTintColor: Colors.brown[900],
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.65,
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        addPlayer();
                      }
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ),
                  const Text(
                    'Update Player Detail',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
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
                        width: 120,
                        height: 120,
                        child: bytes != null
                            ? Image.memory(bytes)
                            : const FlutterLogo(),
                      ),
                      const Text(
                        'Touch to change picture',
                        style: TextStyle(color: Colors.yellow),
                      )
                    ],
                  ),
                ),
                Form(
                  key: key,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Number:',
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    child: TextFormField(
                                      controller: numberController,
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                        labelStyle:
                                            TextStyle(color: Colors.yellow),
                                        enabledBorder: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      validator: (value) => null,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Starter:',
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      child: CupertinoSwitch(
                                          value: myTeamSwitch,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              myTeamSwitch = value!;
                                            });
                                          })),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Team:',
                                style: TextStyle(color: Colors.yellow),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: TextFormField(
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
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'First Name:',
                                style: TextStyle(color: Colors.yellow),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: TextFormField(
                                  controller: firstNameController,
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
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Last Name:',
                                style: TextStyle(color: Colors.yellow),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: TextFormField(
                                  controller: lastNameController,
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
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Position:',
                                style: TextStyle(color: Colors.yellow),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: TextFormField(
                                  controller: positionController,
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
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Year:',
                                style: TextStyle(color: Colors.yellow),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: TextFormField(
                                  controller: yearController,
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
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Height:',
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    child: TextFormField(
                                      controller: heightController,
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                        labelStyle:
                                            TextStyle(color: Colors.yellow),
                                        enabledBorder: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      validator: (value) => null,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Weight:',
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    child: TextFormField(
                                      controller: weightController,
                                      cursorColor: Colors.black,
                                      decoration: const InputDecoration(
                                        labelStyle:
                                            TextStyle(color: Colors.yellow),
                                        enabledBorder: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      validator: (value) => null,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'eMail Address:',
                                style: TextStyle(color: Colors.yellow),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: TextFormField(
                                  controller: eMailController,
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Starter',
                        style: TextStyle(color: Colors.white),
                      ),
                      CupertinoSwitch(
                          value: myTeamSwitch,
                          onChanged: (bool? value) {
                            setState(() {
                              myTeamSwitch = value!;
                            });
                          })
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Inactive',
                        style: TextStyle(color: Colors.white),
                      ),
                      CupertinoSwitch(
                          value: inactivePlayer,
                          onChanged: (bool? value) {
                            setState(() {
                              inactivePlayer = value!;
                            });
                          })
                    ],
                  ),
                  const Column(
                    children: [
                      Text('Total Points- 0',
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  const Column(
                    children: [
                      Text('Total Assists - 0',
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addPlayer() {
    final PlayersData playersData = PlayersData(
        jerseyNumber: numberController.text.toString(),
        firstName: firstNameController.text.toString(),
        lastName: lastNameController.text.toString(),
        position: positionController.text.toString(),
        year: yearController.text.toString(),
        height: heightController.text.toString(),
        weight: weightController.text.toString(),
        eMailAddress: eMailController.text.toString(),
        teamName: teamNameController.text.toString());

    playersBox.add(playersData);

    Navigator.of(context).pop();
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

  getColor(int selectedJerseyIndex) {}
}
