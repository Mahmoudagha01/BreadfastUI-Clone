import 'package:flutter/material.dart';
import 'package:share/share.dart';

class FreeCredit extends StatefulWidget {
  @override
  _FreeCreditState createState() => _FreeCreditState();
}

class _FreeCreditState extends State<FreeCredit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Refer and Earn",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              color: Color.fromARGB(100, 100, 100, 100),
              child: Image.network(
                'https://img.freepik.com/free-vector/refer-friend-friendly-people-with-megaphone-referring-new-users-business-recommendation-program-young-referred-finance-businessman-background_176411-885.jpg?size=626&ext=jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.66,
            minChildSize: 0.66,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                "Refer a friend and get EGP40 in your wallet.",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          children: [
                            Text(
                              "How does it work?",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                "Let your friends sign up using your link and\nthey'll enjoy a 25% discount (Maximum EGP100) on bakery products of their first order, and you'll get EGP40 cashback when they complete their order. Get your EGP40 eveytime a new friend makes an order.",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          children: [
                            Text(
                              "T&C apply.",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          children: [
                            Text(
                              "Share the love.",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: 150,
                        endIndent: 150,
                        color: Colors.black,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "You have earned OLE till now",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Your Invation Code",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Table(
                          columnWidths: {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(1)
                          },
                          border: TableBorder.all(
                              color: Colors.black.withOpacity(0.1)),
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Center(child: Text('9r12i')),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Text('Modify'),
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Share.share(
                              'check out my website https://example.com',
                              subject: 'Look what I made!');
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            "Share with Friends",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
