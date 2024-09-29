import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const screenRoute = '/filters ';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters, {Key? key})
      : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isInSummer = false;
  var _isInWinter = false;
  var _isForFamily = false;

  @override
  initState() {
    _isInSummer = widget.currentFilters['summer'] ?? false;
    _isInWinter = widget.currentFilters['Winter'] ?? false;
    _isForFamily = widget.currentFilters['Family'] ?? false;
    super.initState();
  }

  Widget buildSwitchListTile(String title, String subtitle, bool currentValue,
      ValueChanged<bool> updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الفلتره '),
        actions: [
          IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'summer ': _isInSummer,
                  'winter ': _isInWinter,
                  'family ': _isForFamily,
                };
                widget.saveFilters(selectedFilters);
              }),
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'الرحلات الصيفيه فقط',
                  'أظهار الرحلات في فصل الصيف فقط',
                  _isInSummer,
                  (newValue) {
                    setState(() {
                      _isInSummer = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'الرحلات الشتوية فقط',
                  'أظهار الرحلات في فصل الشتاء فقط',
                  _isInWinter,
                  (newValue) {
                    setState(() {
                      _isInWinter = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'العائلات',
                  'أظهار الرحلات للعائلات فقط',
                  _isForFamily,
                  (newValue) {
                    setState(() {
                      _isForFamily = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
