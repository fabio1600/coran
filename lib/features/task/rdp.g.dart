// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rdp.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RdpAdapter extends TypeAdapter<Rdp> {
  @override
  final int typeId = 2;

  @override
  Rdp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rdp(
      id: fields[0] as int,
      conferimento: fields[1] as String,
      tipo: fields[2] as String,
      specie: fields[3] as String,
      campioni: fields[4] as String,
      pathPdf: fields[5] as String?,
      letto: fields[6] as bool?,
      positivo: fields[7] as bool?,
      data: fields[8] as DateTime?,
      idAcc: fields[9] as int?,
      seqRichiesta: fields[10] as int?,
      incorso: fields[11] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Rdp obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.conferimento)
      ..writeByte(2)
      ..write(obj.tipo)
      ..writeByte(3)
      ..write(obj.specie)
      ..writeByte(4)
      ..write(obj.campioni)
      ..writeByte(5)
      ..write(obj.pathPdf)
      ..writeByte(6)
      ..write(obj.letto)
      ..writeByte(7)
      ..write(obj.positivo)
      ..writeByte(8)
      ..write(obj.data)
      ..writeByte(9)
      ..write(obj.idAcc)
      ..writeByte(10)
      ..write(obj.seqRichiesta)
      ..writeByte(11)
      ..write(obj.incorso);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RdpAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
