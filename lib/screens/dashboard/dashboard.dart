import 'package:flutter/material.dart';

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
            height: MediaQuery.of(context).size.height / 2,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.6, 0.1],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xffFD2C21), Color(0xffFF473F)]
                )),
            child: Column(
                children: const [
                  Text(
                      "Overview",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),
                  )
                ],
            ),
          )
        ],
      ),
    );
  }
}
