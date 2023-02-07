import 'package:siak_app/core/model/api/api_result_model.dart';
import 'package:siak_app/core/model/krs/mata_kuliah_model.dart';
import 'package:siak_app/core/model/krs/tahun_akademik_model.dart';

class RelationshipsKrsModel extends Serializable {
  final MataKuliahModel mataKuliah;
  final TahunAkademiKModel tahunAkademik;

  RelationshipsKrsModel({required this.mataKuliah, required this.tahunAkademik});

  factory RelationshipsKrsModel.fromJson(Map<String, dynamic> json) {
    return RelationshipsKrsModel(
      mataKuliah: MataKuliahModel.fromJson(json['mata_kuliah'] ?? {}),
      tahunAkademik: TahunAkademiKModel.fromJson(json['tahun_akademik'] ?? {}),
    );
  }

  factory RelationshipsKrsModel.failure() => RelationshipsKrsModel(
        mataKuliah: MataKuliahModel.failure(),
        tahunAkademik: TahunAkademiKModel.failure(),
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'mata_kuliah': mataKuliah,
      'tahun_akademik': tahunAkademik,
    };
  }
}
