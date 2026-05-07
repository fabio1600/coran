import 'package:hive_flutter/adapters.dart';

part 'utente.g.dart';

@HiveType(typeId: 1)
class Utente extends HiveObject{

  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? nome;

  @HiveField(2)
  final String? utenzaRiferimento;

  @HiveField(3)
  final String? distretto;

  @HiveField(4)
  final String? mail;

  @HiveField(5)
  final String? cellulare;

  @HiveField(6)
  final String? telefono;

  @HiveField(7)
  final String? codiceFiscale;

  @HiveField(8)
  final String? password;

  @HiveField(9)
  final String? coordinatore;

  Utente({
    required this.id,
    required this.nome,
    required this.utenzaRiferimento,
    this.distretto,
    required this.mail,
    required this.cellulare,
    required this.telefono,
    required this.codiceFiscale,
    required this.password,
    required this.coordinatore
  });




  Utente copyWith({
    int? id,
    String? nome,
    String? utenzaRiferimento,
    String? distretto,
    String? mail,
    String? cellulare,
    String? telefono,
    String? codiceFiscale,
    String? password,
    String? coordinatore
  }) {
    return Utente(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      utenzaRiferimento: utenzaRiferimento ?? this.utenzaRiferimento,
      distretto: distretto ?? this.distretto,
      mail: mail ?? this.mail,
      cellulare: cellulare ?? this.cellulare,
      telefono: telefono ?? this.telefono,
      codiceFiscale: codiceFiscale ?? this.codiceFiscale,
      password: password ?? this.password,
      coordinatore: coordinatore ?? this.coordinatore
    );
  }

}




