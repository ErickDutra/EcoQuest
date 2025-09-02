import 'package:ecoquest/model/mission.dart';
import 'package:flutter/material.dart';

class MissionWindow extends StatefulWidget {
  final List<Mission> missoes;

  const MissionWindow({Key? key, required this.missoes}) : super(key: key);

  @override
  State<MissionWindow> createState() => _MissionWindowState();
}

class _MissionWindowState extends State<MissionWindow> {

     final List<Mission> missoes = [
    Mission(
      titulo: 'Recicle 5 garrafas',
      descricao: 'Leve 5 garrafas PET ao ponto de coleta.',
      icon: '♻️',
      quantidadeAtual: 2,
      quantidadeTotal: 5,
      nivelDificuldade: 'Fácil',
      experience: 100.00,
      points: 10.00
    ),
    Mission(
      titulo: 'Economize energia',
      descricao: 'Desligue as luzes por 3 horas.',
      icon: '⚡',
      quantidadeAtual: 1,
      quantidadeTotal: 3,
      nivelDificuldade: 'Média',
      experience: 100.00,
      points: 10.00
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Missões do Dia'),
      ),
      body: ListView.builder(
        itemCount: widget.missoes.length,
        itemBuilder: (context, index) {
          final mission = widget.missoes[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Image.asset(
                mission.icon,
                width: 40,
                height: 40,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.flag),
              ),
              title: Text(mission.titulo),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mission.descricao),
                  const SizedBox(height: 4),
                  Text(
                    'Progresso: ${mission.quantidadeAtual}/${mission.quantidadeTotal}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Dificuldade: ${mission.nivelDificuldade}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}