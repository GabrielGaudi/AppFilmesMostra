/*class Links{
  late String trailer;
  late String site;
  late String social;

  Links(){
    trailer = "";
    site = "";
    social = "";
  }

  Links.criar(this.trailer, this.site, this.social);

  Links.pegarJson(Map<String, dynamic> json)
  : trailer = json['linkTrailer'] as String,
  site = json['linkSite'] as String,
  social = json['linkSocial'] as String;

    Map<String, dynamic> paraJson() =>{
    'linkTrailer': trailer,
    'linkSite': site,
    'linkSocial' : social
  };

  /*static Uri urlConverter(String link){
    final convert = Uri.parse(link);
    return convert;
  }*/

}*/

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
  : trailer = Links.urlConverter(json['linkTrailer']),
  site = Links.urlConverter(json['linkTrailer']),
  social = Links.urlConverter(json['linkTrailer']);

    Map<String, dynamic> paraJson() =>{
    'linkTrailer': trailer,
    'linkSite': site,
    'linkSocial' : social
  };

  static Uri urlConverter(String link){
    final convert = Uri.parse(link);
    return convert;
  }

}