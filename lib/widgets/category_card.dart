import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  final String cardTitle;
  final String imagePath;
  final Function onPress;

  CategoryCard(this.cardTitle, this.imagePath, this.onPress);

  @override
  Widget build(BuildContext context) {
    // ClipRRect = Rounded rectangle that makes it easy to round borders
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Material(
          color: Colors.transparent,
          // Used to detect gestures like tap & give ripple effect
          child: InkWell(
            onTap: () => onPress(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // flexible spacing
                  const Spacer(),
                  SvgPicture.asset(imagePath),
                  const Spacer(),
                  Text(
                    cardTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
