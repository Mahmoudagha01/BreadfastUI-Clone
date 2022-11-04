import 'package:breadfast/Component/GridfixedHeight.dart';
import 'package:breadfast/Component/griditem.dart';
import 'package:breadfast/Screens/details.dart';
import 'package:flutter/material.dart';
import 'package:breadfast/Component/_item.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../Data/datasource.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _headerCard(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Details()));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              image: AssetImage(headerimg[index]), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _bakeriesCard(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Details()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 4 - 20,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(10, 10), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                  image: DecorationImage(
                      image: AssetImage(BakeriesList[index]["image"]))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    BakeriesList[index]["title"],
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: AnimationLimiter(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: _headerCard(index),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: const [
                Text(
                  "Bakeries",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 420,
            child: AnimationLimiter(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 12,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 4,
                    height: 140,
                  ),
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      columnCount: 4,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: _bakeriesCard(index),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: const [
                Text(
                  "Halawet Al-Mouled",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          Row(
            children: [
              item(context, "images/halawaet.jpg", "  Halawet \nAl-Mouled")
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 5),
            child: Row(
              children: const [
                Text(
                  "Dairy & Eggs",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          Row(
            children: [
              item(context, "images/egg.jpg", "Eggs"),
              item(context, "images/milk.jpg", "Milk"),
              item(context, "images/cheese.jpg", "Cheese"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
            child: Row(
              children: const [
                Text(
                  "Fruits & Vegetables",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          Row(
            children: [
              item(context, "images/fruits.jpg", "Fruits"),
              item(context, "images/vegetables.jpg", "Vegetables"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
            child: Row(
              children: const [
                Text(
                  "Beverages",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 280,
            child: AnimationLimiter(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 4,
                    height: 140,
                  ),
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        columnCount: 4,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: gridCard(
                                index,
                                context,
                                BeveragesList[index]["image"],
                                BeveragesList[index]["title"]),
                          ),
                        ));
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
            child: Row(
              children: const [
                Text(
                  "Groceries",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 700,
            child: AnimationLimiter(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 18,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 4,
                    height: 140,
                  ),
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      columnCount: 4,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: gridCard(
                              index,
                              context,
                              groceriessList[index]["image"],
                              groceriessList[index]["title"]),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
            child: Row(
              children: const [
                Text(
                  "Stationery",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 420,
            child: AnimationLimiter(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 4,
                    height: 140,
                  ),
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      columnCount: 4,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: gridCard(
                              index,
                              context,
                              StationaryList[index]["image"],
                              StationaryList[index]["title"]),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
            child: Row(
              children: const [
                Text(
                  "health & Household",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 560,
            child: AnimationLimiter(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 13,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 4,
                    height: 140,
                  ),
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      columnCount: 4,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: gridCard(
                              index,
                              context,
                              healthList[index]["image"],
                              healthList[index]["title"]),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 5),
            child: Row(
              children: const [
                Text(
                  "Dairy & Eggs",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          Row(
            children: [
              item(context, "images/babyfood.jpg", "Baby Food"),
              item(context, "images/babydiapers.jpg", "  Baby\nDiapers"),
            ],
          ),
        ],
      ),
    );
  }
}
