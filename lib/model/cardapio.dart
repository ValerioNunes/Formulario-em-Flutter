import 'package:topicos1atv2/model/itemCardapio.dart';

class Cardapio{

  static List<ItemCardapio> getItens(){
    List<ItemCardapio> itens =  new List<ItemCardapio>();
    itens.add(ItemCardapio(12.30,"Hambúrguer",1));
    itens.add(ItemCardapio(2.50,"Refrigerante",2));
    itens.add(ItemCardapio(7.0,"Batata",3));
    itens.add(ItemCardapio(10.0,"Cerveja",3));
    return itens;
  }

  static getItemId(int id){
    var item = getItens().firstWhere((i){
      return i.id == id;
    });
    return item;
  }
}