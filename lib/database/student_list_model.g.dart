// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentItemAdapter extends TypeAdapter<StudentItem> {
  @override
  final int typeId = 0;

  @override
  StudentItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentItem(
      image: fields[0] as String?,
      name: fields[1] as String?,
      domain: fields[2] as String?,
      phone: fields[3] as String?,
      place: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StudentItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.domain)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.place);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
