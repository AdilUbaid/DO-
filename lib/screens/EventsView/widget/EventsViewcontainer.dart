// import 'package:flutter/material.dart';
// // import 'package:flutter/src/widgets/container.dart';
// // import 'package:flutter/src/widgets/framework.dart';

// class EventsViewContainer extends StatelessWidget {
//   const EventsViewContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     const Text(
//                       "Tax payment",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'comic',
//                           fontSize: 23),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 0),
//                   child: TextButton(
//                       onPressed: () {},
//                       child: Container(
//                         width: 65,
//                         // ignore: sort_child_properties_last
//                         child: const Padding(
//                           padding: EdgeInsets.only(bottom: 2),
//                           child: Text(
//                             'high',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontFamily: 'comic',
//                                 fontSize: 20,
//                                 color: rBlack),
//                           ),
//                         ),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: cRed),
//                       )),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding:
//                 const EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 0),
//             child: Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 6),
//                     child: Row(
//                       // ignore: prefer_const_literals_to_create_immutables
//                       children: [
//                         Icon(Icons.access_time),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8),
//                           child: const Text('9:00 am ',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontFamily: 'comic',
//                                 fontSize: 20,
//                               )),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 6),
//                     child: Row(
//                       // ignore: prefer_const_literals_to_create_immutables
//                       children: [
//                         Icon(Icons.location_on_outlined),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8),
//                           child: const Text('Kottiyam,Kollam',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontFamily: 'comic',
//                                 fontSize: 20,
//                               )),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(top: 13, left: 10, right: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.edit_calendar_outlined,
//                             size: 30,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.delete_outline,
//                             size: 30,
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
