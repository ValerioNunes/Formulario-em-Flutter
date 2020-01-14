import 'itemCardapio.dart';

enum FormaPagamento { DEBITO, CREDITO, A_VISTA }

class  NotaFiscal {

  List<ItemCardapio> itens = new List<ItemCardapio>();
  String cpf;
  FormaPagamento formaPagamento;
  double preco;

  NotaFiscal(this.cpf, this.formaPagamento);

  void addItem(ItemCardapio itemCardapio){
    itens.add(itemCardapio);
  }

  double tarifaDaFormaPsgamento(){

    switch(formaPagamento){
      case FormaPagamento.DEBITO:
          return 1.2;
      case FormaPagamento.CREDITO:
          return 2.4;
      case FormaPagamento.A_VISTA:
          return 0.0;
      default:
        return 0.0;
    }
  }

  double valorPagamento(){

    double total = 0;
    itens.forEach((item){
      total += item.preco;
    });
    preco = total*( 1 + tarifaDaFormaPsgamento()/100.0);
    return preco;
  }

  @override
  String toString() {
    return 'NotaFiscal:\nItens: $itens\nCPF: $cpf\n$formaPagamento\nPreço: $preco';
  }


}