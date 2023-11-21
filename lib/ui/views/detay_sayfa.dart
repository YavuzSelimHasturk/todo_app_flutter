import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/yapilacaklar.dart';
import 'package:todo_app/ui/views/colors.dart';

import '../cubit/detay_sayfa_cubit.dart';

class DetaySayfa extends StatefulWidget {

Yapilacaklar yapilacak;

DetaySayfa({required this.yapilacak});


@override
State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa>{
   var tfYapilacakName= TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    var yapilacak = widget.yapilacak;
    tfYapilacakName.text=yapilacak.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yapılacak",style: TextStyle(fontFamily: "PermanentMarker"),),
      backgroundColor: background1,centerTitle: true,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("resimler/todo.png"),
              TextField(controller: tfYapilacakName, decoration: const InputDecoration(hintText: "Yapilacak Name",hintStyle: TextStyle(fontFamily: "Agbalumo")),style: TextStyle(fontFamily: "Agbalumo"),),
              ElevatedButton(
                onPressed: (){
                context.read<DetaySayfaCubit>().guncelle(widget.yapilacak.id,tfYapilacakName.text); } ,
                child:
                Text("GÜNCELLE",style:
                TextStyle(color: textColor1, fontFamily: "PermanentMarker",fontSize: 20),),
              style:ElevatedButton.styleFrom(primary: button1) ,),

            ],
          ),
        ),
      ),backgroundColor: background1,
    );

  }
}
