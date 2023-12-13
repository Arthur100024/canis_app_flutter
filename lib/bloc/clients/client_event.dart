part of 'client_bloc.dart';

abstract class ClientEvent extends Equatable{
  const ClientEvent();
}

class LoadClientsEvent extends ClientEvent {
  final String name;
  final String pet;

  LoadClientsEvent(this.name, this.pet);

  @override
  List<Object?> get props => [name, pet];
}

class AddClientEvent extends ClientEvent {
  final String name;
  final String pet;


  AddClientEvent(this.name, this.pet);

  @override
  List<Object?> get props => [name, pet];
}

class ToggleClientEvent extends ClientEvent {
  final String name;
  final String pet;

  ToggleClientEvent(this.name, this.pet);

  @override
  List<Object?> get props => [name, pet];
}











// class AddClientEvent extends ClientEvent {
//   final ClientHiveModel client;
//
//   AddClientEvent({required this.client});
// }
//
// class GetClientEvent extends ClientEvent {
//   final int id;
//
//   GetClientEvent({required this.id});
// }
//
// class GetAllClientsEvent extends ClientEvent {}