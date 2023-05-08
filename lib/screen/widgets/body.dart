import 'package:flutter/material.dart';
import 'package:womam_shop/constants.dart';
import 'package:womam_shop/model/product.dart';
import 'package:womam_shop/screen/widgets/categories.dart';
import 'package:womam_shop/screen/widgets/item_card.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPaddin,
            vertical: kDefaultPaddin
          ),
          child: Text(
            "Pastas femininas",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ),
        Categories(),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPaddin,
              vertical: kDefaultPaddin
            ),
            itemCount: products.length,
            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: kDefaultPaddin,
              crossAxisSpacing: kDefaultPaddin,
              childAspectRatio: 0.74
            ), 
            itemBuilder: (context, index) => ItemCard(index:index),
          ),
        )
      ],
    );
  }

  
}

