

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/yapilacaklar.dart';
import 'package:todo_app/ui/views/colors.dart';
import 'package:todo_app/ui/views/detay_sayfa.dart';
import 'package:todo_app/ui/views/kayit_sayfa.dart';
import 'package:todo_app/ui/views/tamamlandi.dart';

import '../cubit/anasayfa_cubit.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int selectedIndex=0;
  List pages = [
    const Anasayfa(),
    const Tamamlandi(),
  ];
  bool isChecked=false;
  bool aramaYapiliyorMu =false;


  @override
  void initState() {
    // TODO: implement initState

    context.read<AnasayfaCubit>().yapilacaklarListele();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isChecked=false;
    return Scaffold(
      appBar: AppBar(
        title:
          aramaYapiliyorMu ?
      TextField(decoration: const InputDecoration(hintText: "Ara"),
        onChanged: (aramaSonucu){
          context.read<AnasayfaCubit>().ara(aramaSonucu);
        },)
          : Text("Yapilacaklar",style: TextStyle(fontSize: 30,fontFamily: "PermanentMarker", color: textColor1),),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: () {
            setState(() {
              aramaYapiliyorMu=false;
            });
            context.read<AnasayfaCubit>().yapilacaklarListele();
          }, icon: Icon(Icons.clear)) :
          IconButton(onPressed: () {
            setState(() {
              aramaYapiliyorMu=true;
            });
          }, icon: Icon(Icons.search))
        ],
        backgroundColor: background1,
        centerTitle: true,
      ),
      body:
      BlocBuilder<AnasayfaCubit,List<Yapilacaklar>>(
          builder: (context,yapilacaklarListesi){
            if(yapilacaklarListesi.isNotEmpty){
              return ListView.builder(
                itemCount: yapilacaklarListesi.length,
                itemBuilder: (context, index){
                  var yapilacak = yapilacaklarListesi[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(yapilacak: yapilacak)))
                          .then((value) {context.read<AnasayfaCubit>().yapilacaklarListele();});
                    },
                    child: Card(color: background2,
                      child: SizedBox(height: 120,
                        child: Row(
                          children: [
                            Checkbox(value: isChecked, onChanged: (val) {
                              setState((){

                                isChecked=val!;
                              });
                            }),
                          Padding(padding: const EdgeInsets.only(left: 18.0),
                              child: Column(

                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(yapilacak.name,style: TextStyle( fontSize: 20, color: textColor1,fontFamily: "Agbalumo"),),
                                ],
                              ),
                            ),
                            const Spacer(),
                            IconButton(onPressed: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${yapilacak.name} silinsin mi?"),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: (){
                                      context.read<AnasayfaCubit>().sil(yapilacak.id);
                                    },
                                  ),backgroundColor: button1,
                                ),
                              );
                            }, icon: const Icon(Icons.clear,color: Colors.grey,),)
],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            else {
              return const Center();
            }
          },
        ), backgroundColor: background1,

        floatingActionButton: FloatingActionButton(backgroundColor: background2,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const KayitSayfa()))
                .then((value) {context.read<AnasayfaCubit>().yapilacaklarListele();});
          }, child: const Icon(Icons.add,color: Colors.grey,),
        ),

      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: "Anasayfa", ),
          NavigationDestination(icon: Icon(Icons.done), label: "Tamamlandi"),
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: (value){
          setState(() {
            selectedIndex=value;
          });
      },
        backgroundColor: background2,
      ),
      );

  }
}
