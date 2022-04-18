import 'dart:ui';

import 'package:code_along_meditation_app/constants.dart';
import 'package:code_along_meditation_app/widgets/bottom_nav_bar.dart';
import 'package:code_along_meditation_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      // Stack makes it easy to have bg image and then lay-over text on top of it
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: const BoxDecoration(
              color: kBlueLightColor,
              // TODO: look into how svg is fitting so perfectly?
              // is it the image itself or the fit: BoxFit?
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              // allows for overlowing below the bottom navigation bar
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "3-10 MIN Course",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                      child: const Text(
                        "Live happier & healthier by learning the fundamentals of meditation & mindfullness",
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      child: const SearchBar(),
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        SessionCard(1, () => {}, isDone: true),
                        SessionCard(2, () => {}),
                        SessionCard(3, () => {}),
                        SessionCard(4, () => {}),
                        SessionCard(5, () => {}),
                        SessionCard(6, () => {})
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 17),
                              blurRadius: 23,
                              spreadRadius: -13,
                              color: kShadowColor,
                            )
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                                "assets/icons/Meditation_women_small.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Basic 2",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14),
                                ),
                                Text("Start to deepen your practice")
                              ],
                            ),
                            SvgPicture.asset("assets/icons/Lock.svg")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  final Function press;

  SessionCard(this.sessionNum, this.press, {this.isDone = false});

  @override
  Widget build(BuildContext context) {
    // Layout Builder provides the parent widget's constraints
    return LayoutBuilder(builder: ((context, constraints) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          // constraints.maxWidth provide us parent widget's maxWidth
          width: constraints.maxWidth / 2 - 10,
          /* 
          the following is not ideal since the size of screen changes 
          across devices & -10 may not be constant
          width: MediaQuery.of(context).size.width / 2 - 10,
          */
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: isDone ? kBlueColor : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: kBlueColor),
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: isDone ? Colors.white : kBlueColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("Session $sessionNum",
                      style: Theme.of(context).textTheme.subtitle1!)
                ]),
              ),
            ),
          ),
        ),
      );
    }));
  }
}
