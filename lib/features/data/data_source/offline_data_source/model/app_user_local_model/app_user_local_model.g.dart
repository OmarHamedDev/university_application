// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppUserLocalModelAdapter extends TypeAdapter<AppUserLocalModel> {
  @override
  final int typeId = 2;

  @override
  AppUserLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppUserLocalModel(
      id: fields[0] as int,
      email: fields[1] as String,
      fullName: fields[2] as String,
      role: fields[3] as String,
      phoneNumber: fields[4] as String,
      profilePhoto: fields[5] as String,
      totalUnits: fields[6] as int,
      major: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AppUserLocalModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.role)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.profilePhoto)
      ..writeByte(6)
      ..write(obj.totalUnits)
      ..writeByte(7)
      ..write(obj.major);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppUserLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
