import 'package:flutter/material.dart';
import 'package:womam_shop/constants.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories= ["Poderosas", "Autenticas", "Empoderadas", "Mãe"];
  int selectedIndex= 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return buildCategories(index);
        },
      ),
    );
  }

  GestureDetector buildCategories(int index) {
    return GestureDetector(
      onTap: () => setState(() {
        selectedIndex=index;
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPaddin
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                color: selectedIndex==index ? kTextColor:kTextLightColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: kDefaultPaddin/4
              ),
              height: 2,
              width: 50,
              color: selectedIndex==index ? Colors.black :Colors.white
            )
          ],
        ),
      ),
    );
  }
}