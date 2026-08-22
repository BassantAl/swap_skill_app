// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetUserInfoModelAdapter extends TypeAdapter<GetUserInfoModel> {
  @override
  final typeId = 1;

  @override
  GetUserInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetUserInfoModel(
      email: fields[0] as String,
      fullName: fields[1] as String,
      userName: fields[2] as String,
      uid: fields[3] as String,
      learnSkills: (fields[4] as List).cast<String>(),
      teachSkills: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, GetUserInfoModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.uid)
      ..writeByte(4)
      ..write(obj.learnSkills)
      ..writeByte(5)
      ..write(obj.teachSkills);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetUserInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
