import 'package:flutter/material.dart';
import 'package:real_estate_app/screens/home.dart';
import 'package:real_estate_app/widgets/TextFields.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _homenumber = TextEditingController();

  final _homelocation = TextEditingController();

  final _homearea = TextEditingController();

  final _homeprice = TextEditingController();

  final _homedescription = TextEditingController();

  final _bedroom = TextEditingController();

  final _bathroom = TextEditingController();

  bool swimming = false;
  bool garage = false;
  bool security = false;

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      body: SingleChildScrollView(
        reverse: MediaQuery.of(context).viewInsets.bottom < 1 ? true : false,
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
                child: Text('Add Screen', style: TextStyle(fontSize: 25.sp))),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
              child: Column(
                children: [
                  //textFields(name,password or not , foucasable,keyboardtype,controller)
                  textFields("Home number", false, true, TextInputType.text,
                      _homenumber),
                  SizedBox(
                    height: 2.h,
                  ),
                  textFields("Home Location", false, false, TextInputType.text,
                      _homelocation),
                  SizedBox(
                    height: 2.h,
                  ),
                  textFields("Home Area", false, false, TextInputType.number,
                      _homearea),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: textFields("Bedroom number", false, false,
                              TextInputType.number, _bedroom)),
                      SizedBox(
                        width: 1.w,
                      ),
                      Expanded(
                          child: textFields("Bathroom number", false, false,
                              TextInputType.number, _bathroom)),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  textFields("Home Price", false, false, TextInputType.number,
                      _homeprice),
                  SizedBox(
                    height: 2.h,
                  ),
                  textFields("Home Description", false, false,
                      TextInputType.text, _homedescription),
                  SizedBox(
                    height: 2.h,
                  ),
                  const Text(
                    "Amenities",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                                  MaterialStateProperty.resolveWith(getColor),
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
                                  MaterialStateProperty.resolveWith(getColor),
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
                                  MaterialStateProperty.resolveWith(getColor),
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
                        backgroundColor: Theme.of(context).secondaryHeaderColor,
                        padding: const EdgeInsets.all(10),
                      ),
                      onPressed: () {
                        try {
                          CollectionReference collref = FirebaseFirestore
                              .instance
                              .collection("addEstate");
                          collref.add({
                            'number':_homenumber.text,
                            'area': _homearea.text,
                            'bathroom': _bathroom.text,
                            'bedroom': _bedroom.text,
                            'description': _homedescription.text,
                            'garage': garage,
                            'location': _homelocation.text,
                            'price': _homeprice.text,
                            'security': security,
                            'status': "available",
                            'swimming': swimming,
                          });
                          _homearea.clear();
                          _homedescription.clear();
                          _homelocation.clear();
                          _homenumber.clear();
                          _homeprice.clear();
                          _bedroom.clear();
                          _bathroom.clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: const Text(" password is empty",
                                    style: TextStyle(fontSize: 18)),
                                backgroundColor:
                                    Theme.of(context).secondaryHeaderColor),
                          );
                        }
                      },
                      child: const Text(
                        "Add",
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
  }
}
