
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:royal_asymtote_network_user/modules/welcome/logic.dart';

import '../../utiles/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  bool passwordObscured = true;
  bool passwordObscuredConfirmed = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var authController=Get.find<WelcomLogic>();
      
    return 
    Padding(
      padding: EdgeInsets.all(size.height > 770
          ? 64
          : size.height > 670
              ? 32
              : 16),
      child: Center(
        child: Card(
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: size.height *
                (size.height > 770
                    ? 0.7
                    : size.height > 670
                        ? 0.8
                        : 0.9),
            width: 550,
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      SizedBox(
                        width: 30,
                        child: Divider(
                          color: kPrimaryColor,
                          thickness: 2,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      TextField(
                        controller: namecontroller,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          labelText: 'Name',
                          suffixIcon: Icon(
                            Icons.person_outline,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      TextField(
                        controller: emailcontroller,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          suffixIcon: Icon(
                            Icons.mail_outline,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      TextField(
                        controller: passwordcontroller,
                        obscureText: passwordObscured,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passwordObscured = !passwordObscured;
                              });
                            },
                            child: Icon(
                              passwordObscured
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      TextField(
                        controller: confirmpasswordcontroller,
                        obscureText: passwordObscuredConfirmed,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          labelText: 'Confirm Password',
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passwordObscuredConfirmed =
                                    !passwordObscuredConfirmed;
                              });
                            },
                            child: Icon(
                              passwordObscuredConfirmed
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 40,
                      ),

                      GestureDetector(
                        onTap: () {
                        
                          
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.2),
                                spreadRadius: 4,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: 
                              
                               Text(
                                    'Create an account',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                           authController.isLogin=true;
                           authController.update();
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Log In",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: kPrimaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                 
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
 
  }

 
}


