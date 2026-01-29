import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget Function(bool) getSignValue = (bool value) {
      if (value == true) {
        return const Icon(Icons.check, color: Colors.green);
      }
      return const Icon(Icons.close, color: Colors.red);
    };
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        children: [
          for (final meal in meals)
            Container(
              padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
              margin: const EdgeInsets.only(bottom: 12.0),
              color: Colors.grey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.0,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Image(
                      image: NetworkImage(meal.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    meal.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8.0),
                    ),

                    child: Wrap(
                      spacing: 8.0,
                      children: [
                        Text(
                          'Ingridients:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        for (final ingridient in meal.ingredients)
                          Text(
                            ingridient,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        Text(
                          'Steps:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.tealAccent,
                          ),
                        ),
                        ...meal.steps
                            .asMap()
                            .entries
                            .map(
                              (entry) => Text(
                                '${entry.key + 1}. ${entry.value}',
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 16.0,
                    runSpacing: 8.0,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Gluten-free: '),
                          getSignValue(meal.isGlutenFree),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Lactose-free: '),
                          getSignValue(meal.isLactoseFree),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Vegan: '),
                          getSignValue(meal.isVegan),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Vegetarian: '),
                          getSignValue(meal.isVegetarian),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
