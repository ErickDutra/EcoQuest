import 'package:ecoquest/components/analytic_cards.dart';
import 'package:ecoquest/components/category_component.dart';
import 'package:ecoquest/components/missions_component.dart';
import 'package:ecoquest/model/mission.dart';
import 'package:flutter/material.dart';

class HomeWindow extends StatefulWidget {
  final List<Mission> missoes; 
   final String profileId;

  const HomeWindow({Key? key, required this.missoes, required this.profileId}) : super(key: key);

  @override
  State<HomeWindow> createState() => _HomeWindowState();
}

class _HomeWindowState extends State<HomeWindow> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color.fromARGB(255, 228, 245, 229),
        child: ListView(
          children: [AnalyticCards(), MissionsComponent(missoes: widget.missoes, profileId: widget.profileId,), CategoryComponent()],
        ),
      ),
    );
  }
}
