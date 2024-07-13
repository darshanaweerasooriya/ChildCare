// import 'package:flutter/material.dart';
//
// class post extends StatefulWidget {
//   const post({Key? key}) : super(key: key);
//
//   @override
//   State<post> createState() => _postState();
// }
//
// class _postState extends State<post> {
//   final bool _isNotvalidate = false;
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(length: 2,
//         child:
//         SafeArea(
//           child: Scaffold(
//             body: ListView(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 10,),
//                    Row(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: [
//                        Container(
//                          width: 390,
//                          height: 200,
//                          color: Colors.grey,
//                          child: Expanded(
//                            child: TextField(
//
//                              keyboardType: TextInputType.text,
//                              decoration: InputDecoration(
//                                filled: true,
//                                fillColor: Colors.white,
//                                errorStyle: TextStyle(color: Colors.white),
//                                errorText: _isNotvalidate ? "Enter proper Info": null,
//                                border: OutlineInputBorder(),
//
//                              ),
//                            ),
//                          ),
//                        )
//                      ],
//                    )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         )
//     );;
//   }
// }
