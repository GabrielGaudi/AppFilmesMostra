class Elenco{
  late String nomePersonagem;
  late String linkImagem;

  Elenco(){
    nomePersonagem = "";
    linkImagem = "";
}

  Elenco.criar(this.nomePersonagem, this.linkImagem);

  Elenco.pegarJson(Map<String, dynamic> json)
  : nomePersonagem = json['Nome'] as String,
  linkImagem = json['Imagem'] as String;

  Map<String, dynamic> paraJson() =>{
    'nomePersonagem': nomePersonagem,
    'imagemPersonagem': linkImagem,
  };

}

class Links{
  late Uri trailer;
  late Uri site;
  late Uri social;

  Links(){
    trailer = Uri();
    site = Uri();
    social = Uri();
  }

  Links.criar(this.trailer, this.site, this.social);

  Links.pegarJson(Map<String, dynamic> json)
  : trailer = Links.urlConverter(json['Trailer']),
  site = Links.urlConverter(json['Site']),
  social = Links.urlConverter(json['Rede Social']);

    Map<String, dynamic> paraJson() =>{
    'Trailer': trailer,
    'Site': site,
    'Rede Social' : social
  };

  static Uri urlConverter(String link){
    final convert = Uri.parse(link);
    return convert;
  }

}

class Sobre{
  late String sinopse;
  late String genero;
  late String diretor1;
  late String diretor2;
  late String empresa;
  late String lancamento;

  Sobre(){
  sinopse = "";
  genero = "";
  diretor1 = "";
  diretor2 = "";
  empresa = "";
  lancamento = "";
}

  Sobre.criar(this.sinopse, this.genero, this.diretor1, this.diretor2, this.empresa, this.lancamento);

  Sobre.pegarJson(Map<String, dynamic> json)
  : sinopse = json['Sinopse'] as String,
  genero = json['Genero'] as String,
  diretor1 = json['Diretor1'] as String,
  diretor2 = json['Diretor2'] as String,
  empresa = json['Empresa'] as String,
  lancamento = json['Lancamento'] as String;

  Map<String, dynamic> paraJson() =>{
    'Sinopse' : sinopse,
    'Gênero' : genero,
    'Diretor1' : diretor1,
    'Diretor2' : diretor2,
    'Empresa' : empresa,
    'Lançamento' : lancamento
  };

}