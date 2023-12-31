import 'dart:async';
import 'dart:convert' as convert;
import 'package:admin/config.dart';
import 'package:admin/data/proyek.dart';
import 'package:admin/screens/main/edit_proyek_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LayarDasborProyek extends StatefulWidget {
  @override
  State<LayarDasborProyek> createState() => _LayarDasborProyekState();
}

class _LayarDasborProyekState extends State<LayarDasborProyek> {
  late Future<List<Proyek>> proyek;
  final kunciDaftarProyek = GlobalKey<_LayarDasborProyekState>();

  @override
  void initState() {
    super.initState();
    proyek = dapatkanProyek();
  }

  Future<List<Proyek>> dapatkanProyek() async {
    final response = await http.get(Uri.parse("${URL_PREFIX}/api/proyek"));
    final jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    final items = jsonResponse["data"].cast<Map<String, dynamic>>();
    List<Proyek> daftarProyek = items.map<Proyek>((json) {
      return Proyek.fromJson(json);
    }).toList();
    return daftarProyek;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: kunciDaftarProyek,
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      FutureBuilder<List<Proyek>>(
                        future: proyek,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Proyek>> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.data == null) {
                            return Text('Data is null');
                          } else {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Card(
                                color: Color(0xFF212332),
                                child: Column(
                                  children: [
                                    Text('Tabel Data Proyek',
                                        style: TextStyle(color: Colors.white)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DataTable(
                                        columns: [
                                          DataColumn(label: Text('Latitude')),
                                          DataColumn(label: Text('Longitude')),
                                          DataColumn(label: Text('Alamat')),
                                          DataColumn(label: Text('Investasi')),
                                          DataColumn(label: Text('Perusahaan')),
                                          DataColumn(label: Text('Modal')),
                                          DataColumn(label: Text('Skala Usaha')),
                                          DataColumn(label: Text('Desa')),
                                          DataColumn(label: Text('Kecamatan')),
                                          DataColumn(label: Text('KBLI')),
                                          DataColumn(label: Text('Aksi')),
                                        ],
                                        rows: snapshot.data!.map((data) {
                                          return DataRow(
                                            cells: [
                                              DataCell(Text(data.latitude)),
                                              DataCell(Text(data.longitude)),
                                              DataCell(Text(data.alamat)),
                                              DataCell(Text(data.investasi)),
                                              DataCell(Text(data.perusahaan.nama)),
                                              DataCell(Text(data.modal.nama)),
                                              DataCell(Text(data.skalausaha.skalausaha)),
                                              DataCell(Text(data.desa.desa)),
                                              DataCell(Text(data.kecamatan.kecamatan)),
                                              DataCell(Text(data.kbli.nama)),
                                              DataCell(PopupMenuButton(
                                                icon: Icon(Icons.more_vert),
                                                itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                      onTap: () {
                                                        var dataProyek =
                                                            new Proyek(
                                                          id: data.id,
                                                          longitude: data.longitude,
                                                          latitude: data.latitude,
                                                          alamat: data.alamat,
                                                          investasi: data.investasi,
                                                          perusahaanid: data.perusahaanid,
                                                          modalid: data.modalid,
                                                          resikoid: data.resikoid,
                                                          skalausahaid: data.skalausahaid,
                                                          kecamatanid: data.kecamatanid,
                                                          desaid: data.desaid,
                                                          kbliid: data.kbliid,
                                                          perusahaan: data.perusahaan,
                                                          modal: data.modal,
                                                          resiko: data.resiko,
                                                          skalausaha: data.skalausaha,
                                                          kecamatan: data.kecamatan,
                                                          desa: data.desa,
                                                          kbli: data.kbli,
                                                        );
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                EditProyekScreen(
                                                                    dataProyek:
                                                                        dataProyek),
                                                          ),
                                                        );
                                                      },
                                                      child: Text("Edit")),
                                                  PopupMenuItem(
                                                      onTap: () {
                                                        _hapus(
                                                            context, data.id);
                                                      },
                                                      child: Text("Hapus")),
                                                ],
                                              ))
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _hapus(context, id) async {
    await http.delete(Uri.parse("${URL_PREFIX}/api/proyek/$id"));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LayarDasborProyek()));
  }
}
