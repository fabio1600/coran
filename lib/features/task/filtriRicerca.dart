class filtriRicerca {
  final String? veterinario;
  final String? richiesta;
  final String? codiceAziendale;
  final String? ragioneSociale;
  final String? quesito;
  final String? verbale;
  final DateTime? accDal;
  final DateTime? accAl;
  final DateTime? rdpDal;
  final DateTime? rdpAl;

  filtriRicerca({
  this.veterinario,
  this.richiesta,
  this.codiceAziendale,
  this.ragioneSociale,
  this.quesito,
  this.verbale,
  this.accDal,
  this.accAl,
  this.rdpDal,
  this.rdpAl,

  });

filtriRicerca copyWith({
    String? veterinario,
    String? richiesta,
    String? codiceAziendale,
    String? ragioneSociale,
    String? quesito,
    String? verbale,
    bool clearVet = false,
    bool clearRich = false,
    bool clearCod = false,
    bool clearRag = false,
    bool clearQue = false,
    bool clearVerb = false,
    bool clearAccDal= false,
    bool clearAccAl= false,
    bool clearRdpAl= false,
    bool clearRdpDal= false,
    DateTime? accDal,
    DateTime? accAl,
    DateTime? rdpDal,
    DateTime? rdpAl,
  }) {
    return filtriRicerca(
      veterinario: clearVet ? null : (veterinario ?? this.veterinario),
      richiesta: clearRich ? null : (richiesta ?? this.richiesta),
      codiceAziendale: clearCod ? null : (codiceAziendale ?? this.codiceAziendale),
      ragioneSociale: clearRag ? null : (ragioneSociale ?? this.ragioneSociale),
      quesito: clearQue ? null : (quesito ?? this.quesito),
      verbale: clearVerb ? null : (verbale ?? this.verbale),
      accDal: clearAccDal ? null :( accDal ?? this.accDal),
      accAl: clearAccAl ? null :( accAl ?? this.accAl),
      rdpDal: clearRdpDal ? null :( rdpDal ?? this.rdpDal),
      rdpAl: clearRdpAl ? null :( rdpAl ?? this.rdpAl),
    );
  }







}

