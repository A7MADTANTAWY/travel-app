enum Season {
  Winter,
  Spring,
  Summer,
  Autumn,
}

enum TripType {
  Exploration,
  Recovery,
  Activities,
  Therapy,
}

class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> activties;
  final List<String> program;
  final int duration;
  final Season season;
  final TripType tripType;
  final bool isInWinter;
  final bool isInSummar;
  final bool isForFamilies;

  const Trip(
      {required this.id,
      required this.categories,
      required this.imageUrl,
      required this.activties,
      required this.program,
      required this.duration,
      required this.season,
      required this.tripType,
      required this.isInWinter,
      required this.isInSummar,
      required this.title,
      required this.isForFamilies});
}
