import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/routes.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/splashimage.jpeg',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350.0),
              child: Center(
                child: Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                      child: CustomText(
                    overflow: TextOverflow.visible,
                    title: 'SHOPPING',
                    color: Color.fromARGB(255, 238, 192, 56),
                    fontSize: 35,
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(130, 700, 80, 50),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 54, 54, 21))),
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.homePage);
                  },
                  child: const CustomText(
                    overflow: TextOverflow.visible,
                    title: 'Get Started',
                    color: Color.fromARGB(255, 238, 192, 56),
                    fontSize: 25,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
