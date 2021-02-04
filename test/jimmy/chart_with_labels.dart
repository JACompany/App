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
//       color: Colors.white,
//       theme: ThemeData(
//         primaryColor: Colors.blue,
//         fontFamily: "Arial",
//         brightness: Brightness.light,
//       ),
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
//     return Center(
//         child: Container(
//             color: Colors.white,
//             child: LineChart(
//               LineChartData(
//                   lineTouchData: LineTouchData(
//                     touchTooltipData: LineTouchTooltipData(
//                       tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
//                     ),
//                     touchCallback: (LineTouchResponse touchResponse) {},
//                     handleBuiltInTouches: true,
//                   ),
//                   gridData: FlGridData(
//                     show: false,
//                   ),
//                   titlesData: FlTitlesData(
//                     bottomTitles: SideTitles(
//                       showTitles: true,
//                       reservedSize: 20,
//                       getTextStyles: (value) => const TextStyle(
//                         color: Color(0xff72719b),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                       margin: 10,
//                       getTitles: (value) {
//                         switch (value.toInt()) {
//                           case 2:
//                             return 'SEPT';
//                           case 7:
//                             return 'OCT';
//                           case 12:
//                             return 'DEC';
//                         }
//                         return '';
//                       },
//                     ),
//                     leftTitles: SideTitles(
//                       showTitles: true,
//                       getTextStyles: (value) => const TextStyle(
//                         color: Color(0xff75729e),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 14,
//                       ),
//                       // getTitles: (value) {
//                       //   switch (value.toInt()) {
//                       //     case 1:
//                       //       return '1m';
//                       //     case 2:
//                       //       return '2m';
//                       //     case 3:
//                       //       return '3m';
//                       //     case 4:
//                       //       return '5m';
//                       //   }
//                       //   return '';
//                       // },
//                       margin: 8,
//                       reservedSize: 30,
//                     ),
//                   ),
//                   lineBarsData: [
//                     LineChartBarData(
//                       colors: [Colors.blue],
//                       spots: [
//                         FlSpot(0, 3),
//                         FlSpot(2, 2),
//                         FlSpot(3, 5),
//                         FlSpot(4, 3.1),
//                         FlSpot(5, 4),
//                         FlSpot(6, 3),
//                         FlSpot(7, 4),
//                       ],
//                     ),
//                   ]),
//             )));
//   }
// }
