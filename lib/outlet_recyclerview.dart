// ignore_for_file: avoid_print, unused_element

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OutLetRecyclerView extends StatefulWidget {
  const OutLetRecyclerView({Key? key}) : super(key: key);

  @override
  State<OutLetRecyclerView> createState() => _OutLetRecyclerViewState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class _OutLetRecyclerViewState extends State<OutLetRecyclerView> {
  final _debouncer = Debouncer();
  final key = GlobalKey<ScaffoldState>();
  Map<String, dynamic>? data;
  List selectedItem = [];
  List allData = [];
  Future<String> getData() async {
    var response = await http.get(Uri.parse(
        "https://web.multiplier.co.in/dffts/dfftssr_listBranchDealer.action?empId=10003&branchId=8"));
    await Future.delayed(const Duration(microseconds: 10));
    setState(() {
      data = json.decode(response.body);
    });
    return "Success!";
  }


  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                    height: 100,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        cursorColor: Colors.black,
                        onChanged: (string) {
                          int i = 0;
                          while(i <= data!.entries.first.value.length){
                            _debouncer.run(() {
                              setState(() {
                                selectedItem = allData
                                    .where(
                                      (u) => (u.data!.entries.first.value[i]["dealerName"].toLowerCase().contains(
                                    string.toLowerCase(),
                                  )),
                                )
                                    .toList();
                              });
                            });
                          }
                        },
                        decoration: const InputDecoration(
                          focusColor: Colors.black,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelText: 'Search',
                          labelStyle: TextStyle(color: Colors.white),
                          fillColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15.0)),
                  height: 45,
                  width: 125,
                  child: TextButton(
                    onPressed: () {
                    },
                    child: const Text('Submit',
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  ),
                ),
              ],
            ),
            Container(
              height: 5.0,
              width: double.infinity,
              color: Colors.white,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: data == null ? 0 : (data!.entries.first.value.length),
                itemBuilder: (context, index) {
                  String dealerNameData = data!.entries.first.value[index]["dealerName"];
                  String addressData = data!.entries.first.value[index]["location"];
                  String dealerIdData = data!.entries.first.value[index]["dealerId"];
                  allData.add(dealerNameData);
                  allData.add(addressData);
                  allData.add(dealerIdData);
                  return SingleChildScrollView(
                    child: TextButton(
                        onPressed: () {},
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            leading: Checkbox(
                              value: selectedItem.contains(index) ? true : false,
                              activeColor: Colors.black,
                              onChanged: (newValue) {
                                if (selectedItem.contains(index)) {
                                  selectedItem.remove(index);
                                } else {
                                  selectedItem.add(index);
                                }
                                setState(() {});
                              },
                            ),
                            title: Expanded(
                              child: Text('Dealer Name: ${data!.entries.first.value[index]["dealerName"]}',
                                  style: const TextStyle(color: Colors.black)),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('Address: ${data!.entries.first.value[index]["location"]}',
                                  style: const TextStyle(color: Colors.black)),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(bottom: 40.0),
                              child: Text('Dealer ID: ${data!.entries.first.value[index]["dealerId"]}',
                                  style: const TextStyle(color: Colors.black)),
                            ),
                          ),
                        )),
                  );
                }),
          ],
        ));
  }
}