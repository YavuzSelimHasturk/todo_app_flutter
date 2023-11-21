import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/yapilacaklar.dart';

import '../cubit/kayit_sayfa_cubit.dart';
import 'colors.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {

  var tfYapilacak= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Kayıt",style: TextStyle(fontFamily: "PermanentMarker"),),
        backgroundColor: background1,centerTitle: true,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("resimler/todo.png"),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child:
                TextField(controller: tfYapilacak,
                  decoration: const InputDecoration(hintText: "Lütfen Giris Yapiniz",hintStyle: TextStyle(fontFamily: "Agbalumo")),style: TextStyle(fontFamily: "Agbalumo"),),
              ),
              ElevatedButton(onPressed: () {
                context.read<KayitSayfaCubit>().kaydet(tfYapilacak.text);
              }, child: Text("KAYDET",style:
              TextStyle(color: textColor1, fontFamily: "PermanentMarker",fontSize: 20),),
                style:ElevatedButton.styleFrom(primary: button1) ,),

            ],
          ),
        ),
      ),backgroundColor: background1,
    );

  }
}
