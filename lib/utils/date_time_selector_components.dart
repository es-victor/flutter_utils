// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:vgo_app/providers/discount_offer_provider.dart';
//
// import '../colors.dart';
// import '../constants.dart';
// import '../providers/authentication_provider.dart';
//
// class DateOfBirthInput extends StatefulWidget {
//   const DateOfBirthInput(
//       {Key? key, required this.year, required this.month, required this.day})
//       : super(key: key);
//   final int year;
//   final int month;
//   final int day;
//
//   @override
//   State<DateOfBirthInput> createState() => _DateOfBirthInputState();
// }
//
// class _DateOfBirthInputState extends State<DateOfBirthInput> {
//   final FixedExtentScrollController _selectOptionsYearController =
//       FixedExtentScrollController(initialItem: 17);
//   final FixedExtentScrollController _selectOptionsMonthController =
//       FixedExtentScrollController();
//   final FixedExtentScrollController _selectOptionsDayController =
//       FixedExtentScrollController();
//
//   @override
//   initState() {
//     initYears();
//     updateDaysInMonth();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _selectOptionsYearController
//           .jumpToItem((DateTime.now().year - widget.year));
//       _selectOptionsMonthController.jumpToItem((widget.month - 1));
//       _selectOptionsDayController.jumpToItem((widget.day - 1));
//       _selectOptionsMonthController.addListener(() {
//         activeMonth.value = _selectOptionsMonthController.selectedItem;
//       });
//       _selectOptionsDayController.addListener(() {
//         activeDay.value = _selectOptionsDayController.selectedItem;
//       });
//     });
//     setDOB();
//     super.initState();
//   }
//
//   @override
//   dispose() {
//     super.dispose();
//     _selectOptionsYearController.dispose();
//     _selectOptionsMonthController.dispose();
//     _selectOptionsDayController.dispose();
//     selectedMonth.dispose();
//     selectedDay.dispose();
//     selectedYear.dispose();
//     dob.dispose();
//     dobDay.dispose();
//   }
//
//   ValueNotifier<int> activeMonth = ValueNotifier(0);
//   ValueNotifier<int> activeDay = ValueNotifier(0);
//
//   /// Date values
//   ValueNotifier<int> selectedYear = ValueNotifier(DateTime.now().year);
//   ValueNotifier<int> selectedMonth = ValueNotifier(dobMonth.keys.first);
//   ValueNotifier<int> selectedDay = ValueNotifier(1);
//   ValueNotifier<List<int>> dobYear = ValueNotifier([]);
//   ValueNotifier<List<int>> dobDay = ValueNotifier([]);
//   ValueNotifier<String> dob = ValueNotifier("");
//
//   updateDaysInMonth() {
//     int dayCount =
//         DateUtils.getDaysInMonth(selectedYear.value, selectedMonth.value);
//     dobDay.value = List.generate(dayCount, (index) => index + 1);
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       mounted
//           ? _selectOptionsDayController.jumpTo(
//               _selectOptionsDayController.position.pixels - 0.0001,
//             )
//           : null;
//     });
//   }
//
//   initYears() async {
//     dobYear.value = List.generate(100, (index) => DateTime.now().year - index);
//   }
//
//   setDOB() {
//     dob.value =
//         "${selectedDay.value > 9 ? "${selectedDay.value}" : "0${selectedDay.value}"}/${selectedMonth.value > 9 ? "${selectedMonth.value}" : "0${selectedMonth.value}"}/${selectedYear.value}";
//     Provider.of<AuthenticationProvider>(context, listen: false)
//         .selectDateOfBirth(dob.value);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       insetPadding: const EdgeInsets.all(p4),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(p4),
//       ),
//       content: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Expanded(
//               key: const Key('3'),
//               child: Wrap(
//                 alignment: WrapAlignment.center,
//                 crossAxisAlignment: WrapCrossAlignment.center,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: p2),
//                     child: Text(
//                       "Day",
//                       style: TextStyle(color: cPrimary),
//                     ),
//                   ),
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       ValueListenableBuilder(
//                           valueListenable: dobDay,
//                           builder: (context, List<int> days, _) {
//                             return ConstrainedBox(
//                               constraints: const BoxConstraints(
//                                   minHeight: selectOptionHeight * 2,
//                                   maxHeight:
//                                       selectOptionHeight * datePreviewCount),
//                               child: ListWheelScrollView(
//                                 itemExtent: selectOptionHeight,
//                                 controller: _selectOptionsDayController,
//                                 scrollBehavior: const ScrollBehavior(),
//                                 physics: const FixedExtentScrollPhysics(
//                                   parent: CustomScrollPhysics(
//                                       ClampingScrollPhysics()),
//                                 ),
//                                 diameterRatio: selectOptionHeight,
//                                 onSelectedItemChanged: (index) {
//                                   selectedDay.value = days[index];
//                                   setDOB();
//                                 },
//                                 children: List.generate(
//                                   days.length,
//                                   (i) => ValueListenableBuilder(
//                                     valueListenable: activeDay,
//                                     builder: (context, int activeMonth, _) {
//                                       return ItemMenu(
//                                         data: (i + 1).toString(),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }),
//                       const SelectedIndicatorLines(),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               key: const Key('2'),
//               child: Wrap(
//                 alignment: WrapAlignment.center,
//                 crossAxisAlignment: WrapCrossAlignment.center,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: p2),
//                     child: Text(
//                       "Month",
//                       style: TextStyle(color: cPrimary),
//                     ),
//                   ),
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       ConstrainedBox(
//                         constraints: const BoxConstraints(
//                             minHeight: selectOptionHeight * 2,
//                             maxHeight: selectOptionHeight * datePreviewCount),
//                         child: ListWheelScrollView(
//                           itemExtent: selectOptionHeight,
//                           controller: _selectOptionsMonthController,
//                           scrollBehavior: const ScrollBehavior(),
//                           physics: const FixedExtentScrollPhysics(
//                             parent:
//                                 CustomScrollPhysics(ClampingScrollPhysics()),
//                           ),
//                           diameterRatio: selectOptionHeight,
//                           onSelectedItemChanged: (index) {
//                             selectedMonth.value = index + 1;
//                             updateDaysInMonth();
//                             setDOB();
//                           },
//                           children: List.generate(
//                             dobMonth.length,
//                             (i) => ValueListenableBuilder(
//                               valueListenable: activeMonth,
//                               builder: (context, int activeMonth, _) {
//                                 return ItemMenu(
//                                   data: dobMonth[i + 1].toString(),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SelectedIndicatorLines(),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               key: const Key('1'),
//               child: Wrap(
//                 alignment: WrapAlignment.center,
//                 crossAxisAlignment: WrapCrossAlignment.center,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: p2),
//                     child: Text(
//                       "Year",
//                       style: TextStyle(color: cPrimary),
//                     ),
//                   ),
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       ConstrainedBox(
//                         constraints: const BoxConstraints(
//                             minHeight: selectOptionHeight * 2,
//                             maxHeight: selectOptionHeight * datePreviewCount),
//                         child: ListWheelScrollView(
//                           itemExtent: selectOptionHeight,
//                           controller: _selectOptionsYearController,
//                           scrollBehavior: const ScrollBehavior(),
//                           physics: const FixedExtentScrollPhysics(
//                             parent:
//                                 CustomScrollPhysics(ClampingScrollPhysics()),
//                           ),
//                           diameterRatio: selectOptionHeight,
//                           onSelectedItemChanged: (index) {
//                             selectedYear.value = dobYear.value[index];
//                             updateDaysInMonth();
//                             setDOB();
//                           },
//                           children: List.generate(
//                             dobYear.value.length,
//                             (i) => ValueListenableBuilder(
//                               valueListenable: selectedYear,
//                               builder: (context, int selectedYear, _) {
//                                 return ItemMenu(
//                                   data: dobYear.value[i].toString(),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SelectedIndicatorLines(),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ValidUntilDate extends StatefulWidget {
//   const ValidUntilDate(
//       {Key? key, required this.year, required this.month, required this.day})
//       : super(key: key);
//   final int year;
//   final int month;
//   final int day;
//
//   @override
//   State<ValidUntilDate> createState() => _ValidUntilDateState();
// }
//
// class _ValidUntilDateState extends State<ValidUntilDate> {
//   final FixedExtentScrollController _selectOptionsYearController =
//       FixedExtentScrollController(initialItem: 17);
//   final FixedExtentScrollController _selectOptionsMonthController =
//       FixedExtentScrollController();
//   final FixedExtentScrollController _selectOptionsDayController =
//       FixedExtentScrollController();
//
//   @override
//   initState() {
//     initYears();
//     updateDaysInMonth();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _selectOptionsYearController
//           .jumpToItem((DateTime.now().year - widget.year));
//       _selectOptionsMonthController.jumpToItem((widget.month - 1));
//       _selectOptionsDayController.jumpToItem((widget.day - 1));
//       _selectOptionsMonthController.addListener(() {
//         activeMonth.value = _selectOptionsMonthController.selectedItem;
//       });
//       _selectOptionsDayController.addListener(() {
//         activeDay.value = _selectOptionsDayController.selectedItem;
//       });
//     });
//     setValidDate();
//     super.initState();
//   }
//
//   @override
//   dispose() {
//     super.dispose();
//     _selectOptionsYearController.dispose();
//     _selectOptionsMonthController.dispose();
//     _selectOptionsDayController.dispose();
//     selectedMonth.dispose();
//     selectedDay.dispose();
//     selectedYear.dispose();
//     dob.dispose();
//     dobDay.dispose();
//   }
//
//   ValueNotifier<int> activeMonth = ValueNotifier(0);
//   ValueNotifier<int> activeDay = ValueNotifier(0);
//
//   /// Date values
//   ValueNotifier<int> selectedYear = ValueNotifier(DateTime.now().year);
//   ValueNotifier<int> selectedMonth = ValueNotifier(dobMonth.keys.first);
//   ValueNotifier<int> selectedDay = ValueNotifier(1);
//   ValueNotifier<List<int>> dobYear = ValueNotifier([]);
//   ValueNotifier<List<int>> dobDay = ValueNotifier([]);
//   ValueNotifier<String> dob = ValueNotifier("");
//
//   updateDaysInMonth() {
//     int dayCount =
//         DateUtils.getDaysInMonth(selectedYear.value, selectedMonth.value);
//     dobDay.value = List.generate(dayCount, (index) => index + 1);
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       mounted
//           ? _selectOptionsDayController.jumpTo(
//               _selectOptionsDayController.position.pixels - 0.0001,
//             )
//           : null;
//     });
//   }
//
//   initYears() async {
//     dobYear.value = List.generate(2, (index) => DateTime.now().year + index);
//   }
//
//   setValidDate() {
//     dob.value =
//         "${selectedDay.value > 9 ? "${selectedDay.value}" : "0${selectedDay.value}"}/${selectedMonth.value > 9 ? "${selectedMonth.value}" : "0${selectedMonth.value}"}/${selectedYear.value}";
//     Provider.of<DiscountOfferProvider>(context, listen: false)
//         .setValidUntilDate(dob.value);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       insetPadding: const EdgeInsets.all(p4),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(p4),
//       ),
//       content: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Expanded(
//               key: const Key('3'),
//               child: Wrap(
//                 alignment: WrapAlignment.center,
//                 crossAxisAlignment: WrapCrossAlignment.center,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: p2),
//                     child: Text(
//                       "Day",
//                       style: TextStyle(color: cPrimary),
//                     ),
//                   ),
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       ValueListenableBuilder(
//                           valueListenable: dobDay,
//                           builder: (context, List<int> days, _) {
//                             return ConstrainedBox(
//                               constraints: const BoxConstraints(
//                                   minHeight: selectOptionHeight * 2,
//                                   maxHeight:
//                                       selectOptionHeight * datePreviewCount),
//                               child: ListWheelScrollView(
//                                 itemExtent: selectOptionHeight,
//                                 controller: _selectOptionsDayController,
//                                 scrollBehavior: const ScrollBehavior(),
//                                 physics: const FixedExtentScrollPhysics(
//                                   parent: CustomScrollPhysics(
//                                       ClampingScrollPhysics()),
//                                 ),
//                                 diameterRatio: selectOptionHeight,
//                                 onSelectedItemChanged: (index) {
//                                   selectedDay.value = days[index];
//                                   setValidDate();
//                                 },
//                                 children: List.generate(
//                                   days.length,
//                                   (i) => ValueListenableBuilder(
//                                     valueListenable: activeDay,
//                                     builder: (context, int activeMonth, _) {
//                                       return ItemMenu(
//                                         data: (i + 1).toString(),
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }),
//                       const SelectedIndicatorLines(),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               key: const Key('2'),
//               child: Wrap(
//                 alignment: WrapAlignment.center,
//                 crossAxisAlignment: WrapCrossAlignment.center,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: p2),
//                     child: Text(
//                       "Month",
//                       style: TextStyle(color: cPrimary),
//                     ),
//                   ),
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       ConstrainedBox(
//                         constraints: const BoxConstraints(
//                             minHeight: selectOptionHeight * 2,
//                             maxHeight: selectOptionHeight * datePreviewCount),
//                         child: ListWheelScrollView(
//                           itemExtent: selectOptionHeight,
//                           controller: _selectOptionsMonthController,
//                           scrollBehavior: const ScrollBehavior(),
//                           physics: const FixedExtentScrollPhysics(
//                             parent:
//                                 CustomScrollPhysics(ClampingScrollPhysics()),
//                           ),
//                           diameterRatio: selectOptionHeight,
//                           onSelectedItemChanged: (index) {
//                             selectedMonth.value = index + 1;
//                             updateDaysInMonth();
//                             setValidDate();
//                           },
//                           children: List.generate(
//                             dobMonth.length,
//                             (i) => ValueListenableBuilder(
//                               valueListenable: activeMonth,
//                               builder: (context, int activeMonth, _) {
//                                 return ItemMenu(
//                                   data: dobMonth[i + 1].toString(),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SelectedIndicatorLines(),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               key: const Key('1'),
//               child: Wrap(
//                 alignment: WrapAlignment.center,
//                 crossAxisAlignment: WrapCrossAlignment.center,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: p2),
//                     child: Text(
//                       "Year",
//                       style: TextStyle(color: cPrimary),
//                     ),
//                   ),
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       ConstrainedBox(
//                         constraints: const BoxConstraints(
//                             minHeight: selectOptionHeight * 2,
//                             maxHeight: selectOptionHeight * datePreviewCount),
//                         child: ListWheelScrollView(
//                           itemExtent: selectOptionHeight,
//                           controller: _selectOptionsYearController,
//                           scrollBehavior: const ScrollBehavior(),
//                           physics: const FixedExtentScrollPhysics(
//                             parent:
//                                 CustomScrollPhysics(ClampingScrollPhysics()),
//                           ),
//                           diameterRatio: selectOptionHeight,
//                           onSelectedItemChanged: (index) {
//                             selectedYear.value = dobYear.value[index];
//                             updateDaysInMonth();
//                             setValidDate();
//                           },
//                           children: List.generate(
//                             dobYear.value.length,
//                             (i) => ValueListenableBuilder(
//                               valueListenable: selectedYear,
//                               builder: (context, int selectedYear, _) {
//                                 return ItemMenu(
//                                   data: dobYear.value[i].toString(),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SelectedIndicatorLines(),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class TimingsPicker extends StatefulWidget {
//   const TimingsPicker({
//     Key? key,
//     required this.fromHour,
//     required this.fromMinute,
//     required this.toHour,
//     required this.toMinute,
//   }) : super(key: key);
//   final int fromHour;
//   final int fromMinute;
//   final int toMinute;
//   final int toHour;
//
//   @override
//   State<TimingsPicker> createState() => _TimingsPickerState();
// }
//
// class _TimingsPickerState extends State<TimingsPicker> {
//   final FixedExtentScrollController _fromHoursController =
//       FixedExtentScrollController(initialItem: 9);
//   final FixedExtentScrollController _fromMinutesController =
//       FixedExtentScrollController(initialItem: 00);
//   final FixedExtentScrollController _toHoursController =
//       FixedExtentScrollController(initialItem: 17);
//   final FixedExtentScrollController _toMinutesController =
//       FixedExtentScrollController(initialItem: 00);
//
//   /// Date values
//   final ValueNotifier<int> _selectedFromHours = ValueNotifier(9);
//   final ValueNotifier<int> _selectedFromMinutes = ValueNotifier(0);
//   final ValueNotifier<int> _selectedToMinutes = ValueNotifier(0);
//   final ValueNotifier<int> _selectedToHours = ValueNotifier(17);
//   final ValueNotifier<String> _weekDaysString = ValueNotifier("");
//   final ValueNotifier<String> _fromTime = ValueNotifier("");
//   final ValueNotifier<String> _toTime = ValueNotifier("");
//   final ValueNotifier<List<String>> _selectedWeekDays = ValueNotifier([]);
//
//   ///
//   @override
//   initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       setWeekDaysTimingString();
//       setFromTime();
//       setToTime();
//     });
//     super.initState();
//   }
//
//   @override
//   dispose() {
//     super.dispose();
//     _fromHoursController.dispose();
//     _fromMinutesController.dispose();
//     _toHoursController.dispose();
//     _toMinutesController.dispose();
//
//     ///
//     _selectedFromHours.dispose();
//     _selectedFromMinutes.dispose();
//     _selectedToMinutes.dispose();
//     _selectedToHours.dispose();
//     _selectedWeekDays.dispose();
//     _toTime.dispose();
//     _fromTime.dispose();
//     _weekDaysString.dispose();
//   }
//
//   setFromTime() {
//     _fromTime.value = (_selectedFromHours.value > 9)
//         ? _selectedFromHours.value.toString()
//         : "0${_selectedFromHours.value}";
//     _fromTime.value =
//         "${_fromTime.value}${_selectedFromMinutes.value > 9 ? _selectedFromMinutes.value.toString() : "0${_selectedFromMinutes.value}"}";
//
//     setTiming();
//   }
//
//   setToTime() {
//     _toTime.value = _selectedToHours.value > 9
//         ? _selectedToHours.value.toString()
//         : "0${_selectedToHours.value}";
//     _toTime.value =
//         "${_toTime.value}${_selectedToMinutes.value > 9 ? _selectedToMinutes.value.toString() : "0${_selectedToMinutes.value}"}";
//
//     setTiming();
//   }
//
//   setTiming() {
//     String timings =
//         "${_weekDaysString.value}, from ${_fromTime.value}-${_toTime.value} Hrs";
//     Provider.of<DiscountOfferProvider>(context, listen: false)
//         .setTimings(timings);
//   }
//
//   setWeekDaysTimingString() {
//     if (_selectedWeekDays.value.isEmpty) {
//       _weekDaysString.value = "Everyday";
//     } else if (_selectedWeekDays.value.length == weekDayName.length) {
//       _weekDaysString.value = "Everyday";
//     } else if (_selectedWeekDays.value.length == 1) {
//       _weekDaysString.value = _selectedWeekDays.value.first;
//     } else if (_selectedWeekDays.value.length > 1) {
//       List<int> days =
//           _selectedWeekDays.value.map((e) => weekDayName.indexOf(e)).toList();
//       days.sort();
//       _weekDaysString.value =
//           "${weekDayName[days.first]} to ${weekDayName[days.last]}";
//       for (int i = 0; i < days.length; i++) {
//         int j = i + 1;
//         if (j == days.length) break;
//         if ((days[i] + 1) != days[j]) {
//           _weekDaysString.value = days.map((e) => weekDayName[e]).join(",");
//           break;
//         }
//       }
//     }
//   }
//
//   SingleChildScrollView weekdays({bool selected = true}) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       key: UniqueKey(),
//       child: ValueListenableBuilder(
//           valueListenable: _selectedWeekDays,
//           builder: (context, List<String> selectedWeekDays, _) {
//             return Row(
//               children: weekDayName
//                   .map(
//                     (d) => GestureDetector(
//                       key: ValueKey(d),
//                       onTap: () {
//                         if (selectedWeekDays.contains(d)) {
//                           _selectedWeekDays.value.remove(d);
//                         } else {
//                           _selectedWeekDays.value.add(d);
//                         }
//                         _selectedWeekDays.notifyListeners();
//                         setWeekDaysTimingString();
//                         setTiming();
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: p1),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: p2,
//                             vertical: p2,
//                           ),
//                           decoration: BoxDecoration(
//                             color: selectedWeekDays.contains(d)
//                                 ? cGrey3
//                                 : Theme.of(context).scaffoldBackgroundColor,
//                             borderRadius: BorderRadius.circular(p2),
//                           ),
//                           child: Text(
//                             d,
//                             style: TextStyle(
//                               color: selectedWeekDays.contains(d)
//                                   ? cWhite
//                                   : cGrey3,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                   .toList(),
//             );
//           }),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       insetPadding: const EdgeInsets.all(p4),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(p4),
//       ),
//       content: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         child: Wrap(
//           alignment: WrapAlignment.center,
//           children: [
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: p2),
//               child: Text(
//                 "Timings",
//                 style: TextStyle(color: cPrimary),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: p2),
//               child: weekdays(),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: Wrap(
//                     alignment: WrapAlignment.center,
//                     children: [
//                       toFromLabel(text: "From"),
//                       Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Expanded(
//                             key: UniqueKey(),
//                             child: Wrap(
//                               alignment: WrapAlignment.center,
//                               crossAxisAlignment: WrapCrossAlignment.center,
//                               children: [
//                                 mhLabel(text: "H"),
//                                 Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     ConstrainedBox(
//                                       constraints: const BoxConstraints(
//                                           minHeight: selectOptionHeight * 2,
//                                           maxHeight: selectOptionHeight *
//                                               datePreviewCount),
//                                       child: ListWheelScrollView(
//                                         itemExtent: selectOptionHeight,
//                                         controller: _fromHoursController,
//                                         scrollBehavior: const ScrollBehavior(),
//                                         physics: const FixedExtentScrollPhysics(
//                                           parent: CustomScrollPhysics(
//                                               ClampingScrollPhysics()),
//                                         ),
//                                         diameterRatio: selectOptionHeight,
//                                         onSelectedItemChanged: (index) {
//                                           _selectedFromHours.value = index;
//                                           setFromTime();
//                                         },
//                                         children: List.generate(
//                                           24,
//                                           (i) => ValueListenableBuilder(
//                                             valueListenable: _selectedFromHours,
//                                             builder: (context,
//                                                 int selectedFromHours, _) {
//                                               return ItemMenu(
//                                                 data: i > 9
//                                                     ? i.toString()
//                                                     : "0$i",
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SelectedIndicatorLines(),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             key: UniqueKey(),
//                             child: Wrap(
//                               alignment: WrapAlignment.center,
//                               crossAxisAlignment: WrapCrossAlignment.center,
//                               children: [
//                                 mhLabel(text: "m"),
//                                 Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     ConstrainedBox(
//                                       constraints: const BoxConstraints(
//                                           minHeight: selectOptionHeight * 2,
//                                           maxHeight: selectOptionHeight *
//                                               datePreviewCount),
//                                       child: ListWheelScrollView(
//                                         itemExtent: selectOptionHeight,
//                                         controller: _fromMinutesController,
//                                         scrollBehavior: const ScrollBehavior(),
//                                         physics: const FixedExtentScrollPhysics(
//                                           parent: CustomScrollPhysics(
//                                               ClampingScrollPhysics()),
//                                         ),
//                                         diameterRatio: selectOptionHeight,
//                                         onSelectedItemChanged: (index) {
//                                           _selectedFromMinutes.value = index;
//                                           setFromTime();
//                                         },
//                                         children: List.generate(
//                                           60,
//                                           (i) => ValueListenableBuilder(
//                                             valueListenable:
//                                                 _selectedFromMinutes,
//                                             builder: (context,
//                                                 int selectedFromMinutes, _) {
//                                               return ItemMenu(
//                                                 data: i > 9
//                                                     ? i.toString()
//                                                     : "0$i",
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SelectedIndicatorLines(),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: p2),
//
//                 /// To
//                 Expanded(
//                   child: Wrap(
//                     alignment: WrapAlignment.center,
//                     children: [
//                       toFromLabel(text: "To"),
//                       Row(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Expanded(
//                             key: UniqueKey(),
//                             child: Wrap(
//                               alignment: WrapAlignment.center,
//                               crossAxisAlignment: WrapCrossAlignment.center,
//                               children: [
//                                 mhLabel(text: "H"),
//                                 Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     ConstrainedBox(
//                                       constraints: const BoxConstraints(
//                                           minHeight: selectOptionHeight * 2,
//                                           maxHeight: selectOptionHeight *
//                                               datePreviewCount),
//                                       child: ListWheelScrollView(
//                                         itemExtent: selectOptionHeight,
//                                         controller: _toHoursController,
//                                         scrollBehavior: const ScrollBehavior(),
//                                         physics: const FixedExtentScrollPhysics(
//                                           parent: CustomScrollPhysics(
//                                               ClampingScrollPhysics()),
//                                         ),
//                                         diameterRatio: selectOptionHeight,
//                                         onSelectedItemChanged: (index) {
//                                           _selectedToHours.value = index;
//                                           setToTime();
//                                         },
//                                         children: List.generate(
//                                           24,
//                                           (i) => ValueListenableBuilder(
//                                             valueListenable: _selectedToHours,
//                                             builder: (context,
//                                                 int selectedToHours, _) {
//                                               return ItemMenu(
//                                                 data: i > 9
//                                                     ? i.toString()
//                                                     : "0$i",
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SelectedIndicatorLines(),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             key: UniqueKey(),
//                             child: Wrap(
//                               alignment: WrapAlignment.center,
//                               crossAxisAlignment: WrapCrossAlignment.center,
//                               children: [
//                                 mhLabel(text: "m"),
//                                 Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     ConstrainedBox(
//                                       constraints: const BoxConstraints(
//                                           minHeight: selectOptionHeight * 2,
//                                           maxHeight: selectOptionHeight *
//                                               datePreviewCount),
//                                       child: ListWheelScrollView(
//                                         itemExtent: selectOptionHeight,
//                                         controller: _toMinutesController,
//                                         scrollBehavior: const ScrollBehavior(),
//                                         physics: const FixedExtentScrollPhysics(
//                                           parent: CustomScrollPhysics(
//                                               ClampingScrollPhysics()),
//                                         ),
//                                         diameterRatio: selectOptionHeight,
//                                         onSelectedItemChanged: (index) {
//                                           _selectedToMinutes.value = index;
//                                           setToTime();
//                                         },
//                                         children: List.generate(
//                                           60,
//                                           (i) => ValueListenableBuilder(
//                                             valueListenable: _selectedToMinutes,
//                                             builder: (context,
//                                                 int selectedToMinutes, _) {
//                                               return ItemMenu(
//                                                 data: i > 9
//                                                     ? i.toString()
//                                                     : "0$i",
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SelectedIndicatorLines(),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Padding mhLabel({required String text}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: p2),
//       child: Text(
//         text,
//         style: TextStyle(color: cGrey6),
//       ),
//     );
//   }
//
//   Widget toFromLabel({required String text}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: p2),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: p2),
//         decoration: BoxDecoration(
//           color: cGrey9,
//           borderRadius: BorderRadius.circular(p2),
//         ),
//         alignment: Alignment.center,
//         child: Text(
//           text,
//           style: const TextStyle(color: cPrimary),
//         ),
//       ),
//     );
//   }
// }
//
// class ItemMenu extends StatelessWidget {
//   const ItemMenu({
//     required this.data,
//     Key? key,
//   }) : super(key: key);
//   final String data;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: selectOptionHeight,
//       alignment: Alignment.center,
//       child: Text(
//         data,
//         style: const TextStyle(
//           fontWeight: FontWeight.w500,
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
// }
//
// class CustomScrollPhysics extends ScrollPhysics {
//   const CustomScrollPhysics(ScrollPhysics? parent) : super(parent: parent);
//
//   @override
//   CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
//     return CustomScrollPhysics(buildParent(ancestor));
//   }
//
//   @override
//   SpringDescription get spring => const SpringDescription(
//         mass: 150,
//         stiffness: 500,
//         damping: 0.5,
//       );
// }
//
// class SelectedIndicatorLines extends StatelessWidget {
//   const SelectedIndicatorLines({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return IgnorePointer(
//       ignoring: true,
//       child: Container(
//         alignment: Alignment.center,
//         height: selectOptionHeight,
//         decoration: BoxDecoration(
//           border: Border.symmetric(
//             horizontal: BorderSide(
//               color: cGrey2,
//               width: 2,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
