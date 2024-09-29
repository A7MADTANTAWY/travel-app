import 'package:flutter/material.dart';
import '../app_data.dart';

// Corrected the import name
import '../widgets/category_iteam.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: Categories_data.map(
        (categoryData) => CategoryItem(categoryData.id, categoryData.title,
            categoryData.imageUrl), // Corrected class name
      ).toList(),
    );
  }
}
