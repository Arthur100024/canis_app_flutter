import 'package:hive/hive.dart';

part 'client_hive_model.g.dart';

@HiveType(typeId: 0)
class ClientHiveModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String pet;

  ClientHiveModel({
    required this.name,
    required this.pet
    });
}


// var clientBox = Hive.box('clientBox');
// var client = clientBox.get('client1');