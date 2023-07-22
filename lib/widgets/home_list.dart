import 'package:flutter/material.dart';


class HomeList extends StatelessWidget {
  final String location;
  final String bedroom;
  final String bathroom;
  final String price;
  final String area;
  final String status;
  final bool swiming;
  final bool garage;
  final bool security;
  final String description;
  const HomeList(
      this.location,
      this.bedroom,
      this.bathroom,
      this.area,
      this.price,
      this.swiming,
      this.garage,
      this.security,
      this.description,
      this.status,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.black45,
                    size: 25,
                  ),
                  Text(location,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.bedroom_parent_rounded,
                    color: Colors.black45,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    bedroom,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.bathtub_rounded,
                    color: Colors.black45,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    bathroom,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(child: Container()),
                  Text('${area}M',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 60,
                    child: VerticalDivider(
                      width: 10,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                  Text(
                    '$price\$',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Amenities:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ...amenties(swiming, garage, security),
                  Expanded(child: Container()),
                  Builder(
                    builder: (context) {
                      try {
                        if (status == "available") {
                          return const Text(
                            "Available",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          );
                        } else if (status == "onhold") {
                          return const Text(
                            "On Hold",
                            style: TextStyle(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          );
                        } else {
                          return const Text(
                            "Sold",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          );
                        }
                      } catch (e) {}
                      return Container();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Description:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(description),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List amenties(bool swim, bool garag, bool security) {
    List<Widget> amenite = [];
    if (swim == true) {
      amenite.add(Icon(Icons.pool));
      SizedBox(
        width: 5,
      );
    }
    if (garage == true) {
      amenite.add(Icon(Icons.local_parking_outlined));
      SizedBox(
        width: 5,
      );
    }
    if (security == true) {
      amenite.add(Icon(Icons.local_police_outlined));
      SizedBox(
        width: 5,
      );
    }
    return amenite;
  }
}
