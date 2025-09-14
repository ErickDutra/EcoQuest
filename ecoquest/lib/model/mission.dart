class Mission {
  final String id;
  final String titulo;
  final String descricao;
  final String icon;
  final int quantidadeAtual;
  final int quantidadeTotal;
  final String nivelDificuldade;
  final double experience;
  final double points;

 factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      id: json['id'],
      titulo: json['titulo'],
      descricao: json['descricao'],
      icon: json['icon'],
      quantidadeAtual: json['quantidadeAtual'],
      quantidadeTotal: json['quantidadeTotal'],
      nivelDificuldade: json['nivelDificuldade'],
      experience: json['experience'],
      points: json['points'],
    );
  }


  const Mission({
    required this.id,
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

List<Mission> parseMissoes(List<Map<String, dynamic>> jsonList) {
  return jsonList.map((data) => Mission.fromJson(data)).toList();
}