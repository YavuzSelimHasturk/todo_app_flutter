import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repo/yapilacaklardao_repository.dart';

class KayitSayfaCubit extends Cubit<void>{
  KayitSayfaCubit():super(0);

  var krepo = YapilacaklarDaoRepository();

  Future<void> kaydet(String yap) async {
    await krepo.kaydet(yap);
  }
}