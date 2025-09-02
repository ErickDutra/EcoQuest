import 'package:ecoquest/model/category.dart';
import 'package:flutter/material.dart';
import 'category_card.dart';

class CategoryComponent extends StatelessWidget {
final List<Category> categorias = [
  Category(
    title: 'Reciclagem',
    icon: '♻️',
    quantidadeAtual: 1,
    quantidadeTotal: 2,
  ),
  Category(
    title: 'Energia',
    icon: '⚡',
    quantidadeAtual: 1,
    quantidadeTotal: 2,
  ),
  Category(
    title: 'Água',
    icon: '💧',
    quantidadeAtual: 1,
    quantidadeTotal: 2,
  ),
  Category(
    title: 'Transporte',
    icon: '🚗',
    quantidadeAtual: 1,
    quantidadeTotal: 2,
  ),
];
  CategoryComponent({super.key});

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
            Text(
              'Categorias',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: categorias.length,
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 3, // 3 colunas
  mainAxisSpacing: 12,
  crossAxisSpacing: 12,
  childAspectRatio: 1.1, // ajuste conforme o visual desejado
),
              itemBuilder: (context, index) {
                final cat = categorias[index];
                return CategoryCard(
                  category: cat
                  
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}