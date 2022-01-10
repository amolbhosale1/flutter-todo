// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:todo_clg/controller/notification.dart';
// import 'package:todo_clg/controller/todoController.dart';
// import 'package:todo_clg/model/todo.dart';

// DateTime? dateTime;

// class TodoScreen extends StatelessWidget {
//   final TodoController todoController = Get.find();
//   final int? index;
//   final NotificationService _notificationService = NotificationService();
//   final GlobalKey<FormState> _inpdata = GlobalKey<FormState>();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   TodoScreen({Key? key, this.index}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     String? text;
//     // print("index ");

//     if (index != null) {
//       // print(index!.toInt());
//       // print(todoController.todo[index!].date);
//       text = todoController.todo[index!].text;
//     }
//     TextEditingController _textamol = TextEditingController(text: text);
//     //late String tetss;

//     return Scaffold(
//       key: _scaffoldKey,
//       body: Container(
//         child: Form(
//             key: _inpdata,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
//               child: Column(
//                 //  crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const Text(
//                     "Add Task",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.lightBlue, fontSize: 25),
//                   ),
//                   TextFormField(
//                     autofocus: true,
//                     controller: _textamol,
//                     textAlign: TextAlign.center,
//                     decoration: const InputDecoration(
//                         hintText: 'What do you want to accomplish?',
//                         border: InputBorder.none,
//                         focusedBorder: InputBorder.none),
//                     style: const TextStyle(
//                       fontSize: 25.0,
//                     ),
//                     keyboardType: TextInputType.multiline,
//                     // onChanged: (value) {
//                     //   tetss=value;
//                     // },
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     "add Deadline",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.lightBlue, fontSize: 25),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),

//                   // SizedBox(
//                   //   width: MediaQuery.of(context).copyWith().size.width * 0.50,
//                   //   child: DateTimeFormField(
//                   //     decoration: const InputDecoration(
//                   //       hintStyle: TextStyle(color: null),
//                   //       errorStyle: TextStyle(color: Colors.redAccent),
//                   //       border: OutlineInputBorder(),
//                   //       suffixIcon: Icon(Icons.calendar_today),
//                   //       hintText: "Enter Date/Deadline",
//                   //     ),
//                   //     // controller: dateEditingController,
//                   //     mode: DateTimeFieldPickerMode.dateAndTime,
//                   //     initialDatePickerMode: DatePickerMode.day,
//                   //     firstDate: DateTime.now(),
//                   //     autovalidateMode: AutovalidateMode.always,
//                   //     validator: (e) => (e?.day ?? 0) == 1
//                   //         ? 'Please not the first day'
//                   //         : null,
//                   //     onDateSelected: (DateTime value) {
//                   //       dateTime = value;
//                   //     },
//                   //   ),
//                   // ),

//                   Container(
//                     decoration: BoxDecoration(),
//                     height:
//                         MediaQuery.of(context).copyWith().size.height * 0.25,
//                     child: are(),
//                   ),

//                   // ElevatedButton(
//                   //   child: const Text('showBottomSheet'),
//                   //   onPressed: () {
//                   //     _scaffoldKey.currentState!.showBottomSheet<void>(
//                   //       (BuildContext context) {
//                   //         return Container(
//                   //           height: 200,
//                   //           color: Colors.amber,
//                   //           child: Center(
//                   //             child: Column(
//                   //               mainAxisAlignment: MainAxisAlignment.center,
//                   //               mainAxisSize: MainAxisSize.min,
//                   //               children: <Widget>[
//                   //                 const Text('BottomSheet'),
//                   //                 ElevatedButton(
//                   //                     child: const Text('Close BottomSheet'),
//                   //                     onPressed: () {
//                   //                       Navigator.pop(context);
//                   //                     })
//                   //               ],
//                   //             ),
//                   //           ),
//                   //         );
//                   //       },
//                   //     );
//                   //   },
//                   // ),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           Get.back();
//                         },
//                         child: const Text("cancel"),
//                         style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all(Colors.red),
//                         ),
//                       ),
//                       ElevatedButton(
//                         child: Text((this.index == null) ? 'Add' : 'Edit'),
//                         // col: Colors.green,
//                         style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all(Colors.green)),
//                         onPressed: () async {
//                           if (_inpdata.currentState!.validate()) {
//                             print(dateTime);
//                             if (index.isNull) {
//                               todoController.todo.add(
//                                   Todo(text: _textamol.text, date: dateTime));
//                               await _notificationService.scheduleNotifications(
//                                   0, "kiy", _textamol.text, dateTime);
//                             } else {
//                               var editing = todoController.todo[index!.toInt()];
//                               editing.text = _textamol.text.toString();
//                               editing.date = dateTime;
//                               todoController.todo[index!] = editing;
//                               await _notificationService.scheduleNotifications(
//                                   0,
//                                   "kiy",
//                                   editing.text.toString(),
//                                   editing.date);
//                             }
//                           }
//                           Get.back();
//                         },
//                       )
//                     ], //row_children
//                   )
//                 ], //column_children
//               ),
//             )),
//       ),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// class are extends StatefulWidget {
//   const are({Key? key}) : super(key: key);

//   @override
//   _areState createState() => _areState();
// }

// class _areState extends State<are> {
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).copyWith().size.height * 0.25,
//       child: CupertinoDatePicker(
//         mode: CupertinoDatePickerMode.dateAndTime,
//         onDateTimeChanged: (value) {
//           if (value != null && value != dateTime)
//             // ignore: curly_braces_in_flow_control_structures
//             setState(() {
//               dateTime = value;
//             });
//         },
//         initialDateTime: DateTime.now(),
//         minimumYear: 2019,
//         //maximumYear: 2021,
//         //use24hFormat: true,
//         //backgroundColor: Colors.transparent,
//       ),
//     );
//   }

//   // Widget buildCuppertinoDatePicker() => CupertinoDatePicker(
//   //       mode: CupertinoDatePickerMode.dateAndTime,
//   //       onDateTimeChanged: (value) {
//   //         if (value != null && value != dateTime)
//   //           // ignore: curly_braces_in_flow_control_structures
//   //           setState(() {
//   //             dateTime = value;
//   //           });
//   //       },
//   //       initialDateTime: DateTime.now(),
//   //       minimumYear: 2019,
//   //       //maximumYear: 2021,
//   //       //use24hFormat: true,
//   //       //backgroundColor: Colors.transparent,
//   //     );
// }
