import 'package:code_along_meditation_app/screens/details_screen.dart';
import 'package:code_along_meditation_app/widgets/search_bar.dart';
import '../widgets/category_card.dart';
import '../widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  _buildMenuIcon() {
    // instead of using Row to align it to the right, use Align instead
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        // align the child within the container
        alignment: Alignment.center,
        height: 52,
        width: 52,
        // decoration to paint behind the child
        decoration: const BoxDecoration(
          color: Color(0xFFF2BEA1),
          shape: BoxShape.circle,
        ),
        // instantiates a widget from SVG
        child: SvgPicture.asset("assets/icons/menu.svg"),
      ),
    );
  }

  _buildWelcomeText(context) {
    return Text(
      "Good Morning \nArjun",
      style: Theme.of(context)
          .textTheme
          .displaySmall!
          .copyWith(fontWeight: FontWeight.w900),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: [
          // background decoration
          Container(
            height: size.height * 0.45,
            decoration: const BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage('assets/images/undraw_pilates_gpdb.png'),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMenuIcon(),
                  _buildWelcomeText(context),
                  SearchBar(),
                  Expanded(
                    // convenient widget to mimic a grid like interface (columns with rows)
                    child: GridView.count(
                      crossAxisCount: 2,
                      // aspect ratio: ratio between width & height of the box
                      // ex: if you want height to be 2x your width, then aspect ratio is 1 / 2
                      childAspectRatio: 1 / 1.16,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        CategoryCard("Diet Recommendations",
                            "assets/icons/Hamburger.svg", () {}),
                        CategoryCard("Kegel Exercises",
                            "assets/icons/Excrecises.svg", () {}),
                        CategoryCard(
                            "Meditation", "assets/icons/Meditation.svg", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const DetailsScreen()),
                          );
                        }),
                        CategoryCard("Yoga", "assets/icons/yoga.svg", () {}),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
