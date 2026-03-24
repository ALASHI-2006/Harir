import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:harir/other/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:harir/shalat/details.dart';

import 'cart.dart';
import '../home/home_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
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
      CartScreen(),
      HomeScreen(),
      if (user != null) EditProfileScreen(updateUserCallback: () {}),
    ];
  }

  @override
  Widget build(BuildContext context) {
      var _media = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        if (selectedindex != 1) {
          setState(() {
            selectedindex = 1; // Switch to the home screen
          });
          return false; // Prevent default behavior (pop screen)
        }
        return true; // Allow default behavior (pop screen)
      },
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor:hexToColor('#9C0945'),
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
          items:  [
            Icon(Icons.production_quantity_limits_outlined, size: _media.size.width*0.075),
            Icon(Icons.home_outlined, size: _media.size.width*0.075),
            Icon(Icons.person_outlined, size: _media.size.width*0.075),
          ],
        ),
        body: getWidgetPages(currentUser)[selectedindex],
      ),
    );
  }
}
