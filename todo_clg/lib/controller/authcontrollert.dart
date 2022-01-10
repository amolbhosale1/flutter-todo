import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class authController extends GetxController {
  final auth = FirebaseAuth.instance.currentUser.obs() != null;
  final firestore = FirebaseAuth.instance.currentUser;
  final logOut = FirebaseAuth.instance.signOut().obs();
  Future<void> signout() async{
    await FirebaseAuth.instance.signOut().obs();
  }
}
