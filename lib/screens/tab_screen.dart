// import 'package:flutter/material.dart';
// import 'package:travel_app/screens/favorites_screen.dart';
// import '../screens/categories_screen.dart';

// class TabScreen extends StatelessWidget {
//   const TabScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('دليل سياحى '),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.dashboard),
//                 text: 'التصنيفات ',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'المفضله ',
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             CategoriesScreen(),
//             FavoritesScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//  الكود دا لو هضيف تاب من الاعلي

import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import '../widgets/app_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;
  const TabScreen(this.favoriteTrips, {super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, dynamic>> _screens;

  int _selectedScreenIndex = 0;

  @override
  void initState() {
    _screens = [
      {
        'Screen': const CategoriesScreen(),
        'Title': 'تصنيفات الرحلات',
      },
      {
        'Screen': FavoritesScreen(widget.favoriteTrips),
        'Title': 'الرحلات المفضلة',
      },
    ];
    super.initState();
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['Title'] as String),
      ),
      drawer: const AppDrawer(),
      body: _screens[_selectedScreenIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.deepPurple[200],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
