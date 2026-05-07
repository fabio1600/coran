import 'dart:ffi';

import 'package:coran/features/task/Allegato.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

part 'accettazione.g.dart';

@HiveType(typeId: 0)
class Accettazione extends HiveObject with EquatableMixin{
  @HiveField(0)
  final int id;

  @HiveField(1)
  final DateTime DataAccettazione;

  @HiveField(2)
  final String Attivita;

  @HiveField(3)
  final String Indirizzo;

  @HiveField(4)
  final String Richiedente;

  @HiveField(5)
  final String Quesito;

  @HiveField(6)
  final String Utente;

  @HiveField(7)
  final String CodiceAzienda;

  @HiveField(8)
  final String Asl;

  @HiveField(9)
  final List<Allegato>? Allegati;

  

  @HiveField(11)
  final String Comune;

  @HiveField(12)
  final List<int>? RapportiDiProva;

    @HiveField(13)
  final String stato;

  @HiveField(14)
  final DateTime? DataRdp;

  @HiveField(15)
  final bool? positivo;

  @HiveField(16)
  final bool? preferito;

  @HiveField(17)
  final int? idRichiedente;

  @HiveField(18)
  final int? numrapportiProva;

  Accettazione({
    required this.id,
    required this.DataAccettazione,
    required this.Attivita,
    required this.Indirizzo,
    required this.Richiedente,
    required this.Quesito,
    required this.Utente,
    required this.CodiceAzienda,
    required this.Asl,
    this.Allegati,
    required this.Comune,
    this.RapportiDiProva,
    required this.stato,
    this.DataRdp,
    this.positivo=false,
    this.preferito=false,
     this.idRichiedente,
     required this.numrapportiProva
  });

  Accettazione copyWith({
    int? id,
    DateTime? dataAccettazione,
    String? attivita,
    String? indirizzo,
    String? richiedente,
    String? quesito,
    String? utente,
    String? codiceAzienda,
    String? asl,
    String? comune,
    List<Allegato>? allegati,
    List<int>? RapportiDiProva,
    DateTime? dataRdp,
    String? stato,
    bool? positivo,
    bool? preferito,
    int? idRichiedente,
    int? numrapportiProva
    }) {return Accettazione(
      id: id ?? this.id,
      DataAccettazione: dataAccettazione ?? this.DataAccettazione,
      Attivita: attivita ??  this.Attivita,
      Indirizzo: indirizzo ?? this.Indirizzo,
      Richiedente: richiedente ?? this.Richiedente,
      Quesito: quesito ?? this.Quesito,
      Utente:utente ?? this.Utente,
      CodiceAzienda:codiceAzienda ?? this.CodiceAzienda,
      Asl:asl ?? this.Asl,
      Allegati: allegati ?? this.Allegati,
      Comune:comune ?? this.Comune,
      RapportiDiProva: RapportiDiProva?? this.RapportiDiProva,
      DataRdp: dataRdp?? this.DataRdp,
      stato:stato ?? this.stato,
      positivo: positivo ?? this.positivo,
      preferito: preferito ?? this.preferito,
      idRichiedente: idRichiedente ?? this.idRichiedente,
      numrapportiProva: numrapportiProva ?? this.numrapportiProva
      );
    }


    
factory Accettazione.fromJson(Map<String, dynamic> json) {
  return Accettazione(
    id: json['accettazione'],
    DataAccettazione: DateTime.parse(json['dataaccettazione']),
    Attivita: json['proprietario'] ?? '',
    Indirizzo: json['indirizzo']??'', // NON presente nel JSON → placeholder
    Richiedente: json['richiedente'] ?? '',
    Quesito: json['sigquedescr'] ?? '',
    Utente: json['utente'] ?? '',
    CodiceAzienda: json['codiceazienda'] ?? '',
    Asl: json['asl'] ?? '',
    Comune: json['comune'] ?? '',
    stato: (json['rapportoprovan'] ?? 0) > 0
    ? 'Non letto'
    : 'analisi in corso',
    positivo: json['positivi'] != null ? json['positivi'] > 0 : false,
    numrapportiProva: json['rapportoprovan']


  );
}

Accettazione updateFromJson(Map<String, dynamic> json) {
  return copyWith(
    id: json.containsKey('accettazione') ? json['accettazione'] : null,
    dataAccettazione: json.containsKey('dataaccettazione')
        ? DateTime.parse(json['dataaccettazione'])
        : null,
    attivita: json.containsKey('proprietario') ? json['proprietario'] : null,
    indirizzo: json.containsKey('indirizzo') ? json['indirizzo'] : null,
    richiedente: json.containsKey('richiedente') ? json['richiedente'] : null,
    quesito: json.containsKey('sigquedescr') ? json['sigquedescr'] : null,
    utente: json.containsKey('utente') ? json['utente'] : null,
    codiceAzienda: json.containsKey('codiceazienda') ? json['codiceazienda'] : null,
    asl: json.containsKey('asl') ? json['asl'] : null,
    comune: json.containsKey('comune') ? json['comune'] : null,
    stato: json.containsKey('rapportoprovan') &&
        json['rapportoprovan'] != null &&
        (this.RapportiDiProva == null ||
         json['rapportoprovan'] > this.RapportiDiProva!.length)
    ? 'Non letto'
    : null,
    positivo: json.containsKey('positivi')
        ? (json['positivi'] != null ? json['positivi'] > 0 : false)
        : null,
    numrapportiProva: json.containsKey('rapportoprovan') ? json['rapportoprovan'] : null,
  );
}

@override
List<Object?> get props => [
  id,
  DataAccettazione,
  Attivita,
  Indirizzo,
  Richiedente,
  Quesito,
  Utente,
  CodiceAzienda,
  Asl,
  Comune,
  stato,
  DataRdp,
  positivo,
  preferito,
  idRichiedente,
  Allegati,
  RapportiDiProva,
  numrapportiProva
];

}