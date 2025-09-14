import 'package:ecoquest/model/mission.dart';
import 'package:ecoquest/services/completMission.dart';
import 'package:flutter/material.dart';

class MissionCard extends StatelessWidget {
  final Mission mission;
  final String profileId; 
 

  const MissionCard({
    super.key,
    required this.mission,
    required this.profileId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(mission.icon),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    mission.titulo,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    mission.nivelDificuldade,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              mission.descricao,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
           
            Row(
              children: [
                Text(
                  'Experiência: ${mission.experience}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Pontos: ${mission.points}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
           
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () => completeMission(profileId, mission.id),
                child: const Text('Completar Missão'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}