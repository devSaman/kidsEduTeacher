// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_favourite_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveFavouriteModelAdapter extends TypeAdapter<HiveFavouriteModel> {
  @override
  final int typeId = 1;

  @override
  HiveFavouriteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveFavouriteModel()
      ..id = fields[0] as String
      ..type = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, HiveFavouriteModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveFavouriteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
