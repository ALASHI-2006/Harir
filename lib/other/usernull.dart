import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:harir/other/none_cart.dart';
import 'package:harir/shalat/details.dart';
import '../home/loginscreen.dart';
import '../home/home_screen.dart';

class Bottomnull extends StatefulWidget {
  const Bottomnull({super.key});

  @override
  State<Bottomnull> createState() => _BottomnullState();
}

class _BottomnullState extends State<Bottomnull> {
  int selectedindex = 1;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = _auth.currentUser;
  }

  List<Widget> getWidgetPages(User? user) {
      
    return [
    non_cart(),
     HomeScreen(),
   
   
    ];
  }

  
  Future<bool> _onWillPop() async {
     final _media = MediaQuery.of(context);
    if (selectedindex != 1) {
      // If not on the home screen, go to the home screen
      setState(() {
        selectedindex = 1;
      });
      return false;
    } else {
      // If on the home screen, show a confirmation dialog
      return await AwesomeDialog(
    context: context,
    animType: AnimType.rightSlide,
    dialogType: DialogType.infoReverse,
    body: CustomMediaQuery(
      child: Container(
        height: _media.size.width*0.3,
        child: Column(
          children: [
          Center(
              child: Text(
                'هل تريد تسجيل الدخول في حرير  ؟',
                style: TextStyle(fontFamily: 'Cairo',fontSize: _media.size.width*0.045),
              ),
            ),
            SizedBox(height: _media.size.width*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
               Navigator.pop(context); // Close the current dialog
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
                  },
                  child: Text(
                    'نعم',
                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(hexToColor('#9C0945'),),
                  ),
                ),
                SizedBox(width: 25,), // Adjust spacing between buttons
                TextButton(
                  onPressed: () {Navigator.pop(context);},
                  child: Text(
                    'لا',
                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(hexToColor('#9C0945'),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
   // btnOkOnPress: () {
   //   Navigator.pushReplacementNamed(context, 'Signupscreen');
    //},
   // btnCancelOnPress: () {},
   //// btnOkColor: Colors.purpleAccent,
   // btnCancelColor: Colors.purpleAccent,
   // btnOkText: 'موافق',
   // btnCancelText: 'إلغاء',
   // buttonsTextStyle: TextStyle(fontFamily: 'Cairo'),
  ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
  var _media = MediaQuery.of(context);

    return WillPopScope(
       onWillPop: _onWillPop,
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: hexToColor('#9C0945'),
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
           height: _media.size.width*0.15,
          animationDuration: const Duration(milliseconds: 300),
          index: selectedindex,
          onTap: (index) {
            setState(() {
              selectedindex = index;
            });
          },
          items: [
            Icon(Icons.shopping_cart, size: _media.size.width*0.075),
            Icon(Icons.home_outlined, size: _media.size.width*0.075),
           
          ],
        ),
        body: getWidgetPages(currentUser)[selectedindex],
      ),
    );
  }
}

class CustomMediaQuery extends StatelessWidget {
  final Widget child;

  CustomMediaQuery({required this.child});

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    var customMediaQuery = _media.copyWith(textScaleFactor: 1.1);

    return MediaQuery(
      data: customMediaQuery,
      child: child,
    );
  }
}

