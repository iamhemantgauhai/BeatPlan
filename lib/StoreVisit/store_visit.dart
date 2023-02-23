import 'package:flutter/material.dart';
import 'options.dart';

class StoreVisitData extends StatefulWidget {
  const StoreVisitData({Key? key}) : super(key: key);

  @override
  State<StoreVisitData> createState() => _StoreVisitDataState();
}

class _StoreVisitDataState extends State<StoreVisitData> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text("Manage Beat Plan",style: TextStyle(color: Colors.white),),
        ),
        body: const Options());
  }
}
