import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clg/controller/authcontrollert.dart';
import 'package:todo_clg/screen/homeScreen.dart';
import 'package:todo_clg/screen/register/logins.dart';
import 'package:todo_clg/screen/register/registerHome.dart';

void main() => runApp(const DrawerPanel());

authController authsss = Get.find<authController>();

class DrawerPanel extends StatefulWidget {
  const DrawerPanel({Key? key}) : super(key: key);

  @override
  _DrawerPanelState createState() => _DrawerPanelState();
}

class _DrawerPanelState extends State<DrawerPanel> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, sss}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

bool aut = authsss.auth;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const mydra(),
    
    );
  }

  // Widget scrr(int a) {
  //   switch (a) {
  //     case 1:
  //       return HomeScreen();
  //       break;
  //     case 2:
  //       return LoginScreen();
  //       break;
  //     case 3:
  //       return RegistrationScreen();
  //       break;

  //     default:
  //       return HomeScreen();
  //   }
  // }

}

class mydra extends StatefulWidget {
  const mydra({Key? key}) : super(key: key);

  @override
  _mydraState createState() => _mydraState();
}

var sss;

class _mydraState extends State<mydra> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple[50],
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(60)),
                    height: 50,
                    width: 50,
                   
                    // child: Image.network(
                    //     "https://cdn-icons.flaticon.com/png/512/4140/premium/4140037.png?token=exp=1641421450~hmac=ffa89cc64e07ef4c214799fc5cb66e19")
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Container(
                    child: const Text("welc",
                        style:
                            TextStyle(fontFamily: "sansserif", fontSize: 20)),
                    alignment: Alignment.topLeft,
                  ),
                ),
              ],
            ),
          ),
         
          ListTile(
            title: const Text("Home"),
            onTap: () {
              setState(() {
                Navigator.pop(context);
               Obx(
                ()=> aut ? HomeScreen() : LoginScreen(),
                    );
                //  print(Get.find<authController>().auth);
              });
            },
          ),
          // ListTile(
          //   title: const Text("Logout"),
          //   onTap: () async {
          //     await authsss.signout();
          //     authsss.logOut;
          //     Navigator.pop(context);
          //     Get.to(LoginScreen());
          //     //     print(Get.find<authController>().auth);

          //   },
          // ),
          ListTile(
            title: Text("Login"),
            onTap: () {
              setState(() {
                Navigator.pop(context);
                aut ? authsss.signout() : Get.off(LoginScreen());
                // print(Get.find<authController>().firestore);
              });
            },
          ),
          ListTile(
            title: Text("Register"),
            onTap: () {
              setState(() {
                Navigator.pop(context);
                Get.to(RegistrationScreen());
              });
            },
          ),
        ],
      ),
    );
  }
}
