part of 'client_bloc.dart';

abstract class ClientState extends Equatable {
  const ClientState();
}

class ClientsInitial extends ClientState {
  @override
  List<Object> get props => [];
}

class ClientsLoadedState extends ClientState {
  final List<ClientHiveModel> name;
  final List<ClientHiveModel> pet;

  ClientsLoadedState(
      this.name,
      this.pet,
      );

  @override
  List<Object?> get props => [
    this.name,
    this.pet,
  ];
}




















// class ClientInitial extends ClientState {}
//
// class ClientAdded extends ClientState {}
//
// class ClientLoaded extends ClientState {
//   final ClientHiveModel client;
//
//   ClientLoaded({required this.client});
// }
//
// class ClientsLoaded extends ClientState {
//   final List<ClientHiveModel> clients;
//
//   ClientsLoaded({required this.clients});
// }
//
// class ClientError extends ClientState {
//   final String message;
//
//   ClientError({required this.message});
// }