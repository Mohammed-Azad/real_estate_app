import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/widgets/TextFields.dart';
import 'package:sizer/sizer.dart';

class UpdateScreen extends StatefulWidget {
  final String number;

  const UpdateScreen(this.number, {super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController homenumber = TextEditingController();

  TextEditingController homelocation = TextEditingController();

  TextEditingController homearea = TextEditingController();

  TextEditingController homeprice = TextEditingController();

  TextEditingController homedescription = TextEditingController();

  TextEditingController bedroom = TextEditingController();

  TextEditingController bathroom = TextEditingController();

  bool swimming = false;
  bool garage = false;
  bool security = false;
  String? status;

  @override
  Widget build(BuildContext context) {
    Future data = FirebaseFirestore.instance
        .collection("addEstate")
        .doc(widget.number)
        .get();
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.purple;
    }

    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("=============");
            print(snapshot);
            homelocation.text = snapshot.data['location'];
            bedroom.text = snapshot.data['bedroom'];
            bathroom.text = snapshot.data['bathroom'];
            homearea.text = snapshot.data['area'];
            homeprice.text = snapshot.data['price'];
            swimming = snapshot.data['swimming'];
            garage = snapshot.data['garage'];
            security = snapshot.data['security'];
            homedescription.text = snapshot.data['description'];
            status = snapshot.data['status'];
            return Scaffold(
              body: SingleChildScrollView(
                reverse: MediaQuery.of(context).viewInsets.bottom < 10
                    ? true
                    : false,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.h),
                      child: SizedBox(
                        width: 100.w,
                        height: 20.h,
                        child: Image.asset("assets/images/addhome.png"),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Text('Add Screen',
                            style: TextStyle(fontSize: 25.sp))),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                      child: Column(
                        children: [
                          //textFields(name,password or not , foucasable,keyboardtype,controller)

                          SizedBox(
                            height: 2.h,
                          ),
                          textFields("Home Location", false, false,
                              TextInputType.text, homelocation),
                          SizedBox(
                            height: 2.h,
                          ),
                          textFields("Home Area", false, false,
                              TextInputType.text, homearea),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: textFields("Bedroom number", false,
                                      false, TextInputType.text, bedroom)),
                              SizedBox(
                                width: 1.w,
                              ),
                              Expanded(
                                  child: textFields("Bathroom number", false,
                                      false, TextInputType.text, bathroom)),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          textFields("Home Price", false, false,
                              TextInputType.number, homeprice),
                          SizedBox(
                            height: 2.h,
                          ),
                          textFields("Home Description", false, false,
                              TextInputType.text, homedescription),
                          SizedBox(
                            height: 2.h,
                          ),
                          const Text(
                            "Amenities",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 100.w,
                            height: 20.h,
                            child: Wrap(
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              getColor),
                                      value: swimming,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          swimming = value!;
                                        });
                                      },
                                    ),
                                    const Text("Garage"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              getColor),
                                      value: garage,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          garage = value!;
                                        });
                                      },
                                    ),
                                    const Text("Swimming pool"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              getColor),
                                      value: security,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          security = value!;
                                        });
                                      },
                                    ),
                                    const Text("Security"),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                fixedSize: const Size(300, 50),
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Theme.of(context).secondaryHeaderColor,
                                padding: const EdgeInsets.all(10),
                              ),
                              onPressed: () {
                                final collref = FirebaseFirestore.instance
                                    .collection("addEstate")
                                    .doc(widget.number);
                                collref.set({
                                  'area': homearea.text,
                                  'bathroom': bathroom.text,
                                  'bedroom': bedroom.text,
                                  'description': homedescription.text,
                                  'garage': garage,
                                  'location': homelocation.text,
                                  'price': homeprice.text,
                                  'security': security,
                                  'status': "available",
                                  'swimming': swimming,
                                }).then((value) => Navigator.pop(context));

                                homearea.clear();
                                homedescription.clear();
                                homelocation.clear();
                                homenumber.clear();
                                homeprice.clear();
                                bedroom.clear();
                                bathroom.clear();
                              },
                              child: const Text(
                                "Update",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
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
              ),
            );
          } else {
            print('noData in hrere');
          }

          return Container();
        });
  }
}
