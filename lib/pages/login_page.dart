import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_code/components/my_button.dart';
import 'package:vikn_code/components/my_textfield.dart';
import 'package:vikn_code/pages/sales_list.dart';
import 'package:vikn_code/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({
    super.key,
  });

  // final _loginKey = GlobalKey();

  void login(BuildContext context) async {
    final AuthService authService = AuthService();

    final user = await authService.login(
        usernameController.text, passwordController.text);
    print(user);
    if (user != null) {
      Get.to(const SalesList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          _backgroundDesign(context),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Container(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset("assets/lang.png"),
                    const InkWell(child: Text("English"))
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Login to your vikn account",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          MyTextField(
                            controller: usernameController,
                            assetName: "assets/user.png",
                            obscureText: false,
                            hintText: "Username",
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35.0),
                            child: Divider(
                              height: 1,
                            ),
                          ),
                          MyTextField(
                            controller: passwordController,
                            assetName: "assets/key.png",
                            sicon: Icons.visibility_outlined,
                            obscureText: true,
                            hintText: "Password",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    const InkWell(
                      //todo ontap
                      child: Text(
                        "Forgotten Password?",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff0A9EF3)),
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    MyButton(
                      onTap: () async {
                        login(context);

                        //controller.authService.login(controller.usernameController.toString(), controller.passwordController);
                        // Get.to(const SalesList());
                      },
                      text: "Sign in",
                    ),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Don’t have an Account?",
                        style: TextStyle(fontSize: 15),
                      ),
                      InkWell(
                        child: Text(
                          "Sign up now!",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff0A9EF3)),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    ));
  }

  Widget _backgroundDesign(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width / 2.3,
            decoration: const BoxDecoration(
                color: Color(0xffEEF223), shape: BoxShape.circle),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width / 2.2,
            decoration: const BoxDecoration(
                color: Color(0xff00D0FE), shape: BoxShape.circle),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width / 2.1,
            decoration: const BoxDecoration(
                color: Color(0xffFC6BFF), shape: BoxShape.circle),
          ),
        ),
      ],
    );
  }
}
