import 'package:breadfast/Component/customSteper.dart';
import 'package:breadfast/Screens/Screens.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  ScrollController _scrollController = new ScrollController();
  static const double STEP_WIDTH = 90;
  PageController pageController = PageController();
  List<CustomStep> stepsList = [];
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    stepsList = [
      CustomStep(
        title: 'Cart',
        page: Placeholder(
          color: Colors.pink,
        ),
      ),
      CustomStep(
        title: 'Delivery',
        page: Placeholder(
          color: Colors.deepPurple,
        ),
      ),
      CustomStep(
        title: 'Payment',
        page: Placeholder(
          color: Colors.pink,
        ),
      ),
    ];
  }

  SizedBox buildStepDivider(int index) {
    return SizedBox(
      height: 90,
      child: Container(
        alignment: Alignment.topCenter,
        child: Transform.translate(
          offset: Offset(0, 16),
          child: Container(
            color: index < currentPage
                ? Theme.of(context).primaryColor
                : Colors.grey,
            width: 50,
            height: 2,
            padding: EdgeInsets.symmetric(horizontal: 5),
          ),
        ),
      ),
    );
  }

  buildStep(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: 90,
        width: STEP_WIDTH,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black.withOpacity(0.2)),
                color: index <= currentPage
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                    color: index <= currentPage ? Colors.white : Colors.black),
              ),
            ),
            Expanded(
              child: Text(
                stepsList[index].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: index <= currentPage
                        ? Theme.of(context).primaryColor
                        : Colors.black.withOpacity(0.3)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildStepper(int currentStep) {
    Future.delayed(
        Duration(milliseconds: 100),
        () => _scrollController.animateTo((STEP_WIDTH * currentStep).toDouble(),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut));
    return Center(
      child: SizedBox(
        height: 110,
        child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: stepsList.length,
            itemBuilder: (ctx, index) => index < stepsList.length - 1
                ? Row(
                    children: <Widget>[
                      buildStep(index),
                      buildStepDivider(index)
                    ],
                  )
                : Row(children: <Widget>[buildStep(index)])),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(249, 249, 249,1),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(
              Icons.clear,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Screens()));
            },
          ),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Text(
              "Checout",
              style: TextStyle(
                  fontFamily: "Playfair Display",
                  fontSize: 25,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          _buildStepper(currentPage),
          Divider(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.freepnglogos.com/uploads/shopping-cart-png/shopping-cart-png-image-download-pngm-2.png"))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              "Seems you haven't added anything to\nYour cart yet! Start shopping and add\n items.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 100,
            height: 60,
            child: ElevatedButton(
              child: Text("GO TO DELIVERY INFORMATION"),
        
              onPressed: null,
          
            ),
          )
        ],
      ),
    );
  }
}
