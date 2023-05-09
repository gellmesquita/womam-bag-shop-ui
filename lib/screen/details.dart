import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:womam_shop/model/product.dart';
import 'package:womam_shop/constants.dart';
import 'package:womam_shop/screen/widgets/body_details.dart';


class Details extends StatelessWidget {
  
  final Product product;
  const Details({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: BodyDetails(),
    
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context), 
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.white,
        )
      ),
      actions: [
        IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/search.svg",
          color: Colors.white,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/cart.svg",
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: kDefaultPaddin/2,
      )
      ],
    );
  }
}