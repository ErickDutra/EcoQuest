import 'package:ecoquest/model/profile.dart';
import 'package:flutter/material.dart';

class ProfileWindow extends StatelessWidget {
  final Profile profile;

  const ProfileWindow({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nome = profile.nome;
    final level = profile.level;
    final experience = profile.experience;
    final experienceTotal = (profile.experience > 0) ? (profile.experience * 2) : 100; 
    final pontos = profile.pontos;
    final diasConsecutivos = profile.diasConsecutivos;
    final missoesConcluidas = 0;

    final double progresso = (experienceTotal > 0)
        ? (experience / experienceTotal).clamp(0.0, 1.0)
        : 0.0;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.green[100],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  nome,
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Nível $level',
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text('Experiência: $experience / $experienceTotal',
                              style: const TextStyle(fontSize: 13)),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: progresso,
                              minHeight: 10,
                              backgroundColor: Colors.grey.shade200,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: LayoutBuilder(builder: (context, constraints) {
                  final spacing = 12.0;
                  final itemWidth = (constraints.maxWidth - spacing) / 2;
                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: [
                      SizedBox(
                          width: itemWidth,
                          child: _statTile(
                              Icons.star, 'Pontos Totais', pontos.toString())),
                      SizedBox(
                          width: itemWidth,
                          child: _statTile(Icons.calendar_today,
                              'Dias Consecutivos', diasConsecutivos.toString())),
                      SizedBox(
                          width: itemWidth,
                          child: _statTile(Icons.check_circle,
                              'Missões Concluídas', missoesConcluidas.toString())),
                      SizedBox(
                          width: itemWidth,
                          child:
                              _statTile(Icons.emoji_events, 'Nível Atual', level.toString())),
                    ],
                  );
                }),
              ),
            ),

            const SizedBox(height: 16),

            Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Conquistas',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(child: Icon(Icons.lock, color: Colors.grey)),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Configurações da Conta'),
                    onTap: () {/* navegar para config de conta */},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('Notificações'),
                    onTap: () {/* navegar para notificações */},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.lock),
                    title: const Text('Privacidade'),
                    onTap: () {/* navegar para privacidade */},
                  ),
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.exit_to_app, color: Colors.red),
                            label: const Text('Sair', style: TextStyle(color: Colors.red)),
                            onPressed: () {
                              // implementar logout
                              Navigator.of(context).popUntil((r) => r.isFirst);
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.red.shade200),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statTile(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label, style: const TextStyle(fontSize: 10)),
                Text(value,
                    style:
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }
}