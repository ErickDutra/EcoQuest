import 'package:ecoquest/components/missions_card.dart';
import 'package:ecoquest/model/mission.dart';
import 'package:flutter/material.dart';

class MissionWindow extends StatefulWidget {
  final List<Mission> missoes;
  final String profileId;

  const MissionWindow({
    Key? key,
    required this.missoes,
    required this.profileId,
  }) : super(key: key);

  @override
  State<MissionWindow> createState() => _MissionWindowState();
}

class _MissionWindowState extends State<MissionWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Missões')),
      body: SafeArea(
        child: ListView.builder(
          itemCount: widget.missoes.length,
          itemBuilder: (context, index) {
            final mission = widget.missoes[index];
            return MissionCard(mission: mission, profileId: widget.profileId);
          },
        ),
      ),
    );
  }
}
