import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:flutter_mostra_filmes/menu_filmes.dart';
import 'main.dart';
import 'referencias.dart';

import 'classes_json.dart';


void main(){
  runApp(const BelaFeraSobre());
}


class BelaFeraSobre extends StatefulWidget {
  const BelaFeraSobre({super.key});

  @override
  BelaFera createState() => BelaFera();

}

class BelaFera extends State<BelaFeraSobre>{

List<Elenco> elenco = List.empty();
List<Links> links = List.empty();
List<Sobre> informacoes = List.empty();

 Future<void> elencoJson() async {
    final String response = await rootBundle.loadString('assets/galeria.json');
    Iterable data = await json.decode(response);
    elenco =  List<Elenco>.from(data.map((model)=> Elenco.pegarJson(model)));

    setState(() {
      elenco;
    });
  }

  Future<void> linksJson() async {
    final String response = await rootBundle.loadString('assets/link.json');
    Iterable data = await json.decode(response);
    links = List<Links>.from(data.map((model)=> Links.pegarJson(model)));

    setState(() {
      links;
    });
  }

    Future<void> sobreFilmeJson() async {
    final String response = await rootBundle.loadString('assets/bela_fera_sobre.json');
    Iterable data = await json.decode(response);
    informacoes = List<Sobre>.from(data.map((model)=> Sobre.pegarJson(model)));

    setState(() {
      informacoes;
    });
  }

  Future<void> _launchURL(Uri url) async {

    if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
      }
  }

  void _navegacao(BuildContext context, int index) {
    switch(index){
      case 0:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MenuFilmesPagina()));
      case 1:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const InicioPagina()));
      case 2:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ReferenciasFilmesPagina()));
    }
  }



  @override
   initState()  {
    super.initState();
       elencoJson();
        linksJson();
        sobreFilmeJson();
    }

  @override
  Widget build(BuildContext context) {
    final ScrollController controleBarra = ScrollController();

     return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: (){
            Navigator.pop(context);
            }
        ),
      ),

      body: Scrollbar(
        controller: controleBarra,
        thumbVisibility: true,
        interactive: true,
        trackVisibility: true,
        
        child: ListView(

          controller: controleBarra,
          padding: EdgeInsets.symmetric(horizontal: 25),
          children: [
            
            Column(
              
              spacing: 20.0,
              children: [
              Image.asset("assets/cartazes/bela_fera_cartaz.png", height: 300,),
                Align(
                  
                  widthFactor: 4.2,
                  alignment: Alignment.topLeft,
                  child: Text(style: TextStyle(fontFamily: "Cormorant SC", fontSize: 35.0), "Sinopse"),
                
              ),
              Text(style: TextStyle(fontFamily: "Caudex", fontSize: 20.0,), informacoes[0].sinopse),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(style: TextStyle(fontFamily: "Caudex", fontSize: 20.0, fontStyle: FontStyle.italic, ), informacoes[0].genero, textAlign: TextAlign.right,),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(style: TextStyle(fontFamily: "Cormorant SC", fontSize: 35.0,), "Direção", textAlign: TextAlign.right,),
              ),

              GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,

                children: [
                  Image.asset("assets/bela_fera_sobre/diretor_gary.png", width: 260,),

                  Padding(padding: EdgeInsets.symmetric(vertical: 50),
                  child: Text(style: TextStyle(fontFamily: "Caudex", fontSize: 20), informacoes[0].diretor1),
                  ),

                  Image.asset("assets/bela_fera_sobre/diretor_kirk.png", width: 260,),
                  
                  Padding(padding: EdgeInsets.fromLTRB(10, 45, 10, 45),
                  child: Text(style: TextStyle(fontFamily: "Caudex", fontSize: 20), informacoes[0].diretor2),
                  )
                ],),

              Row(
                spacing: 10.0,
                children: [
                  
                ],
              ),
              
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 40.0,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(style: TextStyle(fontFamily: "Cormorant SC", fontSize: 35.0,), "Empresa/Studio", textAlign: TextAlign.right,),
                  ),
                  Image.asset("assets/bela_fera_sobre/disney_logo.png"),
                  Text(style: TextStyle(fontFamily: "Caudex", fontSize: 20.0, ), informacoes[0].empresa)
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20.0,
                children: [
                  Text(style: TextStyle(fontFamily: "Cormorant SC", fontSize: 35.0),"Dados de lançamento"),
                  Text(style: TextStyle(fontFamily: "Caudex", fontSize: 20.0), informacoes[0].lancamento)
                ],
              ),
              Text(style: TextStyle(fontFamily: "Cormorant SC", fontSize: 35.0), "Elenco/ Personagens"),

              GridView.builder(

                primary: false,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: elenco.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1/1.1), 
                itemBuilder: (context, count){
                  final item = elenco[count];
                  return Column(
                    
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(item.linkImagem, width: 149,
                      ),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Text(item.nomePersonagem, style: TextStyle(fontFamily: "Caudex", fontSize: 22), 
                      ),
                      ),
                      
                    ],
                  );
                },
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 50.0),


                child:  Column(
                  
                    mainAxisSize: MainAxisSize.max,
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,                    
                    children: [
                      
                      Text(style: TextStyle(fontSize: 35, fontFamily: "Cormorant SC"), "Link para trailer"),
                      TextButton(
                        onPressed:() => _launchURL(links[0].trailer),
                        child: Text(style: TextStyle(fontSize: 22, fontFamily: "Caudex"), "https://youtu.be/5pXjJ2fEA5Y?si=FxenAZ79wxX8pgkX"),
                        
                        ),
                      Text(style: TextStyle(fontSize: 35, fontFamily: "Cormorant SC"), "Link para o site e rede social"),

                      TextButton(
                        onPressed:() => _launchURL(links[0].site),
                        child: Text(style: TextStyle(fontSize: 22, fontFamily: "Caudex"), "Site:  https://disneyanimation.com"),
                      ),

                      Row(
                        children: [
                          IconButton(onPressed: () => _launchURL(links[0].social), 
                          icon:Image.asset("assets/bela_fera_sobre/logo_instagram.png"), ),
                          
                          TextButton(
                            onPressed: () => _launchURL(links[0].social),
                            child: Text(style: TextStyle(fontFamily: "Caudex", fontSize: 22,),"   Disneyanimation")
                          )
                        ],
                      ),
                    ],
                ),
              )
              ],
            )  
          ],
        )
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int index) {
          _navegacao(context, index);
        },
        selectedIndex: 0, 
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.book_outlined),
            label: 'Filmes',
          ),
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.star_border_outlined),
            label: 'Referências',
          ),
        ],
      ),
    );
  }
}

