import 'package:flutter/material.dart';
import 'package:womam_shop/constants.dart';
import 'package:womam_shop/model/product.dart';

class ItemCard extends StatelessWidget {
  
  final int index;

  ItemCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                color: products[index].color,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Image.asset(products[index].image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kDefaultPaddin/4
            ),
            child: Text(
              products[index].title,
              style: const TextStyle(
                color: kTextLightColor
              ),
            ),
          ),
          Text(
            "AOA ${products[index].price}",
            style: const TextStyle(
              fontWeight: FontWeight.bold
            ),
          )
        ],
      );
  }

  
}