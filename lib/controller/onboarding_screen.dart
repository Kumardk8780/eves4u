import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/auth/login_signup.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Welcome to Eves4U",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "EVENTS4YOU: Event Management System",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Image.asset('assets/onboardIcon.png'),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  // height: 300,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                        child: Text(
                          "The social media platform designed to get you offline",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Eves4U is an app that lets you connect with people through engaging events like regional,cultural,music,dance and many more events.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 25,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          color: Colors.white,
                          elevation: 3,
                          onPressed: () {
                            Get.to(() => LoginView());
                          },
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 48, 76, 100),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
