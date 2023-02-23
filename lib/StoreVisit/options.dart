// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'outlet_beat_plan/outlet_beat_plan.dart';
import 'view_beat_plan/view_beat_plan.dart';

class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.black,
                height: 250.0,
                width: 250.0,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OutletBeatPlan()));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Image(
                        image: AssetImage('assets/beat_plan_by_outlet.png'),height: 150,
                      ),
                      Text('Beat Plan By Outlet',style: TextStyle(color: Colors.white,fontSize: 20.0))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                color: Colors.black,
                height: 250.0,
                width: 250.0,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BeatPlan()));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Image(
                        image: AssetImage('assets/view_plan.png'),
                      ),
                      Text('View Beat Plan',style: TextStyle(color: Colors.white,fontSize: 20.0))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              SizedBox(
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(''),
                      Text(
                        'Important Note :-',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        'Your total number of visits for today is ${1}, Please complete',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        'your today visit.',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(''),
                    ],
                  ),
                ),
              )
            ],
          ),
        ]);
  }
}
