import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../welcome/logic.dart';
import '../../utiles/constants.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);
  

  

  @override
  _LogInState createState() => _LogInState();
}

@override
void initState() {
}

class _LogInState extends State<LogIn> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController forgotPasswordController = TextEditingController();

  bool passwordObscured = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var authController=Get.find<WelcomLogic>();

    return Padding(
      padding: EdgeInsets.all(size.height > 770
          ? 64
          : size.height > 670
              ? 32
              : 16),
      child: Center(
        child: Card(
          elevation: 4,
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
            width: 500,
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LOG IN",
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
                        height: 32,
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
                        height: 32,
                      ),

                      TextField(
                        controller: passwordcontroller,
                        obscureText: passwordObscured,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          suffixIcon: InkWell(
                            onTap: () {
                              passwordObscured = !passwordObscured;
                              setState(() {});
                            },
                            child: Icon(
                              passwordObscured
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        title: const Text("Forget Password?"),
                                        content: TextField(
                                          controller: forgotPasswordController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  'Please enter email that you used while registration.'),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                if (forgotPasswordController
                                                    .text.isEmpty) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          'please enter email address!',
                                                      toastLength:
                                                          Toast.LENGTH_LONG);
                                                  return;
                                                }

                                                FirebaseAuth.instance
                                                    .sendPasswordResetEmail(
                                                        email:
                                                            forgotPasswordController
                                                                .text)
                                                    .then((value) {
                                                  Navigator.pop(context);
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          'Please check your email we have sent an email.',
                                                      toastLength:
                                                          Toast.LENGTH_LONG);
                                                });
                                              },
                                              child: const Text("Send")),
                                        ],
                                      );
                                    });
                              },
                              child: Text(
                                'Forgot Password ?',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                ),
                              )),
                        ],
                      ),

                      const SizedBox(
                        height: 60,
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
                            child: Text(
                                    'Log in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      //actionButton("Log In"),
                      const SizedBox(
                        height: 20,
                      ),
                    
                      const SizedBox(
                        height: 32,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "You do not have an account?",
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
                               authController.isLogin=false;
                           authController.update();
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Sign Up",
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
