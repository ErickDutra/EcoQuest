import 'package:ecoquest/components/missions_card.dart';
import 'package:ecoquest/model/mission.dart';
import 'package:flutter/material.dart';
import 'package:ecoquest/model/profile.dart';
import 'package:ecoquest/services/missoes_completas.dart';

class MissionWindow extends StatefulWidget {
  final List<Mission> missoes;
  final String profileId;
  final Function(Profile)? onProfileUpdated;

  const MissionWindow({
    Key? key,
    required this.missoes,
    required this.profileId,
    this.onProfileUpdated,
  }) : super(key: key);

  @override
  State<MissionWindow> createState() => _MissionWindowState();
}

class _MissionWindowState extends State<MissionWindow> {
  bool _showCompleted = false;
  List<Mission> _availableMissions = [];
  List<Mission> _completedMissions = [];
  bool _loadingAvailable = true;
  bool _loadingCompleted = false;

  @override
  void initState() {
    super.initState();
    _loadAvailableMissions();
  }

  Future<void> _loadAvailableMissions() async {
    try {
      final missions = await getAvailableMissions(widget.profileId);
      setState(() {
        _availableMissions = missions;
        _loadingAvailable = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() => _loadingAvailable = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar missões disponíveis: $e')),
        );
      }
    }
  }

  Future<void> _loadCompletedMissions() async {
    if (_completedMissions.isNotEmpty) return;
    setState(() => _loadingCompleted = true);
    try {
      final missions = await getCompletedMissions(widget.profileId);
      setState(() {
        _completedMissions = missions;
        _loadingCompleted = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() => _loadingCompleted = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao carregar missões completadas: $e')),
        );
      }
    }
  }

  void _onMissionCompleted() {
    _loadAvailableMissions();
    _loadCompletedMissions();
  }

  void _onProfileUpdated(Profile updatedProfile) {
    widget.onProfileUpdated?.call(updatedProfile);
  }

  @override
  Widget build(BuildContext context) {
    final displayMissions = _showCompleted
        ? _completedMissions
        : _availableMissions;
    final isLoading = _showCompleted ? _loadingCompleted : _loadingAvailable;

    return Scaffold(
      appBar: AppBar(title: const Text('Missões')),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _showCompleted = false),
                  child: const Text('Disponíveis'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() => _showCompleted = true);
                    _loadCompletedMissions();
                  },
                  child: const Text('Completadas'),
                ),
              ],
            ),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: displayMissions.length,
                      itemBuilder: (context, index) {
                        final mission = displayMissions[index];
                        return MissionCard(
                          mission: mission,
                          profileId: widget.profileId,
                          onMissionCompleted: _onMissionCompleted,
                          onProfileUpdated: _onProfileUpdated,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
