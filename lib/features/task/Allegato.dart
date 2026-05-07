import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'Allegato.g.dart';
@HiveType(typeId: 3)
class Allegato extends HiveObject with EquatableMixin{

  @HiveField(0)
  final String? descrizione;

  @HiveField(1)
  final String? pathAllegato;

  @HiveField(2)
  final int? idAllegato;

  Allegato({
    required this.descrizione,
    required this.pathAllegato,
    required this.idAllegato
  });

  Allegato copyWith({
    String? descrizione,
    String? pathAllegato,
    int? idAllegato
  }){return Allegato(
    descrizione: descrizione ?? this.descrizione,
    pathAllegato: pathAllegato ?? this.pathAllegato,
    idAllegato: idAllegato ?? this.idAllegato
  );

  }

  factory Allegato.fromJson(Map<String, dynamic> json) {
  return Allegato(
    descrizione: json['descrizione'],
    idAllegato: json['idAllegato'],
    pathAllegato: json['idAllegato'].toString()


  );
}

 @override
  List<Object?> get props => [descrizione, pathAllegato, idAllegato];
}