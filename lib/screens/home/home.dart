import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:second_app/screens/home/home_screen.dart';
import 'package:second_app/screens/products/products.dart';
import 'package:second_app/screens/transactions/transaction.dart';

import '../dashboard/dashboard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

enum _SelectedTab { home, dashboard, transactions, products }

class _Home extends State<Home> {
  static const List screensList = [
    HomeDefault(),
    DashBoard(),
    Transactions(),
    Products(),
  ];

  var _currentIndex = 0;
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() => _selectedTab = _SelectedTab.values[i]);
    _currentIndex = i;
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff002047);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        enableFloatingNavBar: true,
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        dotIndicatorColor: primaryColor,
        // enableFloatingNavBar: false
        items: [
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
            selectedColor: primaryColor,
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.dashboard),
            selectedColor: primaryColor,
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.monetization_on),
            selectedColor: primaryColor,
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            selectedColor: primaryColor,
          ),
        ],
      ),
      body: screensList[_currentIndex],
    );
  }
}
