import 'package:ecoquest/model/mission.dart';
import 'package:ecoquest/model/profile.dart';
import 'package:ecoquest/services/completMission.dart';
import 'package:flutter/material.dart';

class MissionCard extends StatefulWidget {
  final Mission mission;
  final String profileId;
  final VoidCallback? onMissionCompleted;
  final Function(Profile)? onProfileUpdated;

  const MissionCard({
    super.key,
    required this.mission,
    required this.profileId,
    this.onMissionCompleted,
    this.onProfileUpdated,
  });

  @override
  _MissionCardState createState() => _MissionCardState();
}

class _MissionCardState extends State<MissionCard> {
  bool _isCompleting = false;

  Future<void> _complete() async {
    setState(() => _isCompleting = true);
    try {
      final updatedProfile = await completeMission(
        widget.profileId,
        widget.mission.id,
      );
      widget.onMissionCompleted
          ?.call(); 
      widget.onProfileUpdated?.call(
        updatedProfile,
      ); 
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Missão completada com sucesso!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Erro ao completar missão: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isCompleting = false);
      }
    }
  }

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
                Text(widget.mission.icon),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.mission.titulo,
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
                    widget.mission.nivelDificuldade,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.mission.descricao,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Text(
                  'Experiência: ${widget.mission.experience}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 16),
                Text(
                  'Pontos: ${widget.mission.points}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),

            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _isCompleting ? null : _complete,
                child: _isCompleting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Completar Missão'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
