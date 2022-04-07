

import 'package:flutter/material.dart';

class CardBalance extends StatelessWidget {
  final String title;
  final Color color;
  final int percent;
  final double balance;

  const CardBalance({Key? key,
    required this.title,
    required this.percent,
    required this.balance,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 8),
              child: Stack(
                children: [
                  Positioned(
                    child: Text(
                      "$percent",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    left: 10,
                    top: 10,
                  ),
                  CircularProgressIndicator(
                    value: percent / 100,
                    strokeWidth: 6,
                    valueColor: AlwaysStoppedAnimation(color),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Color(0xff607192), fontSize: 12)),
                  Text("\$$balance",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
            )
          ],
        ));
  }
}
