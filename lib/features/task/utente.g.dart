// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utente.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UtenteAdapter extends TypeAdapter<Utente> {
  @override
  final int typeId = 1;

  @override
  Utente read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Utente(
      id: fields[0] as int?,
      nome: fields[1] as String?,
      utenzaRiferimento: fields[2] as String?,
      distretto: fields[3] as String?,
      mail: fields[4] as String?,
      cellulare: fields[5] as String?,
      telefono: fields[6] as String?,
      codiceFiscale: fields[7] as String?,
      password: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Utente obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.utenzaRiferimento)
      ..writeByte(3)
      ..write(obj.distretto)
      ..writeByte(4)
      ..write(obj.mail)
      ..writeByte(5)
      ..write(obj.cellulare)
      ..writeByte(6)
      ..write(obj.telefono)
      ..writeByte(7)
      ..write(obj.codiceFiscale)
      ..writeByte(8)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UtenteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
