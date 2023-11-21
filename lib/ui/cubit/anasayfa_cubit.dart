import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/yapilacaklar.dart';
import 'package:todo_app/data/repo/yapilacaklardao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yapilacaklar>> {
  AnasayfaCubit() : super(<Yapilacaklar>[]);

  var krepo = YapilacaklarDaoRepository();
  Future<void> yapilacaklarListele() async {
    var liste = await krepo.yapilacaklarListele();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await krepo.ara(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int yapilacak_id) async {
    await krepo.sil(yapilacak_id);
    yapilacaklarListele();
  }


}

