// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClientHiveModelAdapter extends TypeAdapter<ClientHiveModel> {
  @override
  final int typeId = 0;

  @override
  ClientHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClientHiveModel(
      name: fields[0] as String,
      pet: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ClientHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.pet);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
