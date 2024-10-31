import 'package:flutter/material.dart';
import '../screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const CategoryItem(this.id, this.title, this.imageUrl, {super.key});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryTripsScreen.screenRoute, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Colors.deepPurple[200],
      borderRadius: BorderRadius.circular(25),
      child: Stack(
        children: [
          // Make the image have the same border radius
          ClipRRect(
            borderRadius: BorderRadius.circular(25), // Match border radius
            child: Image.network(
              imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.35),
              borderRadius: BorderRadius.circular(25), // Match border radius
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}
