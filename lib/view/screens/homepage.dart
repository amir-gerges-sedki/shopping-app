import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/home_screen_controller.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final conterller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            elevation: 0,
            title: Center(
              child: CustomText(
                  overflow: TextOverflow.visible,
                  title: conterller.titeScreen[conterller.currentItem.value],
                  color: Colors.black,
                  fontSize: 25),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: conterller.currentItem.value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.amber,
                  ),
                  icon: Icon(Icons.home),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.category,
                    color: Colors.amber,
                  ),
                  icon: Icon(Icons.category),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Colors.amber,
                  ),
                  icon: Icon(Icons.favorite),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.shopping_cart,
                    color: Colors.amber,
                  ),
                  icon: Icon(Icons.shopping_cart),
                  label: ''),
            ],
            onTap: (currentTabs) {
              conterller.currentItem.value = currentTabs;
            },
            backgroundColor: Colors.white,
          ),
          body: conterller.tabs.elementAt(conterller.currentItem.value),
        ),
      );
    });
  }
}
