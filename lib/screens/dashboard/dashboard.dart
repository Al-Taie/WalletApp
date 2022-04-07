import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:second_app/providers/dashboard_provider.dart';
import 'package:second_app/screens/products/products.dart';

import 'line_chart.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late DashboardProvider dashboardProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dashboardProvider = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.75,
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
                    const SizedBox(height: 40),
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
                    const SizedBox(height: 40),
                    const LineChartDashboard()
                  ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                color: const Color(0xffFDFDFE),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "PRODUCT SALES",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        TextButton(
                            onPressed: () => Get.to(() => const Products()),
                            child: const Text(
                              "Show all",
                              style: TextStyle(
                                  color: Color(0xff934962),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: dashboardProvider.data.length,
                        itemBuilder: (context, index) =>
                            AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 300),
                                child: SlideAnimation(
                                  child: FadeInAnimation(
                                    duration: const Duration(milliseconds: 400),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    dashboardProvider.data[index]['name'],
                                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                                  ),
                                                  Text(
                                                    dashboardProvider.data[index]['status'],
                                                    style: const TextStyle(
                                                        color: Color(0xffC0C5CA),
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "\$${dashboardProvider.data[index]['balance'][0]}/\$${dashboardProvider.data[index]['balance'][1]}",
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                  const SizedBox(height: 8,),
                                                  LinearPercentIndicator(
                                                    width: 140.0,
                                                    lineHeight: 3.7,
                                                    percent: (dashboardProvider.data[index]['balance'][0]/dashboardProvider.data[index]['balance'][1]),
                                                    backgroundColor: Colors.grey[300],
                                                    progressColor: const Color(0xffC91946),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          Divider()
                                        ],
                                      ),
                                    ),
                                  ),

                                )
                            ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
