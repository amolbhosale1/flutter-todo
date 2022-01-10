// import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:todo_clg/controller/authcontrollert.dart';


// class getPer {

// getPersonData() async {
//   Map<String, String> Details = {};
//   // calling our firestore
//   // calling our user model
//   // sedning these values

//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     authController authsss = Get.find<authController>();
//   User? user = authsss.firestore;
//   //print(user);
//   var getUserFromFireBase;
//   DocumentSnapshot documentSnapshot =
//       await firebaseFirestore.collection("users").doc(user!.uid).get();

//   getUserFromFireBase = documentSnapshot.data();
//   var jsonEncodeValue = jsonEncode(getUserFromFireBase);

//   var jsonDecodeValue = jsonDecode(jsonEncodeValue);
//   //print(jsonDecodeValue);

//   Details["name"] = jsonDecodeValue["name"];
//   Details["email"] = jsonDecodeValue["email"];

//   //Fluttertoast.showToast(msg: "Account created successfully :) ");
//   //  print( await firebaseFirestore
//   //       .collection("tonos")
//   //       .doc(user.uid).get()
//   //       // .collection("todos")
//   //       // .doc(user.uid)
//   //       // .get()
//   //       );
//   //print(Details);
//   return Details;

//   //return jsonDecodeValue;
// }
// }