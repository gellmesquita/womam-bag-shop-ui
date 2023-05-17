import 'package:flutter/material.dart';
import 'package:womam_shop/constants.dart';
import 'package:womam_shop/model/product.dart';

class ItemCard extends StatelessWidget {
  
  final int index;
  final Function press;
  const ItemCard({super.key, required this.index, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: Column(
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
                child: Hero(
                  tag: "${products[index].id}",
                  child: Image.asset(products[index].image)
                ),
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
        ),
    );
  }

  
}