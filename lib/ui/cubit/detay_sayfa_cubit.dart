import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repo/yapilacaklardao_repository.dart';

class DetaySayfaCubit extends Cubit<void>{
  DetaySayfaCubit():super(0);

  var krepo=YapilacaklarDaoRepository();

  Future<void> guncelle(int id,String name) async {
    await krepo.guncelle(id,name);
  }
}