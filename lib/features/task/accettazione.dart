import 'package:hive_flutter/adapters.dart';

part 'accettazione.g.dart';

@HiveType(typeId: 0)
class Accettazione extends HiveObject{
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
  final String? Allegati;

  @HiveField(10)
  final String? PathAllegati;

  @HiveField(11)
  final String Comune;

  @HiveField(12)
  final List<int>? RapportiDiProva;

    @HiveField(13)
  final String stato;

  @HiveField(14)
  final DateTime? DataRdp;

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
    this.PathAllegati,
    required this.Comune,
    this.RapportiDiProva,
    required this.stato,
    this.DataRdp
  });
}