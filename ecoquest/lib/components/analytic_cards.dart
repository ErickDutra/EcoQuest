import 'package:flutter/material.dart';

class AnalyticCards extends StatefulWidget {
  const AnalyticCards({super.key});

  @override
  State<AnalyticCards> createState() => _AnaliticCardsState();
}

class _AnaliticCardsState extends State<AnalyticCards> {
  //TODO: FAZER DEPOIS -- infor profile
  final List<_CardInfo> cards = [
    _CardInfo('Nivel', Icons.emoji_events, Colors.green, '10'),
    _CardInfo('Pontos', Icons.bolt, Colors.blue, '10'),
    _CardInfo('Sequência', Icons.calendar_today, Colors.deepPurple, '10'),
    _CardInfo('Concluídos', Icons.adjust, Colors.deepOrange, '10'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: cards.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing:1,
          crossAxisSpacing: 0,
          childAspectRatio: 1.9,
        ),
        itemBuilder: (context, index) {
          final card = cards[index];
          return Card(
            color: card.color,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          card.infoProfile,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          card.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(3),
                    child: Icon(card.icon, color: Colors.white, size: 40)
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CardInfo {
  final String title;
  final IconData icon;
  final Color color;
  final String infoProfile;
  _CardInfo(this.title, this.icon, this.color, this.infoProfile);
}
