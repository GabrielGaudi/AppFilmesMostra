import 'package:flutter/material.dart';
import 'package:flutter_mostra_filmes/menu_filmes.dart';
import 'main.dart';
import 'referencias.dart';
import 'package:url_launcher/url_launcher.dart';
import 'galeria_info.dart';
import 'dart:convert';
import 'package:flutter/services.dart';


void main(){
  runApp(const BelaFeraSobre());
}





class BelaFeraSobre extends StatefulWidget {
  const BelaFeraSobre({super.key});

  @override
  BelaFera createState() => BelaFera();

}

class BelaFera extends State<BelaFeraSobre>{

List<Elenco> musicas = List.empty();

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

   Future<void> readJson() async {
    final response = await rootBundle.loadString('galeria.json');
     Iterable data = await json.decode(response);
    List<Elenco> musicas =  List<Elenco>.from(data.map((model)=> Elenco.pegarJson(model)));
    int total = musicas.length;

  }


@override
initState(){
  super.initState();
  readJson();
}

  @override
  Widget build(BuildContext context) {
    final ScrollController controleBarra = ScrollController();
final String link = '[{"nome": "Bela","imagem": "assets/bela_fera_sobre/bela_elenco.png"},{"nome": "Fera","imagem": "assets/bela_fera_sobre/fera_elenco.png"},{"nome": "Gaston","imagem": "assets/bela_fera_sobre/gaston_elenco.png"},{"nome": "Maurice","imagem": "assets/bela_fera_sobre/maurice_elenco.png"},{"nome": "LeFou","imagem": "assets/bela_fera_sobre/lefou_elenco.png"},{"nome": "Lumière","imagem": "assets/bela_fera_sobre/lumiere_elenco.png"},{"nome": "Relógio","imagem": "assets/bela_fera_sobre/relogio_elenco.png"},{"nome": "Srª Samovar","imagem": "assets/bela_fera_sobre/sra_samovar_elenco.png"},{"nome": "Chip","imagem": "assets/bela_fera_sobre/chip_elenco.png "}]';
/*final elencoMapa = json.decode(link);
final sla = Elenco.pegarJson(elencoMapa);
List<Elenco> membros =  List<Elenco>.from(elencoMapa.map((model)=> Elenco.pegarJson(model)));
final int total = membros.length;
final String eba = total.toString();*/



final List<Map<String, String>> elenco = [
      {'imagem': 'assets/bela_fera_sobre/bela_elenco.png', 'nome': 'Bela'},
      {'imagem': 'assets/bela_fera_sobre/fera_elenco.png', 'nome': 'Fera'},
      {'imagem': 'assets/bela_fera_sobre/gaston_elenco.png', 'nome': 'Gaston'},
      {'imagem': 'assets/bela_fera_sobre/maurice_elenco.png', 'nome': 'Maurice'},
      {'imagem': 'assets/bela_fera_sobre/lefou_elenco.png', 'nome': 'LeFou'},
      {'imagem': 'assets/bela_fera_sobre/lumiere_elenco.png', 'nome': 'Lumière'},
      {'imagem': 'assets/bela_fera_sobre/relogio_elenco.png', 'nome': 'Relógio'},
      {'imagem': 'assets/bela_fera_sobre/sra_samovar_elenco.png', 'nome': 'Srª Samovar'},
      {'imagem': 'assets/bela_fera_sobre/chip_elenco.png', 'nome': 'Chip'},
    ];
    
final Uri linkTrailer = Uri.parse('https://youtu.be/5pXjJ2fEA5Y?si=FxenAZ79wxX8pgkX');
final Uri linkSite = Uri.parse('https://disneyanimation.com');
final Uri linkSocial = Uri.parse('https://www.instagram.com/disneyanimation');

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
                  child: Text(style: TextStyle(fontFamily: "Cormorant SC", fontSize: 35.0), "a"),
                
              ),
              Text(style: TextStyle(fontFamily: "Caudex", fontSize: 20.0,), "   Moradora de uma pequena aldeia francesa, Bela tem o pai capturado pela Fera e decide entregar sua vida ao estranho ser em troca da liberdade do progenitor. No castelo, ela conhece objetos mágicos e descobre que a Fera é na verdade um príncipe que precisa de amor para voltar à forma humana."),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(style: TextStyle(fontFamily: "Caudex", fontSize: 20.0, fontStyle: FontStyle.italic, ), "gênero: Romance", textAlign: TextAlign.right,),
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
                  child: Text(style: TextStyle(fontFamily: "Caudex", fontSize: 20),  "Gary Trousdale é um cineasta estadunidense, atuando na direção e produção de muitas animações da Disney."),
                  ),

                  Image.asset("assets/bela_fera_sobre/diretor_kirk.png", width: 260,),
                  
                  Padding(padding: EdgeInsets.fromLTRB(10, 45, 10, 45),
                  child: Text(style: TextStyle(fontFamily: "Caudex", fontSize: 20), "Kirk Wise é um cineasta estadunidense que, ao lado de Gary Trousdale, dirige e coordena a produção de boa parte das animações da Disney."),
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
                  Text(style: TextStyle(fontFamily: "Caudex", fontSize: 20.0, ), "O Walt Disney Animation Studios é um estúdio de animação dirigido por cineastas, responsável pela criação de alguns dos filmes mais amados já feitos. Localizada em Burbank e Vancouver, a Disney Animation continua a desenvolver seu rico legado de inovação e criatividade, desde o primeiro longa-metragem totalmente animado - Branca de Neve e os Sete Anões, de 1937 - até Zootopia 2, de 2025.")
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20.0,
                children: [
                  Text(style: TextStyle(fontFamily: "Cormorant SC", fontSize: 35.0),"Dados de lançamento"),
                  Text(style: TextStyle(fontFamily: "Caudex", fontSize: 20.0),"Uma versão inacabada de A Bela e a Fera estreou no Festival de cinema de Nova York em 29 de setembro de 1991, antes de seu amplo lançamento em 22 de novembro de 1991. No Brasil o lançamento ocorreu no dia 13 de dezembro de 1991.")
                ],
              ),
              Text(style: TextStyle(fontFamily: "Cormorant SC", fontSize: 35.0), "Elenco/ Personagens"),

              GridView.builder(

                primary: false,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 2,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1/1.1), 
                itemBuilder: (context, count){
                  final item = musicas[count];
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
                        onPressed:() => _launchURL(linkTrailer),
                        child: Text(style: TextStyle(fontSize: 22, fontFamily: "Caudex"), "https://youtu.be/5pXjJ2fEA5Y?si=FxenAZ79wxX8pgkX"),
                        
                        ),
                      Text(style: TextStyle(fontSize: 35, fontFamily: "Cormorant SC"), "Link para o site e rede social"),

                      TextButton(
                        onPressed:() => _launchURL(linkSite),
                        child: Text(style: TextStyle(fontSize: 22, fontFamily: "Caudex"), "Site:  https://disneyanimation.com"),
                      ),

                      Row(
                        children: [
                          IconButton(onPressed: () => _launchURL(linkSocial), 
                          icon:Image.asset("assets/bela_fera_sobre/logo_instagram.png"), ),
                          
                          TextButton(
                            onPressed: () => _launchURL(linkSocial),
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

