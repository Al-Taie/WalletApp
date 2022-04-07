import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:second_app/providers/user_provider.dart';
import 'package:second_app/screens/home/card_balance.dart';

import '../transactions/transaction.dart';

class HomeDefault extends StatefulWidget {
  const HomeDefault({Key? key}) : super(key: key);

  @override
  State<HomeDefault> createState() => _HomeDefaultState();
}

class _HomeDefaultState extends State<HomeDefault> {
  late UserProvider userProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProvider = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var avatarImage =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSANcvpiSL9SxOHD3D2SMYzi4mH4Q6HCiH2c9iJLopaJQVLiZwhHo6lMPNEUeJV3f_iJik&usqp=CAU";

    return Column(
      children: [
        Container(
          height: 340.0,
          width: screenWidth,
          color: const Color(0xff002047),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 48, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 42,
                    width: screenWidth * 0.75,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          Expanded(
                              child: TextField(
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                hintText: "Search",
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image:
                            DecorationImage(image: NetworkImage(avatarImage))),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 48, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "My Wallet",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  IconButton(
                      onPressed: () => userProvider.addElement(),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                  const Text(
                    "\$385",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                "27 Nov 2018",
                style: TextStyle(
                    color: Color(0xff607192), fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) =>
                      AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 150),
                          child: SlideAnimation(
                            child: FadeInAnimation(
                              duration: const Duration(milliseconds: 100),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16, bottom: 8),
                                child: CardBalance(
                                  title: userProvider.cardData[index]['title'],
                                  color: userProvider.cardData[index]['color'],
                                  balance: userProvider.cardData[index]['balance'],
                                  percent: userProvider.cardData[index]['percent'],

                                ),
                              ),
                            ),
                          )),
                ),
              ),
            ),
          ]),
        ),
        Expanded(
          child: Container(
            color: const Color(0xffF8F9FD),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
              child: Expanded(
                child: Container(
                  color: const Color(0xffFDFDFE),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "TRANSACTIONS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19
                            ),
                          ),
                          TextButton(
                              onPressed: () => Get.to(() => const Transactions()),
                              child: const Text(
                                "Show all",
                                style: TextStyle(
                                    color: Color(0xff934962),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ))
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: userProvider.data.length,
                          itemBuilder: (context, index) =>
                              AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 300),
                                  child: SlideAnimation(
                                    child: FadeInAnimation(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 48,
                                                  width: 48,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(userProvider.data[index]['image']))),
                                                ),
                                                IconButton(onPressed: () => userProvider.removeElement(index),
                                                    icon: const Icon(Icons.delete)),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      userProvider.data[index]['name'],
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16
                                                      ),
                                                    ),
                                                    Text(
                                                      userProvider.data[index]['status'],
                                                      style: const TextStyle(
                                                          color: Color(0xffC0C5CA),
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.zero,
                                              child: Text(
                                                userProvider.data[index]['balance'],
                                                style: TextStyle(
                                                    color: Color(userProvider.data[index]['color']),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}