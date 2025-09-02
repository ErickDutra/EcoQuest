import 'package:ecoquest/model/mission.dart';
import 'package:flutter/material.dart';
import 'missions_card.dart';

class MissionsComponent extends StatefulWidget {
  const MissionsComponent({super.key});

  @override
  State<MissionsComponent> createState() => _MissionsComponentState();
}

class _MissionsComponentState extends State<MissionsComponent> {
  // Exemplo de lista de missões
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
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Missões Ativas'
                ),
                TextButton(
                  onPressed: () {
                    // ação ao clicar em "Ver mais"
                  },
                  child: const Text('Ver todas  >',
                  style:TextStyle(color:Colors.green
                  ) 
                  ,),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...missoes.take(2).map((missao) => MissionCard(mission: missao)),
          ],
        ),
      ),
    );
  }
}