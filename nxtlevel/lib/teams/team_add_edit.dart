import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nxtlevel/teams/team_model.dart';

class TeamAddEdit extends StatefulWidget {
  final dynamic listKey;
  const TeamAddEdit({super.key, required this.listKey});

  @override
  State<TeamAddEdit> createState() => _TeamAddEditState();
}

class _TeamAddEditState extends State<TeamAddEdit> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController teamNameController =
      TextEditingController(text: '** New Team');
  TextEditingController coachNameController = TextEditingController();
  TextEditingController conferenceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
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

  late Box<TeamsData> teamsBox;

  @override
  void initState() {
    super.initState();
    teamsBox = Hive.box<TeamsData>('teamsBox');
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const BeveledRectangleBorder(),
      insetPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.03, horizontal: 15),
      elevation: 2.0,
      backgroundColor: Colors.brown[900],
      surfaceTintColor: Colors.brown[900],
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  backgroundBlendMode: BlendMode.hardLight,
                  color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        addTeam();
                      }
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ),
                  Text(
                    'Update Team Detail',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.04),
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
                Form(
                  key: key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Team',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.07,
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
                      const Text(
                        'Coach',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: TextFormField(
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
                      ),
                      const Text(
                        'Conference',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: TextFormField(
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
                      ),
                      const Text(
                        'Location',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: TextFormField(
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
            const SizedBox(
              height: 10,
            ),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      width: MediaQuery.of(context).size.width * 0.06,
                      child: Stack(
                        children: [
                          selectedJerseyIndex == index
                              ? bytes != null
                                  ? Center(child: Image.memory(bytes))
                                  : Center(
                                      child: Image.asset(
                                        'images/basketball.jpg',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                      ),
                                    )
                              : const SizedBox.shrink(),
                          Center(
                            child: Image.asset(
                              'images/team_jersey.png',
                              width: MediaQuery.of(context).size.width * 0.04,
                              height: MediaQuery.of(context).size.height * 0.08,
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
                })
          ],
        ),
      ),
    );
  }

  void addTeam() {
    final TeamsData teamsData = TeamsData(
        teamName: teamNameController.text.toString(),
        coachName: coachNameController.text.toString(),
        conference: conferenceController.text.toString(),
        location: locationController.text.toString(),
        teamJerseyColor: selectedJerseyIndex);

    if (widget.listKey != null) {
      teamsBox.put(widget.listKey, teamsData);
    } else {
      teamsBox.add(teamsData);
    }
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
}
