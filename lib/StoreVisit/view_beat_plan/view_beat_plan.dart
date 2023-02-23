import 'package:flutter/material.dart';

import '../../recycler_view.dart';

class BeatPlan extends StatefulWidget {
  const BeatPlan({Key? key}) : super(key: key);

  @override
  State<BeatPlan> createState() => _BeatPlanState();
}

class _BeatPlanState extends State<BeatPlan> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Center(child: Text('View Beat Plan With Date')),
      ),
      body: const Center(child: RecyclerViewData()),
    );
  }
}