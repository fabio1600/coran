import 'dart:convert';

class Task {
  final int id;
  final String titolo;
  final DateTime scadenza;
  final bool completato;

  Task({
    required this.id,
    required this.titolo,
    required this.scadenza,
    this.completato = false,
  });

  Task copiaCon({
    bool? completato,
  }) {
    return Task(
      id: id,
      titolo: titolo,
      scadenza: scadenza,
      completato: completato ?? this.completato,
    );
  }

  /// 🔽 PER SALVARE
  Map<String, dynamic> toMap() {
    return {
      
      'titolo': titolo,
      'data_scadenza': scadenza.toIso8601String(),
      'completato': completato,
    };
  }

  /// 🔼 PER RICARICARE
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      titolo: map['titolo'],
      scadenza: DateTime.parse(map['data_scadenza']),
      completato: map['completato'],
    );
  }
}



