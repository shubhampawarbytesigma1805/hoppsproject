import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nxtlevel/teams/players/player_model.dart';

class PlayerDetails extends StatefulWidget {
  final PlayersData? playersData;
  const PlayerDetails({super.key, required this.playersData});

  @override
  State<PlayerDetails> createState() => _PlayerDetailsState();
}

class _PlayerDetailsState extends State<PlayerDetails> {
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
              onPressed: () {},
              child: const Text('Next Player',
                  style: TextStyle(color: Colors.yellow)),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PlayerPersonalDetails(playersData: widget.playersData),
            ],
          ),
        ));
  }
}

class PlayerPersonalDetails extends StatefulWidget {
  final PlayersData? playersData;
  const PlayerPersonalDetails({
    super.key,
    required this.playersData,
  });

  @override
  State<PlayerPersonalDetails> createState() => _PlayerPersonalDetailsState();
}

class _PlayerPersonalDetailsState extends State<PlayerPersonalDetails> {
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

  bool myTeamSwitch = false;

  @override
  void initState() {
    super.initState();
    numberController =
        TextEditingController(text: widget.playersData!.jerseyNumber);
    teamNameController =
        TextEditingController(text: widget.playersData!.teamName);
    firstNameController =
        TextEditingController(text: widget.playersData!.firstName);
    lastNameController =
        TextEditingController(text: widget.playersData!.lastName);
    positionController =
        TextEditingController(text: widget.playersData!.position);
    yearController = TextEditingController(text: widget.playersData!.year);
    heightController = TextEditingController(text: widget.playersData!.height);
    weightController = TextEditingController(text: widget.playersData!.weight);
    eMailController =
        TextEditingController(text: widget.playersData!.eMailAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
                child:
                    bytes != null ? Image.memory(bytes) : const FlutterLogo(),
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
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: TextFormField(
                              controller: numberController,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Starter:',
                            style: TextStyle(color: Colors.yellow),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.height * 0.07,
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
                        height: MediaQuery.of(context).size.height * 0.07,
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
                        height: MediaQuery.of(context).size.height * 0.07,
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
                        height: MediaQuery.of(context).size.height * 0.07,
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
                        height: MediaQuery.of(context).size.height * 0.07,
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
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: TextFormField(
                              controller: heightController,
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
                            'Weight:',
                            style: TextStyle(color: Colors.yellow),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: TextFormField(
                              controller: weightController,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'eMail Address:',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.07,
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
      // ignore: avoid_pri nt
      print(e);
    }
  }
}
