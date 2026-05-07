// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Allegato.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllegatoAdapter extends TypeAdapter<Allegato> {
  @override
  final int typeId = 3;

  @override
  Allegato read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Allegato(
      descrizione: fields[0] as String?,
      pathAllegato: fields[1] as String?,
      idAllegato: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Allegato obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.descrizione)
      ..writeByte(1)
      ..write(obj.pathAllegato)
      ..writeByte(2)
      ..write(obj.idAllegato);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllegatoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
