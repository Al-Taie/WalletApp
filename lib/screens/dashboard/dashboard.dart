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
                  children: [
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                "Overview",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16
                              ),
                            ),
                            const Text(
                              "Dashboard",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage("https://cdn.dribbble.com/users/3281732/screenshots/6766582/samji_illusstrator_4x.jpeg?compress=1&resize=200x100")
                              )
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 32),
                    const LineChartDashboard()
                  ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
