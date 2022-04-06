import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:second_app/screens/products/products.dart';
import 'package:second_app/screens/home/home_screen.dart';
import 'package:second_app/screens/transactions/transaction.dart';

import '../dashboard/dashboard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

enum _SelectedTab { home, transactions, dashboard, products }

class _Home extends State<Home> {
  List screensList = [
    const HomeDefault(),
    const Transactions(),
    const DashBoard(),
    const Products(),
  ];

  var _currentIndex = 0;
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
    _currentIndex = i;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar:  DotNavigationBar(
        enableFloatingNavBar: true,
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        dotIndicatorColor: Colors.black,
        // enableFloatingNavBar: false
        items: [
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
            selectedColor: const Color(0xff002047),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.monetization_on),
            selectedColor: const Color(0xff002047),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.dashboard),
            selectedColor: const Color(0xff002047),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            selectedColor: const Color(0xff002047),
          ),
        ],
      ),
      body: screensList[_currentIndex],
    );
  }
}


