// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'globalValues.dart' as values;
// import 'package:flutter_sparkline/flutter_sparkline.dart';
// import 'package:fl_chart/fl_chart.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Jimmy Test File',
//       debugShowCheckedModeBanner: false,
//       home: ProgressGraph(),
//     );
//   }
// }

// class ProgressGraph extends StatefulWidget {
//   @override
//   _ProgressGraph createState() => _ProgressGraph();
// }

// class _ProgressGraph extends State<ProgressGraph> {
//   @override
//   Widget build(BuildContext context) {
//     var lineWidth;
//     return Center(
//       child: Container(
//         color: Colors.grey,
//         width: MediaQuery.of(context).size.width / 2,
//         height: MediaQuery.of(context).size.height / 2,
//         child: Stack(
//           children: <Widget>[
//             Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   const SizedBox(
//                     height: 37,
//                   ),
//                   const Text(
//                     '',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   const Text(
//                     'TRENDS',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 2), // Arial
//                     textAlign: TextAlign.left,
//                   ),
//                   const SizedBox(
//                     height: 37,
//                   ),
//                   Expanded(
//                     child: Padding(
//                         padding: const EdgeInsets.only(right: 16.0, left: 6.0),
//                         child: LineChart(
//                           LineChartData(lineBarsData: [
//                             LineChartBarData(
//                               colors: [Colors.pinkAccent],
//                               spots: [
//                                 FlSpot(0, 3),
//                                 FlSpot(2, 2),
//                                 FlSpot(3, 5),
//                                 FlSpot(4, 3.1),
//                                 FlSpot(5, 4),
//                                 FlSpot(6, 3),
//                               ],
//                               barWidth: 8,
//                               isStrokeCapRound: true,
//                               dotData: FlDotData(
//                                 show: false,
//                               ),
//                               belowBarData: BarAreaData(
//                                 show: false,
//                               ),
//                             ),
//                           ]),
//                         )),
//                   ),
//                 ]),
//           ],
//         ),
//       ),
//     );
//   }

//   sampleData1() {}
// }
