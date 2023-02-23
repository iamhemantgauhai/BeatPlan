// // ignore_for_file: avoid_print, unused_element
//
// import 'dart:async';
// import 'dart:convert';
// import 'package:beatplan/small_map.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:location/location.dart';
// import 'StoreVisit/outlet_beat_plan/outlet_beat_plan.dart';
//
// Future<LocationData?> _currentLocation() async {
//   bool serviceEnabled;
//   PermissionStatus permissionGranted;
//
//   Location location = Location();
//
//   serviceEnabled = await location.serviceEnabled();
//   if (!serviceEnabled) {
//     serviceEnabled = await location.requestService();
//     if (!serviceEnabled) {
//       return null;
//     }
//   }
//
//   permissionGranted = await location.hasPermission();
//   if (permissionGranted == PermissionStatus.denied) {
//     permissionGranted = await location.requestPermission();
//     if (permissionGranted != PermissionStatus.granted) {
//       return null;
//     }
//   }
//   return await location.getLocation();
// }
//
// class RecyclerViewData extends StatefulWidget {
//   const RecyclerViewData({Key? key}) : super(key: key);
//
//   @override
//   State<RecyclerViewData> createState() => _RecyclerViewDataState();
// }
//
// class _RecyclerViewDataState extends State<RecyclerViewData> {
//   List? data;
//   Future<String> getData() async {
//     var response = await http.get(
//         Uri.parse("https://mock-json-service.glitch.me/"));
//     await Future.delayed(const Duration(microseconds: 10));
//     setState(() {
//       data = json.decode(response.body);
//     });
//     return "Success!";
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.white,
//         child: ListView.builder(
//             itemCount: data == null ? 0 : data!.length,
//             itemBuilder: (context, index) {
//               return TextButton(
//                   onPressed: () {
//                     showAlertDialog(BuildContext context) {
//                       Widget cancelButton = TextButton(
//                         child: const Text("Cancel",
//                             style: TextStyle(color: Colors.white)),
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                       );
//                       Widget continueButton = TextButton(
//                         child: const Text(
//                           "Continue",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => const OutletBeatPlan()));
//                         },
//                       );
//                       AlertDialog alert = AlertDialog(
//                         insetPadding: const EdgeInsets.all(5.0),
//                         scrollable: true,
//                         content: Container(
//                           width: MediaQuery.of(context).size.width,
//                           color: Colors.white,
//                           child: Column(
//                             children: [
//                               Container(
//                                   width: double.infinity,
//                                   height: 40.0,
//                                   color: Colors.black,
//                                   child: const Center(
//                                       child: Text(
//                                     "Selected Date is : 01/02/23",
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 15.0),
//                                   ))),
//                               Container(
//                                 height: 5.0,
//                                 color: Colors.white,
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: Colors.black, width: 10.0)),
//                                 child: Column(
//                                   children: [
//                                     SizedBox(
//                                       height: 380,
//                                       child: ListView.builder(
//                                           itemCount: 6,
//                                           itemBuilder: (context, i) {
//                                             return Row(
//                                               children: [
//                                                 Padding(
//                                                   padding: const EdgeInsets.all(
//                                                       18.0),
//                                                   child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         const Text(
//                                                             'Dealer Name:'),
//                                                         const Text(
//                                                             'Electronic Paradise'),
//                                                         const Text(''),
//                                                         const Text(
//                                                             'Address : B1 Janakpuri'),
//                                                         const Text(''),
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .only(
//                                                                   left: 40.0),
//                                                           child: ElevatedButton(
//                                                               onPressed: () {},
//                                                               style: const ButtonStyle(
//                                                                   backgroundColor:
//                                                                       MaterialStatePropertyAll<
//                                                                               Color>(
//                                                                           Colors
//                                                                               .grey)),
//                                                               child: const Text(
//                                                                   'Edit')),
//                                                         ),
//                                                       ]),
//                                                 ),
//                                                 Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     const Text('Dealer ID:'),
//                                                     const Text('10001'),
//                                                     const Text(''),
//                                                     const Text(''),
//                                                     const Text(''),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               right: 20.0),
//                                                       child: ElevatedButton(
//                                                           style: const ButtonStyle(
//                                                               backgroundColor:
//                                                                   MaterialStatePropertyAll<
//                                                                           Color>(
//                                                                       Colors
//                                                                           .black)),
//                                                           onPressed: () async{
//                                                             Navigator.of(
//                                                                     context)
//                                                                 .push(MaterialPageRoute(
//                                                                     builder: (context) =>
//                                                                         const SmallMap()));
//                                                             _currentLocation();
//                                                           },
//                                                           child: const Text(
//                                                               'Visit')),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             );
//                                           }),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 height: 10.0,
//                                 color: Colors.white,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   ElevatedButton(
//                                       onPressed: () {},
//                                       style: const ButtonStyle(
//                                           backgroundColor:
//                                               MaterialStatePropertyAll<Color>(
//                                                   Colors.black)),
//                                       child: cancelButton),
//                                   ElevatedButton(
//                                       onPressed: () {
//                                       },
//                                       style: const ButtonStyle(
//                                           backgroundColor:
//                                               MaterialStatePropertyAll<Color>(
//                                                   Colors.black)),
//                                       child: continueButton),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return alert;
//                         },
//                       );
//                     }
//                     showAlertDialog(context);
//                   },
//                   child: Container(
//                     color: Colors.black,
//                     child: ListTile(
//                       title: Text('${data![index]['position']}',style: const TextStyle(color: Colors.white)),
//                       subtitle: Text('${data![index]['company']}',style: const TextStyle(color: Colors.white)),
//                       leading: const Icon(Icons.work,color: Colors.white),
//                      ),
//                   ));
//             }));
//   }
// }

// ignore_for_file: avoid_print, library_private_types_in_public_api, unused_field

import 'dart:collection';
import 'dart:math';
import 'package:beatplan/small_map.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../utils.dart';
import 'StoreVisit/outlet_beat_plan/outlet_beat_plan.dart';

class RecyclerViewData extends StatefulWidget {
  const RecyclerViewData({super.key});

  @override
  _RecyclerViewDataState createState() => _RecyclerViewDataState();
}

class _RecyclerViewDataState extends State<RecyclerViewData> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  late PageController _pageController;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDays.add(_focusedDay.value);
    _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay.value));
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  bool get canClearSelection =>
      _selectedDays.isNotEmpty || _rangeStart != null || _rangeEnd != null;

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForDays(Iterable<DateTime> days) {
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return _getEventsForDays(days);
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: const Text("Cancel", style: TextStyle(color: Colors.white)),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text(
        "Continue",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const OutletBeatPlan()));
      },
    );
    AlertDialog alert = AlertDialog(
      insetPadding: const EdgeInsets.all(5.0),
      scrollable: true,
      content: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 40.0,
                color: Colors.black,
                child: const Center(
                    child: Text(
                  "Selected Date is : 01/02/23",
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ))),
            Container(
              height: 5.0,
              color: Colors.white,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 10.0)),
              child: Column(
                children: [
                  SizedBox(
                    height: 380,
                    child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, i) {
                          return Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Dealer Name:'),
                                      const Text('Electronic Paradise'),
                                      const Text(''),
                                      const Text('Address : B1 Janakpuri'),
                                      const Text(''),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 40.0),
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll<
                                                        Color>(Colors.grey)),
                                            child: const Text('Edit')),
                                      ),
                                    ]),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Dealer ID:'),
                                  const Text('10001'),
                                  const Text(''),
                                  const Text(''),
                                  const Text(''),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll<Color>(
                                                    Colors.black)),
                                        onPressed: () async {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SmallMap()));
                                        },
                                        child: const Text('Visit')),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
            Container(
              height: 10.0,
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.black)),
                    child: cancelButton),
                ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.black)),
                    child: continueButton),
              ],
            ),
          ],
        ),
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _focusedDay.value = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _selectedDays.clear();
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  DateTime _selectedCalendarDate = DateTime.now();
  DateTime? _focusedCalendarDate = DateTime.now();
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ValueListenableBuilder<DateTime>(
            valueListenable: _focusedDay,
            builder: (context, value, _) {
              return _CalendarHeader(
                focusedDay: value,
                clearButtonVisible: canClearSelection,
                onTodayButtonTap: () {
                  setState(() => _focusedDay.value = DateTime.now());
                },
                onClearButtonTap: () {
                  setState(() {
                    _rangeStart = null;
                    _rangeEnd = null;
                    _selectedDays.clear();
                    _selectedEvents.value = [];
                  });
                },
                onLeftArrowTap: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                onRightArrowTap: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              );
            },
          ),
          Container(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 40.0,
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: const Text(
                        'Sun',
                        style: TextStyle(color: Colors.white),
                      )),
                  const Text('Mon'),
                  const Text('Tue'),
                  const Text('Wed'),
                  const Text('Thu'),
                  const Text('Fri'),
                  Container(
                    width: 40.0,
                    alignment: Alignment.center,
                    child: const Text('Sat'),
                  ),
                ],
              ),
            ),
          ),
          TableCalendar<Event>(
            calendarBuilders: CalendarBuilders(
              markerBuilder: (BuildContext context, date, events) {
                if (events.isEmpty) return Container(color: Colors.red,width: 0,height: 0,);
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.all(1),
                        child: Container(
                          width: 5,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)]),
                        ),
                      );
                    });
              },
            ),
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: kToday,
            headerVisible: false,
            daysOfWeekVisible: false,
            selectedDayPredicate: (currentSelectedDate) {
              return (isSameDay(_selectedCalendarDate, currentSelectedDate));
            },
            onDaySelected: (selectedDay, focusedDay) {
              showAlertDialog(context);
              if (!isSameDay(_selectedCalendarDate, selectedDay)) {
                setState(() {
                  _selectedCalendarDate = selectedDay;
                  _focusedCalendarDate = focusedDay;
                });
              }
            },
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            // rangeSelectionMode: _rangeSelectionMode,
            // eventLoader: _getEventsForDay,
            calendarStyle: const CalendarStyle(
              markersAlignment: Alignment.bottomCenter,
              markersMaxCount: 4,
              markersOffset: PositionedOffset(),
              markerDecoration: BoxDecoration( color: Colors.black, shape: BoxShape.circle,),
              selectedDecoration: BoxDecoration(color: Colors.transparent),
              selectedTextStyle: TextStyle(color: Colors.black),
              todayDecoration: BoxDecoration(color: Colors.transparent),
              todayTextStyle: TextStyle(color: Colors.black),
            ),
            // onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onCalendarCreated: (controller) => _pageController = controller,
            onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() => _calendarFormat = format);
              }
            },
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final VoidCallback onTodayButtonTap;
  final VoidCallback onClearButtonTap;
  final bool clearButtonVisible;

  const _CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onTodayButtonTap,
    required this.onClearButtonTap,
    required this.clearButtonVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMMM().format(focusedDay);
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 20.0,
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          height: 60.0,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: onLeftArrowTap,
              ),
              Center(
                child: Expanded(
                  child: SizedBox(
                    width: 165.0,
                    child: Text(
                      headerText,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // IconButton(
              //   icon: const Icon(
              //     Icons.calendar_today,
              //     size: 20.0,
              //     color: Colors.white,
              //   ),
              //   visualDensity: VisualDensity.compact,
              //   onPressed: onTodayButtonTap,
              // ),
              // if (clearButtonVisible)
              //   IconButton(
              //     icon: const Icon(
              //       Icons.clear,
              //       size: 20.0,
              //       color: Colors.white,
              //     ),
              //     visualDensity: VisualDensity.compact,
              //     onPressed: onClearButtonTap,
              //   ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                onPressed: onRightArrowTap,
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: 20.0,
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Container(
            height: 40.0,
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.refresh, color: Colors.white)),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Click Here to Refresh Data',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.white,
          height: 20.0,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }
}
