import 'package:hive_flutter/adapters.dart';

part 'rdp.g.dart';

@HiveType(typeId: 2)
class Rdp extends HiveObject{


  @HiveField(0)
  final int id;

  @HiveField(1)
  final String conferimento;

  @HiveField(2)
  final String tipo;

  @HiveField(3)
  final String specie;

  @HiveField(4)
  final String campioni;

  @HiveField(5)
  final String? pathPdf;

  @HiveField(6)
  final bool? letto;

  @HiveField(7)
  final bool? positivo;

  @HiveField(8)
  final DateTime? data;

  @HiveField(9)
  final int? idAcc;

  @HiveField(10)
  final int? seqRichiesta;

  Rdp({
    required this.id,
    required this.conferimento,
    required this.tipo,
    required this.specie,
    required this.campioni,
    this.pathPdf,
    this.letto=false,
    required this.positivo,
    required this.data,
    required this.idAcc,
    required this.seqRichiesta
  });

  Rdp copyWith({
    bool? letto,
    String? pathPdf
  }){return Rdp(
    id: this.id,
    conferimento: this.conferimento,
    tipo: this.tipo,
    specie: this.specie,
    campioni: this.campioni,
    pathPdf: pathPdf ?? this.pathPdf,
    letto: letto ?? this.letto,
    positivo: this.positivo,
    data: this.data,
    idAcc: this.idAcc,
    seqRichiesta: this.seqRichiesta
  );

  
  }

  factory Rdp.fromJson(Map<String, dynamic> json) {
  return Rdp(
    id: json['rapportoprovan'],
    conferimento: json['conferimento'].toString(),
    tipo: json['tipo'],
    specie: json['specie'],
    campioni: json['numcampioni'].toString(),
    positivo: (json['sigrisesito'] ?? "N") == "S"
    ? true
    : false,
    data: DateTime.parse(json['datarapportoprova']),
    idAcc: json['sigrcsprog'],
    seqRichiesta: json['seqrichiesta']


  );
}
  
}