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
    return DefaultTextStyle(
      style: const TextStyle(fontSize: 10),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  
                  HomeList(
                        "Erbil",
                        "2",
                        "1",
                        "150",
                        "10000",
                        Icon(Icons.pool),
                        "in hrere we have an house to sell",
                        "available"),
                    HomeList(
                        "Erbil",
                        "1",
                        "1",
                        "100",
                        "5000",
                        Icon(Icons.local_parking_sharp),
                        "This is a nice house have a parking for car and it's so clean everything inside is new ",
                        "onhold"),
                    HomeList(
                        "Sulaymaniah",
                        "2",
                        "2",
                        "300",
                        "100000",
                        Icon(Icons.pool),
                        "in hrere we have an house to sell",
                        "sold"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
