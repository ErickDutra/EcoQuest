import 'package:ecoquest/model/mission.dart';
import 'package:ecoquest/model/profile.dart';
import 'package:flutter/material.dart';
import 'missions_card.dart';

class MissionsComponent extends StatefulWidget {
  final List<Mission> missoes;
  final String profileId;
  final VoidCallback? onMissionCompleted;
  final Function(Profile)? onProfileUpdated;

  const MissionsComponent({
    super.key,
    required this.missoes,
    required this.profileId,
    this.onMissionCompleted,
    this.onProfileUpdated,
  });

  @override
  State<MissionsComponent> createState() => _MissionsComponentState();
}

class _MissionsComponentState extends State<MissionsComponent> {
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
                Text('Missões Ativas'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/missions');
                  },
                  child: const Text(
                    'Ver todas  >',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...widget.missoes
                .take(2)
                .map(
                  (missao) => MissionCard(
                    mission: missao,
                    profileId: widget.profileId,
                    onMissionCompleted: widget.onMissionCompleted,
                    onProfileUpdated: widget.onProfileUpdated,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
