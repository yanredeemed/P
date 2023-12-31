class Perusahaan {
  final int id;
  final String NIB;
  final String NPWP;
  final String nama;
  final int jenisPerusahaanId;

  Perusahaan({
    required this.id,
    required this.NIB,
    required this.NPWP,
    required this.nama,
    required this.jenisPerusahaanId,
  });

  factory Perusahaan.fromJson(Map<String, dynamic> json) {
    return Perusahaan(
      id: json['id'],
      NIB: json['NIB'],
      NPWP: json['NPWP'],
      nama: json['nama'],
      jenisPerusahaanId: json['jenis_perusahaan_id'],
    );
  }
}

class Desa {
  final int id;
  final String desa;

  Desa({
    required this.id,
    required this.desa,
  });

  factory Desa.fromJson(Map<String, dynamic> json) {
    return Desa(
      id: json['id'],
      desa: json['desa'],
    );
  }
}

class KBLI {
  final int id;
  final String nama;

  KBLI({
    required this.id,
    required this.nama,
  });

  factory KBLI.fromJson(Map<String, dynamic> json) {
    return KBLI(
      id: json['id'],
      nama: json['nama'],
    );
  }
}

class Kecamatan {
  final int id;
  final String kecamatan;

  Kecamatan({
    required this.id,
    required this.kecamatan,
  });

  factory Kecamatan.fromJson(Map<String, dynamic> json) {
    return Kecamatan(
      id: json['id'],
      kecamatan: json['kecamatan'],
    );
  }
}

class Modal {
  final int id;
  final String nama;

  Modal({
    required this.id,
    required this.nama,
  });

  factory Modal.fromJson(Map<String, dynamic> json) {
    return Modal(
      id: json['id'],
      nama: json['nama'],
    );
  }
}

class Proyek {
  final int id;
  final String longitude;
  final String latitude;
  final String alamat;
  final String investasi;
  final int perusahaanid;
  final int modalid;
  final int resikoid;
  final int skalausahaid;
  final int kecamatanid;
  final int desaid;
  final int kbliid;
  final Perusahaan perusahaan;
  final Modal modal;
  final Resiko resiko;
  final SkalaUsaha skalausaha;
  final Kecamatan kecamatan;
  final Desa desa;
  final KBLI kbli;


  Proyek({
    required this.id,
    required this.longitude,
    required this.latitude,
    required this.alamat,
    required this.investasi,
    required this.perusahaanid,
    required this.modalid,
    required this.resikoid,
    required this.skalausahaid,
    required this.kecamatanid,
    required this.desaid,
    required this.kbliid,
    required this.perusahaan,
    required this.modal,
    required this.resiko,
    required this.skalausaha,
    required this.kecamatan,
    required this.desa,
    required this.kbli
  });

  factory Proyek.fromJson(Map<String, dynamic> json) {
    return Proyek(
      id: json['id'],
      longitude: json['longitude'] ?? "",
      latitude: json['latitude'] ?? "",
      alamat: json['alamat'],
      investasi: json['investasi'],
      perusahaanid: json['perusahaan_id'],
      modalid: json['modal_id'],
      resikoid: json['resiko_id'],
      skalausahaid: json['skala_usaha_id'],
      kecamatanid: json['kecamatan_id'],
      desaid: json['desa_id'],
      kbliid: json['kbli_id'],
      perusahaan:Perusahaan.fromJson(json['perusahaan']),
      modal:Modal.fromJson(json['modal']),
      resiko:Resiko.fromJson(json['resiko']),
      skalausaha:SkalaUsaha.fromJson(json['skalausaha']),
      kecamatan:Kecamatan.fromJson(json['kecamatan']),
      desa:Desa.fromJson(json['desa']),
      kbli:KBLI.fromJson(json['kbli']),
    );
  }
}

class Resiko {
  final int id;
  final String resiko;

  Resiko({
    required this.id,
    required this.resiko,
  });

  factory Resiko.fromJson(Map<String, dynamic> json) {
    return Resiko(
      id: json['id'],
      resiko: json['resiko'],
    );
  }
}

class SkalaUsaha {
  final int id;
  final String skalausaha;

  SkalaUsaha({
    required this.id,
    required this.skalausaha,
  });

  factory SkalaUsaha.fromJson(Map<String, dynamic> json) {
    return SkalaUsaha(
      id: json['id'],
      skalausaha: json['skala_usaha'] ?? "",
    );
  }
}