// ignore_for_file: deprecated_member_use
import 'package:beatplan/StoreVisit/store_visit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BeatPlanScreen());
}

class BeatPlanScreen extends StatefulWidget {
  const BeatPlanScreen({Key? key}) : super(key: key);

  @override
  State<BeatPlanScreen> createState() => _BeatPlanScreenState();
}

class _BeatPlanScreenState extends State<BeatPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StoreVisitData()
    );
  }
}
