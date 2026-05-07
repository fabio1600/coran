// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accettazione.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccettazioneAdapter extends TypeAdapter<Accettazione> {
  @override
  final int typeId = 0;

  @override
  Accettazione read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Accettazione(
      id: fields[0] as int,
      DataAccettazione: fields[1] as DateTime,
      Attivita: fields[2] as String,
      Indirizzo: fields[3] as String,
      Richiedente: fields[4] as String,
      Quesito: fields[5] as String,
      Utente: fields[6] as String,
      CodiceAzienda: fields[7] as String,
      Asl: fields[8] as String,
      Allegati: (fields[9] as List?)?.cast<Allegato>(),
      Comune: fields[11] as String,
      RapportiDiProva: (fields[12] as List?)?.cast<int>(),
      stato: fields[13] as String,
      DataRdp: fields[14] as DateTime?,
      positivo: fields[15] as bool?,
      preferito: fields[16] as bool?,
      idRichiedente: fields[17] as int?,
      numrapportiProva: fields[18] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Accettazione obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.DataAccettazione)
      ..writeByte(2)
      ..write(obj.Attivita)
      ..writeByte(3)
      ..write(obj.Indirizzo)
      ..writeByte(4)
      ..write(obj.Richiedente)
      ..writeByte(5)
      ..write(obj.Quesito)
      ..writeByte(6)
      ..write(obj.Utente)
      ..writeByte(7)
      ..write(obj.CodiceAzienda)
      ..writeByte(8)
      ..write(obj.Asl)
      ..writeByte(9)
      ..write(obj.Allegati)
      ..writeByte(11)
      ..write(obj.Comune)
      ..writeByte(12)
      ..write(obj.RapportiDiProva)
      ..writeByte(13)
      ..write(obj.stato)
      ..writeByte(14)
      ..write(obj.DataRdp)
      ..writeByte(15)
      ..write(obj.positivo)
      ..writeByte(16)
      ..write(obj.preferito)
      ..writeByte(17)
      ..write(obj.idRichiedente)
      ..writeByte(18)
      ..write(obj.numrapportiProva);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccettazioneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
