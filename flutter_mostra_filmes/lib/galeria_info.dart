class Elenco{
  late String nomePersonagem;
  late String linkImagem;

  Elenco(){
    nomePersonagem = '';
    linkImagem = '';
}

  Elenco.criar(this.nomePersonagem, this.linkImagem);

  Elenco.pegarJson(Map<String, dynamic> json):
  nomePersonagem = json['nomePersonagem'] as String,
  linkImagem = json['imagemPersonagem'] as String;

  Map<String, dynamic> paraJson() =>{
    'nomePersonagem': nomePersonagem,
    'imagemPersonagem': linkImagem,
  };

}
