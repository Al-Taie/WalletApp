

import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  List<Map<String, dynamic>> data = [
    {
      'name': 'Harry Poster',
      'status': 'Release 12. 12. 2015',
      'balance': [354, 3200],
    },
    {
      'name': '101 Theory Book',
      'status': 'Release 10. 1. 2016',
      'balance': [136, 200],
    },
    {
      'name': 'Skylines',
      'status': 'Release 20. 11. 2014',
      'balance': [89, 100],
    },
    {
      'name': 'Clouds & Sky 3',
      'status': 'Release 20. 5. 2015',
      'balance': [58, 300],
    },
    {
      'name': 'Super Man',
      'status': 'Release 11. 11. 2011',
      'balance': [359, 775],
    },
    {
      'name': 'Spider Man',
      'status': 'Release 9. 7. 2019',
      'balance': [150, 150],
    },
  ];

}