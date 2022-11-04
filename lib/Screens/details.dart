import 'package:breadfast/Component/GridfixedHeight.dart';
import 'package:breadfast/Screens/CartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Data/datasource.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  PageController _pageController = PageController(initialPage: 0);
  // listen to the scroll and compare the offset with the default size of the Toolbar.

  ScrollController _scrollController;
  bool isScroll = true;

  bool get isClose {
    return _scrollController.hasClients &&
        _scrollController.offset > (80 - kToolbarHeight);
  }

  _scrollListener() {
    if (isClose != isScroll) {
      setState(() {
        isScroll = isClose;
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  int _curentindex = 0;

  Widget _Cats(int index) {
    return Container(
      height: 60,
      width: catsList[index]["_hasMuliLine"] == true ? 150 : 90,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1.5,
              color: catsList[index]["isSelected"]
                  ? Theme.of(context).primaryColor
                  : Colors.transparent),
          borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: InkWell(
            onTap: () {
              setState(() {
                catsList[_curentindex]["isSelected"] = false;
                _curentindex = index;
                catsList[_curentindex]["isSelected"] = true;

                switch (index) {
                  case 0:
                    _pageController.animateToPage(0,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);

                    break;
                  case 1:
                    _pageController.animateToPage(1,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                    break;
                  case 2:
                    _pageController.animateToPage(2,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                    break;
                  case 3:
                    _pageController.animateToPage(3,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                    break;
                  case 4:
                    _pageController.animateToPage(4,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                    break;
                  case 5:
                    _pageController.animateToPage(5,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                    break;
                  case 6:
                    _pageController.animateToPage(6,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                    break;
                  case 7:
                    _pageController.animateToPage(7,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                    break;
                  case 8:
                    _pageController.animateToPage(8,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                    break;
                  case 9:
                    _pageController.animateToPage(9,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                    break;
                  case 10:
                    _pageController.animateToPage(10,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                    break;
                  default:
                }
              });
            },
            child: Text(
              catsList[index]["title"],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: catsList[index]["isSelected"]
                      ? Theme.of(context).primaryColor
                      : Colors.black),
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _Card(int index, String image, String title, String price) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(36),
                  ),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(price),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 35,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "ADD TO CART",
                style: TextStyle(color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              "Breadfast Tomorow",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            floating: false,
            pinned: true,
            expandedHeight: 110,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              title: isClose
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        Text(
                          "Receive your order tomorrow morning!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: isClose
                                  ? Colors.white
                                  : Colors.black.withOpacity(0.6),
                              fontSize: 9),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Cart()));
                            }),
                      ],
                    )
                  : FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          Text(
                            "Receive your order tomorrow morning!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: isClose
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.6),
                                fontSize: 9),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                size: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Cart()));
                              }),
                        ],
                      ),
                    ),
              titlePadding: EdgeInsets.all(5),
              centerTitle: true,
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      itemCount: catsList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _Cats(index);
                      }),
                ),
                Expanded(
                    child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    AnimationLimiter(
                      child: GridView.builder(
                          itemCount: bakList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            height: 250,
                          ),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount: 4,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: _Card(
                                      index,
                                      bakList[index]["image"],
                                      bakList[index]["title"],
                                      bakList[index]["price"]),
                                ),
                              ),
                            );
                          }),
                    ),
                    AnimationLimiter(
                      child: GridView.builder(
                          itemCount: halawalist.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            height: 250,
                          ),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount: 4,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: _Card(
                                      index,
                                      halawalist[index]["image"],
                                      halawalist[index]["title"],
                                      halawalist[index]["price"]),
                                ),
                              ),
                            );
                          }),
                    ),
                    AnimationLimiter(
                      child: GridView.builder(
                          itemCount: dairylist.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            height: 250,
                          ),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount: 4,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: _Card(
                                      index,
                                      dairylist[index]["image"],
                                      dairylist[index]["title"],
                                      dairylist[index]["price"]),
                                ),
                              ),
                            );
                          }),
                    ),
                    AnimationLimiter(
                      child: GridView.builder(
                          itemCount: fruitlist.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            height: 250,
                          ),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount: 4,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: _Card(
                                      index,
                                      fruitlist[index]["image"],
                                      fruitlist[index]["title"],
                                      fruitlist[index]["price"]),
                                ),
                              ),
                            );
                          }),
                    ),
                    AnimationLimiter(
                      child: GridView.builder(
                          itemCount: waterlist.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            height: 250,
                          ),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount: 4,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: _Card(
                                      index,
                                      waterlist[index]["image"],
                                      waterlist[index]["title"],
                                      waterlist[index]["price"]),
                                ),
                              ),
                            );
                          }),
                    ),
                    AnimationLimiter(
                      child: GridView.builder(
                          itemCount: groceriessList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            height: 250,
                          ),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount: 4,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: _Card(
                                      index,
                                      groceriessList[index]["image"],
                                      groceriessList[index]["title"],
                                      groceriessList[index]["price"]),
                                ),
                              ),
                            );
                          }),
                    ),
                    AnimationLimiter(
                      child: GridView.builder(
                          itemCount: dairylist.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            height: 250,
                          ),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount: 4,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: _Card(
                                      index,
                                      dairylist[index]["image"],
                                      dairylist[index]["title"],
                                      dairylist[index]["price"]),
                                ),
                              ),
                            );
                          }),
                    ),
                    AnimationLimiter(
                      child: GridView.builder(
                          itemCount: StationaryList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            height: 250,
                          ),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount: 4,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: _Card(
                                      index,
                                      StationaryList[index]["image"],
                                      StationaryList[index]["title"],
                                      StationaryList[index]["price"]),
                                ),
                              ),
                            );
                          }),
                    ),
                    AnimationLimiter(
                      child: GridView.builder(
                          itemCount: waterlist.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            height: 250,
                          ),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount: 4,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: _Card(
                                      index,
                                      waterlist[index]["image"],
                                      waterlist[index]["title"],
                                      waterlist[index]["price"]),
                                ),
                              ),
                            );
                          }),
                    ),
                    AnimationLimiter(
                      child: GridView.builder(
                          itemCount: healthList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            height: 250,
                          ),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount: 4,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: _Card(
                                      index,
                                      healthList[index]["image"],
                                      healthList[index]["title"],
                                      healthList[index]["price"]),
                                ),
                              ),
                            );
                          }),
                    ),
                    AnimationLimiter(
                      child: GridView.builder(
                          itemCount: fruitlist.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            height: 250,
                          ),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount: 4,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: _Card(
                                      index,
                                      fruitlist[index]["image"],
                                      fruitlist[index]["title"],
                                      fruitlist[index]["price"]),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
