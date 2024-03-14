import 'package:hive/hive.dart';
import 'package:nxtlevel/teams/players/player_model.dart';

class PlayerDataAdapter extends TypeAdapter<PlayersData> {
  @override
  PlayersData read(BinaryReader reader) {
    return PlayersData(
        jerseyNumber: reader.read(),
        teamName: reader.read(),
        firstName: reader.read(),
        lastName: reader.read(),
        position: reader.read(),
        year: reader.read(),
        height: reader.read(),
        weight: reader.read(),
        eMailAddress: reader.read());
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, PlayersData obj) {
    writer.write(obj.jerseyNumber);
    writer.write(obj.teamName);
    writer.write(obj.firstName);
    writer.write(obj.lastName);
    writer.write(obj.position);
    writer.write(obj.year);
    writer.write(obj.height);
    writer.write(obj.weight);
    writer.write(obj.eMailAddress);
  }
}
