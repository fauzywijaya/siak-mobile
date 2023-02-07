




import 'package:siak_app/core/model/api/api_result_model.dart';
import 'package:siak_app/core/model/mahasiswa/kelas_model.dart';
import 'package:siak_app/core/model/mahasiswa/prodi_model.dart';
import 'package:siak_app/core/model/mahasiswa/status_model.dart';


class RelationShipMahasiswaModel extends Serializable {
  final StatusModel? status;
  final KelasModel? kelas;
  final ProdiModel? prodi;

  RelationShipMahasiswaModel({required this.status, required this.kelas, required this.prodi});

  factory RelationShipMahasiswaModel.fromJson(Map<String, dynamic> json) {
    return RelationShipMahasiswaModel(
      status: StatusModel.fromJson(json['status']),
      kelas: KelasModel.fromJson(json['kelas']),
      prodi: ProdiModel.fromJson(json['prodi']),
    );
  }

  factory RelationShipMahasiswaModel.failure()
    => RelationShipMahasiswaModel(
      status: StatusModel.failure(),
      kelas: KelasModel.failure(),
      prodi: ProdiModel.failure(),
    );


  @override
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'kelas': kelas,
      'prodi': prodi,
    };
  }

}
