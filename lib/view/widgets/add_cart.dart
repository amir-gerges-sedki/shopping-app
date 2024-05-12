import 'package:flutter/material.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

class AddCartProduct extends StatelessWidget {
  const AddCartProduct({super.key, required this.price, this.onTap});
  final double price;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const CustomText(
                title: 'Price',
                color: Colors.black,
                fontSize: 20,
                overflow: TextOverflow.clip,
              ),
              CustomText(
                title: '$price\$',
                color: Colors.black,
                fontSize: 16,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
          Ink(
            child: Container(
              padding: const EdgeInsets.only(left: 60),
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: onTap,
                child: const Row(
                  children: [
                    CustomText(
                      title: 'Add To Cart',
                      color: Colors.black,
                      fontSize: 22,
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_cart)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
