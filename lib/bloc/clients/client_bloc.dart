import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../../data/Hive/client_hive_model.dart';
import '../../data/repositories/client_repository.dart';

part 'client_state.dart';
part 'client_event.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final ClientRepository _clientRepository;

  ClientBloc(this._clientRepository) : super(ClientsInitial()) {

    on<LoadClientsEvent>((event, emit) {
      final List<ClientHiveModel> names = _clientRepository.getClients(event.name);
      final List<ClientHiveModel> pets = _clientRepository.getClients(event.pet);
      emit(ClientsLoadedState(
        names,
        pets,
      ));
    });

    on<AddClientEvent>((event, emit) async {
      final currentState = state as ClientsLoadedState;
      _clientRepository.addClient(event.name, event.pet);
      add(LoadClientsEvent(event.name, event.pet));
    });

    on<ToggleClientEvent>((event, emit) async {
      final currentState = state as ClientsLoadedState;
      await _clientRepository.updateClient(event.name, event.pet);
      add(LoadClientsEvent(event.name, event.pet));
    });
  }
}