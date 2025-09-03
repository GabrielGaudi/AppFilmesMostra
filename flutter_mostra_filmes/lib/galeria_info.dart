// ignore_for_file: unnecessary_this

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
