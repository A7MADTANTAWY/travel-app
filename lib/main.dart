import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './screens/filter_screen.dart';
import './screens/tab_screen.dart';
import './screens/trip_details_screen.dart';

import './screens/category_trips_screen.dart';
import './app_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String, bool> _filters = {
    'summer ': false,
    'winter ': false,
    'family ': false,
  };
  List<Trip> _availableTrips = Trips_data;
  List<Trip> _favoriteTrips = [];

  void _changeFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummar != true) {
          return false;
        }
        if (_filters['Winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['Families'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final existingIndex =
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isFovarite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale("ar", "AE")],
      title: 'Traveling ',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,

        primarySwatch: Colors.deepPurple,
        // accentColor :Colors.amber,

        // تغيير لون الخلفية إلى الرمادي
        scaffoldBackgroundColor: Colors.grey[300],

        // تخصيص شكل الشريط العلوي (AppBar)
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple[200], // اللون البنفسجي للشريط العلوي
          foregroundColor: Colors.white, // اللون الأبيض للنص في AppBar
        ),

        fontFamily: 'Cairo ',
        textTheme: ThemeData.light().textTheme.copyWith(
            //     headline5:TextStyle(
            //       color: Colors.deepPurple,
            //       fontSize: 24,
            //        fontFamily: 'Cairo',
            //       fontWeight: FontWeight.bold,

            //       fontFamily: 'Cairo ',
            //   textTheme: ThemeData.light().textTheme.copyWith(
            //     headline6 :TextStyle(
            //       color: Colors.deepPurple,
            //       fontSize: 26,
            //       fontFamily: 'Cairo',
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(_favoriteTrips),
        CategoryTripsScreen.screenRoute: (ctx) =>
            CategoryTripsScreen(_availableTrips),
        TripDetailsScreen.screenRoute: (ctx) =>
            TripDetailsScreen(_manageFavorite , _isFovarite ),
        FilterScreen.screenRoute: (ctx) =>
            FilterScreen(_filters, _changeFilter),
      },
    );
  }
}
