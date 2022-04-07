import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'line_chart.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.8,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.6, 0.1],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xffFD2C21), Color(0xffFF473F)]
                )),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 32),
                    Text(
                        "Overview",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                    Text(
                      "Dashboard",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 32),
                    LineChartSample1()
                  ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
