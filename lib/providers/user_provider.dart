
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{

  List<Map<String, dynamic>> cardData = [
    {
      'title': "Incomes",
      'balance': 348.02,
      'percent': 75,
      'color': const Color(0xff2dc253)
    },
    {
      'title': "Expenses",
      'balance': 125.34,
      'percent': 65,
      'color': const Color(0xffE90346)
    },
    {
      'title': "Balance",
      'balance': 35.91,
      'percent': 40,
      'color': const Color(0xff6F73B4)
    }
  ];

  List<Map<String, dynamic>> data = [
    {
      'name': 'Connor Davidson',
      'status': 'Received',
      'balance': '\$28.4',
      'color': 0xff67CAAD,
      'image': 'https://cdn.dribbble.com/users/3281732/screenshots/6629190/samji_illustrator__.jpg?compress=1&resize=400x300&vertical=top',
    },
    {
      'name': 'Airline Ticket',
      'status': 'Vise *** 3451',
      'balance': '-\$172.05',
      'color': 0xffA84867,
      'image': 'https://cdn.dribbble.com/users/3281732/screenshots/6766582/samji_illusstrator_4x.jpeg?compress=1&resize=400x300',
    },
    {
      'name': 'Connor Davidson',
      'status': 'Vise *** 3451',
      'balance': '-\$100.00',
      'color': 0xffA84867,
      'image': 'https://design4users.com/wp-content/uploads/2019/10/autumn-illustration-digital-art-1024x768.jpg.pagespeed.ce.iSEn_t8_b9.jpg',
    },
    {
      'name': 'Internet',
      'status': 'Vise *** 3451',
      'balance': '-\$172.05',
      'color': 0xffA84867,
      'image': 'https://i.pinimg.com/originals/d8/1d/a3/d81da3d8886399f055b0ae6e3b66108c.jpg',
    },
    {
      'name': 'Gas & Light',
      'status': 'Vise *** 3451',
      'balance': '-\$172.05',
      'color': 0xffA84867,
      'image': 'https://design4users.com/wp-content/uploads/2019/10/autumn-illustration-digital-art.jpg',
    },
    {
      'name': 'Gas & Light',
      'status': 'Vise *** 3451',
      'balance': '-\$172.05',
      'color': 0xffA84867,
      'image': 'https://design4users.com/wp-content/uploads/2019/10/autumn-illustration-digital-art.jpg',
    },
    {
      'name': 'Shopping',
      'status': 'Vise *** 3451',
      'balance': '-\$13.01',
      'color': 0xffA84867,
      'image': "https://cdn.dribbble.com/users/3281732/screenshots/6766582/samji_illusstrator_4x.jpeg?compress=1&resize=400x300",
    },
  ];

  void addElement() {
    data.add({
      'name': 'Connor Davidson',
      'status': 'Received',
      'balance': '\$28.4',
      'color': 0xff67CAAD,
      'image': 'https://cdn.dribbble.com/users/3281732/screenshots/6629190/samji_illustrator__.jpg?compress=1&resize=400x300&vertical=top',
    });
    notifyListeners();
  }

  void removeAt(int index) {
    data.removeAt(index);
    notifyListeners();
  }
}