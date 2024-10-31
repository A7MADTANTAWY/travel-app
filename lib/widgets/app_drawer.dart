import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.deepPurple,
            child: const Text(
              'الرحلات ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          newMethod('الرحلات', Icons.card_travel, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          newMethod('الفلتره', Icons.filter_list, () {
            Navigator.of(context)
                .pushReplacementNamed(FilterScreen.screenRoute);
          }),
        ],
      ),
    );
  }

  Widget newMethod(String title, IconData icon, Function onTapLink) {
    return ListTile(
      leading: Icon(
        icon, // Use the icon passed as a parameter
        size: 30,
        color: Colors.black,
      ),
      title: Text(
        title, // Use the title passed as a parameter
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => onTapLink(), // Call the function correctly
    );
  }
}
