import 'package:flutter/material.dart';
import 'package:flutter_mostra_filmes/bela_fera_sobre.dart';
import 'main.dart';
import 'referencias.dart';


void main(){
  runApp(const MenuFilmesPagina());
}

class MenuFilmesPagina extends StatelessWidget {
  const MenuFilmesPagina({super.key});

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: (){
            Navigator.pop(context);
            }
        ),
        title: Text(style: TextStyle(fontFamily: "Girassol", fontSize: 40),"Filmes"),
        centerTitle: true,
      ),

      body: Scrollbar(
        controller: controleBarra,
        thumbVisibility: true,
        interactive: true,
        trackVisibility: true,
        child: GridView.count(
          controller: controleBarra,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
          children: [
            IconButton(icon: Image.asset("assets/cartazes/bela_fera_cartaz.png"), onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder:
                (context) => const BelaFeraSobre()),
              );},
            ),
            IconButton(icon: Image.asset("assets/cartazes/jumanji_cartaz.png"), onPressed: (){},),
            IconButton(icon: Image.asset("assets/cartazes/harry_cartaz.png"), onPressed: (){},),
            IconButton(icon: Image.asset("assets/cartazes/estomago_cartaz.png"), onPressed: (){},),
            IconButton(icon: Image.asset("assets/cartazes/sociedade_poetas_cartaz.png"), onPressed: (){},),
          ],
        ),
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

