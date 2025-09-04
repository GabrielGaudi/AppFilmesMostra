import 'package:flutter/material.dart';
import 'menu_filmes.dart';
import 'main.dart';


void main(){
  runApp(const ReferenciasFilmesPagina());
}

class ReferenciasFilmesPagina extends StatefulWidget {
  const ReferenciasFilmesPagina({super.key});

  @override
  ReferenciasPg createState() => ReferenciasPg();
}

class ReferenciasPg extends State<ReferenciasFilmesPagina>{

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
  Widget build(BuildContext context) {
    final ScrollController controleBarra = ScrollController();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,

        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: (){
            Navigator.pop(context);
            }
        ),
          title: Text(style: TextStyle(fontSize: 27, fontFamily: 'Girassol'), textAlign: TextAlign.center, "Os Filmes \n e o nosso jogo")
        ),


      body: Scrollbar(
        controller: controleBarra,
        thumbVisibility: true,
        interactive: true,
        trackVisibility: true,
          child: ListView(
            controller: controleBarra,
            padding: EdgeInsets.all(8.0),
            children: [
              
              Column(
                spacing: 30.0,

                children: [
                  Image.asset("assets/referencias/bela_fera_ref_salao.png", height: 250,),
                  Image.asset("assets/referencias/bela_fera_ref_castelo.png", height: 250,),
                  Text(style: TextStyle(fontFamily: "Girassol", fontSize: 20), textAlign: TextAlign.center, "A arquitetura do castelo de “A Bela e a Fera inspirou alguns cenários em “A Jornada da Rosa”, como a igreja, onde acontece o final do jogo"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Image.asset("assets/referencias/bela_fera_ref_rosa.png", height: 250,),
                  Image.asset("assets/referencias/bela_fera_ref_fera.png", height: 250,),
                ],
              ),
              Column(
                spacing: 40.0,
                children: [
                  Text(style: TextStyle(fontFamily: "Girassol", fontSize: 20), textAlign: TextAlign.center, "O jogo também usa alguns elementos da narrativa do filme, como a rosa, que está retratada na barra de vida do jogador e no ícone da última fase no mapa. Além disso, no final, a protagonista descobre que seu amigo foi transformado em uma fera, similar ao pesonagem do filme."),
                  Image.asset("assets/referencias/jumanji_ref_tabuleiro.png"),
                  Text(style: TextStyle(fontFamily: "Girassol", fontSize: 20), textAlign: TextAlign.center, "O tabuleiro que aparece em “Jumanji”(a versão original) trouxe a ideia para um tabuleiro no jogo, que mostra o progresso do jogador, sendo usado para avançar entre as fases."),
                  Image.asset("assets/referencias/harry_ref_labirinto.png"),
                  Text(style: TextStyle(fontFamily: "Girassol", fontSize: 20), textAlign: TextAlign.center, "O último desafio do Torneio Tribruxo em “Harry Potter e o Cálice de Fogo se tornou a base para o penúltimo nível do jogo, onde o jogador atravessa um labirinto de plantas, buscando chegar ao centro, onde se esconde o grande mistério atrás do desaparecimento de seu amigo."),
                  Image.asset("assets/referencias/harry_ref_banheiro.png"),
                  Text(style: TextStyle(fontFamily: "Girassol", fontSize: 20), textAlign: TextAlign.center, "Durante sua busca por respostas, Lisbela acaba em um banheiro abandonado inspirado no banheiro de Hogwarts que abriga a fantasma “Murta que Geme”. "),
                  Image.asset("assets/referencias/estomago_ref_cozinha.png"),
                  Text(style: TextStyle(fontFamily: "Girassol", fontSize: 20), textAlign: TextAlign.center, "A cozinha bagunçada da escola de Lisbela e Luis vem da cozinha do filme “Estômago”"),
                  Image.asset("assets/referencias/sociedade_poetas_ref_escola.png"),
                  Text(style: TextStyle(fontFamily: "Girassol", fontSize: 20), textAlign: TextAlign.center, "O ambiente escolar do jogo vem da escola de “Sociedade dos Poetas Mortos”, com alguns elementos da escola Hogwarts de “Harry Potter”. O enredo do jogo, que envolve o melhor amigo de Lisbela sendo maltratado pelo pai, também toma inspiração da narrativa do filme, principalmente de seu final trágico"),
                ],
              )
              
            ]
          )

      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int index) {
          _navegacao(context, index);
        },
        selectedIndex: 2,
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