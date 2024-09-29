import 'package:flutter/material.dart';
import '../screens/trip_details_screen.dart';
import '../models/trip.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Season season;
  final TripType tripType;

  const TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.season,
    required this.tripType,
  });

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء ';
      case Season.Spring:
        return 'ربيع ';
      case Season.Summer:
        return 'صيف ';
      case Season.Autumn:
        return 'خريف ';
      default:
        return 'غير معروف ';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return 'استكشاف ';
      case TripType.Recovery:
        return 'نقاهة ';
      case TripType.Activities:
        return 'انشطة ';
      case TripType.Therapy:
        return 'معالجة ';
      default:
        return 'غير معروف ';
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context).pushNamed(
      TripDetailsScreen.screenRoute,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Change here: Allow the gradient to cover the entire image
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.8),
                        ],
                        stops: const [0.6, 1],
                      ),
                    ),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.today,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 5),
                      Text('$duration أيام '),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.wb_sunny,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 5),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.family_restroom,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 5),
                      Text(tripTypeText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
