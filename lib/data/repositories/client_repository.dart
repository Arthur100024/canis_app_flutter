import 'package:flutter/foundation.dart';
import '../../data/Hive/client_hive_model.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ClientRepository {
  late Box<ClientHiveModel> _clients;

  Future<void> init() async {
    Hive.registerAdapter(ClientHiveModelAdapter());
    _clients = await Hive.openBox<ClientHiveModel>('clientBox');
  }

  List<ClientHiveModel> getClients(final String name) {
    final tasks = _clients.values.where((element) => element.name == name);
    return tasks.toList();
  }

  void addClient(final String name, final String pet) {
    _clients.add(ClientHiveModel(name: name, pet: pet));
  }

  Future<void> removeClient(final String name, final String pet) async {
    final taskToRemove = _clients.values
        .firstWhere((element) => element.name == name && element.pet == pet);
    await taskToRemove.delete();
  }

  Future<void> updateClient(final String name, final String pet) async {
    final taskToEdit = _clients.values
        .firstWhere((element) => element.name == name && element.pet == pet);
    final index = taskToEdit.key as int;
    await _clients.put(index, ClientHiveModel(name: name, pet: pet));
  }















// var clientBox = Hive.box('clientBox');
  //
  //
  // final List<ClientHiveModel> _clients = [clientBox.values.toList()];
  //
  // // List<ClientHiveModel> get clients => List.unmodifiable(_clients);
  //
  // void addClient(ClientHiveModel client) {
  //   _clients.add(client);
  // }
  //
  // void deleteClient(ClientHiveModel client) {
  //   _clients.remove(client);
  // }
  //
  // void getAllClients(ClientHiveModel client) {
  //   var allClients = clientBox.values;
  //
  //
  // }

}