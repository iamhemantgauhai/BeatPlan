// ignore_for_file: avoid_print

import 'package:beatplan/recycler_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OutLetBeatPlanNavBar extends StatefulWidget {
  const OutLetBeatPlanNavBar({Key? key}) : super(key: key);
  @override
  State<OutLetBeatPlanNavBar> createState() => _OutLetBeatPlanNavBarState();
}

class _OutLetBeatPlanNavBarState extends State<OutLetBeatPlanNavBar> {
  var index = 0;
  var dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: TextField(
                controller: dateInput,
                autofocus: false,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "dd/mm/yyyy",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Container(
                    color: Colors.black,
                    child: TextButton(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(pickedDate);
                            setState(() {
                              dateInput.text = formattedDate;
                            });
                          } else {}
                        },
                        child: const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        )),
                  )),
              label: ""),
          BottomNavigationBarItem(
              icon: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: TextButton(
                      onPressed: () {
                        if (dateInput.text.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RecyclerViewData()));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            shape: StadiumBorder(),
                            backgroundColor: Colors.black,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(80.0),
                            elevation: 6.0,
                            content:
                                Center(child: Text('Date selection is remaining.')),
                          ));
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ))),
              label: ""),
        ],
        currentIndex: index,
        onTap: (int i) {
          setState(() {
            index = i;
          });
        },
        fixedColor: Colors.white,
      ),
    );
  }
}
