class Produto {
  final String documentId;
  final String imagem;
  final String nome;
  final String detalhes;
  final String ingredientes;
  final double preco;
  final double precoPromocional;
  final bool promocao;

  Produto(
    this.documentId,
    this.imagem,
    this.nome,
    this.detalhes,
    this.ingredientes,
    this.preco,
    this.promocao,
    this.precoPromocional,
  );
}
