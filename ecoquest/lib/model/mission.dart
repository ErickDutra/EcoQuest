class Mission {
  final String titulo;
  final String descricao;
  final String icon;
  final int quantidadeAtual;
  final int quantidadeTotal;
  final String nivelDificuldade;
  final double experience;
  final double points;

  const Mission({
    required this.titulo,
    required this.descricao,
    required this.icon,
    required this.quantidadeAtual,
    required this.quantidadeTotal,
    required this.nivelDificuldade,
    required this.experience,
    required this.points
  });
}
