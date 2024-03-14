import 'package:hive/hive.dart';
import 'package:nxtlevel/teams/team_model.dart';

class TeamDataAdapter extends TypeAdapter<TeamsData> {
  @override
  TeamsData read(BinaryReader reader) {
    return TeamsData(
        teamJerseyColor: reader.read(),
        teamName: reader.read(),
        conference: reader.read(),
        location: reader.read(),
        coachName: reader.read());
  }

  @override
  final typeId = 0;

  @override
  void write(BinaryWriter writer, TeamsData obj) {
    writer.write(obj.teamJerseyColor);
    writer.write(obj.teamName);
    writer.write(obj.conference);
    writer.write(obj.location);
    writer.write(obj.coachName);
  }
}
