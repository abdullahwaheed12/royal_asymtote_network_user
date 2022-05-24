import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import '../../utiles/constants.dart';
import '../login/view.dart';
import '../sign_up/view.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  var logic = Get.put(WelcomLogic());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Scaffold(body: GetBuilder<WelcomLogic>(builder: (controller) {
        return Container(
          color: Colors.blue,
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: size.width / 2,
                    color: kPrimaryColor,
                  ),
                  Container(
                      height: double.infinity,
                      width: size.width / 2,
                      color: Colors.white),
                ],
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [],
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (widget, animation) =>
                    ScaleTransition(child: widget, scale: animation),
                child: controller.isLogin ? const LogIn() : const SignUp(),
              ),
            ],
          ),
        );
      })),
    );
  }
}
