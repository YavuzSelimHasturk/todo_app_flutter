import 'package:todo_app/data/entity/yapilacaklar.dart';
import 'package:todo_app/sqlite/veritabani_yardimcisi.dart';

class YapilacaklarDaoRepository{

  Future<void> kaydet(String yap) async {
    var db = await VeritabaniYardimcisi.vertabaniErisim();
    var yeniYapilacak = Map<String,dynamic>();

    yeniYapilacak["yap"]=yap;

    await db.insert("yapilacak", yeniYapilacak);

  }

  Future<void> guncelle(int id, String yap) async{
    var db = await VeritabaniYardimcisi.vertabaniErisim();
    var guncellenenYapilacak = Map<String,dynamic>();

    guncellenenYapilacak["yap"]=yap;

    await db.update("yapilacak", guncellenenYapilacak, where: "id =?", whereArgs: [id]);

  }

  Future<List<Yapilacaklar>> yapilacaklarListele() async{
    var db = await VeritabaniYardimcisi.vertabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacak");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Yapilacaklar(id: satir["id"] , name: satir["yap"]);
    });
  }

  Future<List<Yapilacaklar>> ara(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.vertabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("Select * from yapilacaklar WHERE yap like '%$aramaKelimesi%'");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Yapilacaklar(id: satir["id"], name: satir["yap"]);
    });

  }
  Future<void> sil(int id) async {
    var db = await VeritabaniYardimcisi.vertabaniErisim();
    await db.delete("yapilacak", where: "id=?",whereArgs: [id]);
  }

  
  
}