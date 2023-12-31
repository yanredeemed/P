class Perusahaan {
  final int id;
  final String NIB;
  final String NPWP;
  final String nama;
  final int jenisPerusahaanId;
  final JenisPerusahaan jenisperusahaan;

  Perusahaan({
    required this.id,
    required this.NIB,
    required this.NPWP,
    required this.nama,
    required this.jenisPerusahaanId,
    required this.jenisperusahaan,
  });

  factory Perusahaan.fromJson(Map<String, dynamic> json) {
    return Perusahaan(
      id: json['id'],
      NIB: json['NIB'],
      NPWP: json['NPWP'],
      nama: json['nama'],
      jenisPerusahaanId: json['jenis_perusahaan_id'],
      jenisperusahaan : JenisPerusahaan.fromJson(json['jenisperusahaan']),
    );
  }
}

class JenisPerusahaan{
  final int id;
  final String jenis_perusahaan;

  JenisPerusahaan({
    required this.id,
    required this.jenis_perusahaan,
  });

  factory JenisPerusahaan.fromJson(Map<String, dynamic>json){
    return JenisPerusahaan(
      id: json['id'],
      jenis_perusahaan: json['jenis_perusahaan'],
      );
  }
}