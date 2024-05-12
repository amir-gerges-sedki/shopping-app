import 'package:flutter/material.dart';
import 'package:shopping_app/view/widgets/custom_text.dart';

// ignore: must_be_immutable
class CustomCardProduct extends StatelessWidget {
  const CustomCardProduct({
    super.key,
    required this.rate,
    required this.image,
    required this.price,
    required this.onTap,
  });
  final double rate;
  final double price;
  final String image;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 165,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Image.network(
              image,
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: '$price\$',
                  color: Colors.black,
                  fontSize: 20,
                  overflow: TextOverflow.visible,
                ),
                Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title: '$rate',
                          color: Colors.black,
                          fontSize: 15,
                          overflow: TextOverflow.visible,
                        ),
                        const Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
