import 'package:flutter/material.dart';
import 'package:flutter_mostra_filmes/galeria_estomago.dart';
import 'package:flutter_mostra_filmes/galeria_harry_potter.dart';
import 'package:flutter_mostra_filmes/galeria_jumanji.dart';
import 'galeria_poetas.dart';
import 'menu_filmes.dart';
import 'referencias.dart';
import 'galeria_bela.dart';



void main() {
  runApp(const PaginaInicial());
}

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InicioPagina(),
    );
  }
}

class InicioPagina extends StatelessWidget {
  const InicioPagina({super.key});

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
      
      body: Scrollbar(
        controller: controleBarra,
        thumbVisibility: true,
        interactive: true,
        trackVisibility: true,
        child: ListView(
          controller: controleBarra,
          padding: EdgeInsets.only(left: 5.0, right: 7.5),
          children: [
            IconButton(icon: Image.asset("assets/imagens_principal/bela_fera_principal.png"), onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => const GaleriaPagina()));},),
            IconButton(icon: Image.asset("assets/imagens_principal/jumanji_principal.png"), onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => const GaleriaJumanji()));},),
            IconButton(icon: Image.asset("assets/imagens_principal/harry_principal.png"), onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => const GaleriaHP()));},),
            IconButton(icon: Image.asset("assets/imagens_principal/estomago_principal.png"), onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => const GaleriaEstomago()));},),
            IconButton(icon: Image.asset("assets/imagens_principal/sociedade_poetas_principal.png"), onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => GaleriaSociedadePoetas()));},),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int index) {
          _navegacao(context, index);
        },
        selectedIndex: 1,
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