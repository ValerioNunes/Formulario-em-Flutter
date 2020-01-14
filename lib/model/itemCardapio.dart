class ItemCardapio {
  int id;
  double preco;
  String nome;
  ItemCardapio(this.preco, this.nome, this.id);

  @override
  String toString() {
    return '$nome';
  }

}