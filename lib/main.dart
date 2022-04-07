import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:second_app/providers/dashboard_provider.dart';
import 'package:second_app/providers/user_provider.dart';
import 'package:second_app/screens/dashboard/dashboard.dart';
import 'package:second_app/screens/home/home.dart';
import 'package:second_app/screens/intro/intro.dart';

void main() {
  Get.config(defaultTransition: Transition.cupertino);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],
      child: GetMaterialApp(
        title: 'Introduction screen',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: Home(),
      ),
    );
  }
}
