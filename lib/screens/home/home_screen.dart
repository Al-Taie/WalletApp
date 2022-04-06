

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:second_app/providers/user_provider.dart';

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
          height: 300.0,
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
                        children: const [
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          Expanded(
                              child: TextField(
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  border: InputBorder.none,
                                ),
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
                        image: DecorationImage(
                            image: NetworkImage(avatarImage))),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 16.0, top: 48, right: 16.0),
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
                      icon: const Icon(Icons.add, color: Colors.white,)
                  )
                  ,
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
                         child: myCard(index),
                      ),
                    )
                )
                ,
              ),
            ),
          ]),
        ),
        Expanded(
          child: Container(
            color: const Color(0xffF8F9FD),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: const Color(0xffFDFDFE),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "TRANSACTIONS",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ),
                              TextButton(
                                  onPressed: () => Get.to(() => const Transactions()),
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
                              itemCount: userProvider.data.length,
                              itemBuilder: (context, index) =>
                                  AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration: const Duration(milliseconds: 300),
                                      child: SlideAnimation(
                                        child: FadeInAnimation(
                                          duration: const Duration(milliseconds: 400),
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
                                                              image: NetworkImage(userProvider.data[index]['image'])
                                                          )
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () => userProvider.removeElement(index),
                                                        icon: const Icon(Icons.delete)
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          userProvider.data[index]['name'],
                                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                                        ),
                                                        Text(
                                                          userProvider.data[index]['status'],
                                                          style: const TextStyle(
                                                              color: Color(0xffC0C5CA),
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 14),
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
                                                        fontSize: 18),
                                                  ),
                                                )
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
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

Widget myCard(int index) {
  List<Map<String, dynamic>> data = [
    {
      'title': "Incomes",
      'price': "\$348.02",
      'value': "75",
      'color': 0xffD3FF88
    },
    {
      'title': "Expenses",
      'price': "\$125.34",
      'value': "65",
      'color': 0xffE90346
    },
    {
      'title': "Balance",
      'price': "\$35.91",
      'value': "40",
      'color': 0xff6F73B4
    }
    ];

  return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
      child: Container(
          height: 72,
          width: 148,
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
                        data[index]['value'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      left: 10,
                      top: 10,
                    ),
                    CircularProgressIndicator(
                      value: double.parse(data[index]['value']) / 100,
                      strokeWidth: 6,
                      valueColor: AlwaysStoppedAnimation(Color(data[index]['color'])),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data[index]['title'],
                        style:
                        const TextStyle(color: Color(0xff607192), fontSize: 12)),
                    Text(data[index]['price'],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                  ],
                ),
              )
            ],
          )));
}
