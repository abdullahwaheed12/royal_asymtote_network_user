import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/welcome/view.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // routes: {
      //   '/login': (_) => SuccessScreen(),
      //   '/signup': (_) => CancelPayment(),
      //   '/dashboard': (_) => CancelPayment(),
      // },
      title: 'Versabatt Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.indigo),
      home: const WelcomePage(),
    );
  }
}
