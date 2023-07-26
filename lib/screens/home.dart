import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/screens/addscreen.dart';
import 'package:sizer/sizer.dart';

import '../widgets/home_list.dart';

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
                      backgroundColor: Color.fromRGBO(240, 217, 255, 100),
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
            const Expanded(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: HomeCon(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddScreen()));
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HomeCon extends StatefulWidget {
  const HomeCon({super.key});

  @override
  State<HomeCon> createState() => _HomeConState();
}

class _HomeConState extends State<HomeCon> {
  // Future getDocId() async {
  //   await FirebaseFirestore.instance
  //       .collection("addEstate")
  //       .get()
  //       .then((snapshot) => snapshot.docs.forEach((document) {
  //             DocId.add(document.reference.id);
  //           }));
  // }

  List<HomeList> DocId = [];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("addEstate").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final datas = snapshot.data?.docs.toList();
          for (var data in datas!) {
            final docid = HomeList(
                data['location'],
                data['bedroom'],
                data['bathroom'],
                data['area'],
                data['price'],
                data['swimming'],
                data['garage'],
                data['security'],
                data['description'],
                data['status'],
                data.id);
                
            DocId.add(docid);
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  backgroundColor: Colors.grey[300],
                ),
                SizedBox(
                  height: 2.h,
                ),
                const Text("Loading"),
              ],
            ),
          );
        } else {
          print('noData in hrere');
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: ListView(
            children: DocId.toList(),
          ),
        );
      },
    );
  }
}
