import 'package:ecoquest/model/profile.dart';
import 'package:flutter/material.dart';

class TitleCustom extends StatefulWidget {
  final Profile profile;
  const TitleCustom({super.key, required this.profile});

  @override
  State<TitleCustom> createState() => _TitleCustomState();
}

class _TitleCustomState extends State<TitleCustom> {
  @override
  Widget build(BuildContext context) {
    final perfil = widget.profile;
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0.0),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.only(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/men/1.jpg',
                        ),
                        radius: 28,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                perfil.nome,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Card(
                                color: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  child: Text(
                                    'Nv. ${perfil.level}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text('${perfil.experience}/1500 XP'),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications_none),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5.0),
                child: LinearProgressIndicator(
                  value: (perfil.experience) / 1500,
                  minHeight: 6,
                  backgroundColor: Colors.grey[300],
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('🔥 ${perfil.level} dias'),
                    Text('⭐ ${perfil.pontos} pts'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
