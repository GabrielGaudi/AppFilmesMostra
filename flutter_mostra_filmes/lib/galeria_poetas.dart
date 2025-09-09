import 'package:flutter/material.dart';
import 'package:flutter_mostra_filmes/referencias.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'menu_filmes.dart';
import 'main.dart';


void main(){
  runApp(const GaleriaSociedadePoetas());
}


class GaleriaSociedadePoetas extends StatelessWidget {
  const GaleriaSociedadePoetas({super.key});

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
        centerTitle: true,
        title: Text(style: TextStyle(fontSize: 27, fontFamily: 'Girassol'), textAlign: TextAlign.center,"Galeria de imagens \n Sociedade dos Poetas Mortos"),

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
           child: MasonryGridView.builder(
            controller: controleBarra,
            padding: EdgeInsets.all(16.0),
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: 5,
            itemBuilder: (context, imgNumber) => Padding(
              
              padding: const EdgeInsets.all(7.0),
              child: Image.asset("assets/galeria_poetas/sociedade_poetas_galeria${imgNumber + 1}.jpeg"),
              ),
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