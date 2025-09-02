import 'package:ecoquest/model/category.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final Category category;
  const CategoryCard({super.key, required this.category});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    final category = widget.category;
    double progresso = category.quantidadeTotal > 0
        ? category.quantidadeAtual / category.quantidadeTotal
        : 0.0;

    return GestureDetector(
      child: SizedBox(
        width: 180,
        height: 110,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(category.icon, style: TextStyle(fontSize: 18)),

                Text(category.title, style: TextStyle(fontSize: 12)),

                Text(
                  '${category.quantidadeAtual}/${category.quantidadeTotal}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                LinearProgressIndicator(
                  value: progresso.clamp(0.0, 1.0),
                  minHeight: 6,
                  backgroundColor: Colors.grey[300],
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
