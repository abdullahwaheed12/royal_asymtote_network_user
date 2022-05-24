import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'dart:math' as math;

class SginUpLogic extends GetxController {
  
  ///-------- controller
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  bool passwordObscured = true;
  bool passwordObscuredConfirmed = true;


  ///---random-string-open
  String chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  String charsForOtp = '1234567890';
  math.Random rnd = math.Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  String getRandomOtp(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => charsForOtp.codeUnitAt(rnd.nextInt(charsForOtp.length))));


}