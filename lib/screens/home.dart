import 'package:flutter/material.dart';
import 'package:real_estate_app/widgets/home_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: const CircleAvatar(
                      backgroundColor: Color.fromRGBO(240, 217, 255, 100),
                      radius: 25,
                      child: Icon(
                        Icons.menu_rounded,
                      ),
                    ),
                    onTap: () {},
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    child: const CircleAvatar(
                      backgroundColor:Color.fromRGBO(240, 217, 255, 100),
                      radius: 25,
                      child: Icon(
                        Icons.notifications_sharp,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "Properties",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: HomeCon(),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCon extends StatelessWidget {
  const HomeCon({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          HomeList("Erbil", "2", "1", "150", "10000", Icon(Icons.pool),
              "in hrere we have an house to sell", "available"),
          HomeList(
              "Erbil",
              "1",
              "1",
              "100",
              "5000",
              Icon(Icons.local_parking_sharp),
              "This is a nice house have a parking for car and it's so clean everything inside is new ",
              "onhold"),
          
        ],
      ),
    );
  }
}
