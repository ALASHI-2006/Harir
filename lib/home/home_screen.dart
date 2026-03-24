import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:harir/shalat/details.dart';
import 'package:harir/shalat/firstone.dart';
import 'package:harir/mkmlat/secondone.dart';
import 'package:harir/hijab/thirdone.dart';









class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
final user = FirebaseAuth.instance.currentUser!;
@override
Widget build(BuildContext context) {
 // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  var _media = MediaQuery.of(context);
  return WillPopScope(
    onWillPop: () async {
      SystemNavigator.pop();
      return true;
    },
    child: CustomMediaQuery(
      child: Container(
        color: hexToColor('#9C0945'),
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: _media.size.width * 0.02),
                  child: GlowText(
                    'حرير',
                   glowColor:hexToColor('#191919'),
                    style: TextStyle(
                      color: hexToColor('#ffffff'),
                      fontSize: _media.size.width * 0.15,
                      fontFamily: 'ReemKufi',
                    ),
                  ),
                ),
              ),
              SizedBox(height: _media.size.width * 0.05),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: _media.size.width * 2,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                    ),
                    ListView(
                      children: [
                        productcard(
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => firstone(press: () {}),
                              ),
                            );
                          },
                        ),
                        productcard2(
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => secondone(press: () {}),
                              ),
                            );
                          },
                        ),
                        productcard3(
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => therdone(press: () {}),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}




  //
  
  
   // 
 }

//











// ignore: camel_case_types
class productcard extends StatelessWidget {
  const productcard({
    super.key, required this.press, });

final VoidCallback press;


  @override
  Widget build(BuildContext context) {
         var _media = MediaQuery.of(context);
    return  GestureDetector(
      onTap: press,
      child: Padding(
        padding:EdgeInsets.only(top: _media.size.width*0.03),
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: _media.size.width *0.05,vertical: _media.size.width *0.03),
            height: _media.size.width *0.45,
            width: _media.size.width *0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Opacity(opacity: 0.5,
                  child: Image.asset('images/shalatnew.jpeg',fit: BoxFit.cover,width: _media.size.width *1,))),
                   Center(child: Text('الشالات ', style: TextStyle(fontFamily: 'Cairo',color: Colors.white,fontSize: _media.size.width *0.1),)),
              ],
            ),
          ),
      ),
    );
      
      
      
      
   



  }
}









    

// ignore: camel_case_types
class productcard2 extends StatelessWidget {
  const productcard2({
    super.key, required this.press, });

final VoidCallback press;

  @override
  Widget build(BuildContext context) {
         
     var _media = MediaQuery.of(context);
    return  GestureDetector(
      onTap: press,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: _media.size.width *0.05,vertical: _media.size.width *0.03),
          height: _media.size.width *0.45,
          width: _media.size.width *0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Opacity(opacity: 0.5,
                child: Image.asset('images/kmlatnew.jpg',fit: BoxFit.cover,width: _media.size.width *1,))),
                 Center(child: Text('مكملات الحجاب ', style: TextStyle(fontFamily: 'Cairo',color: Colors.white,fontSize: _media.size.width *0.1),)),
            ],
          ),
        ),
    );
  }
}



// ignore: camel_case_types
class productcard3 extends StatelessWidget {
  const productcard3({
    super.key, required this.press, });

final VoidCallback press;

  @override
  Widget build(BuildContext context) {
          var _media = MediaQuery.of(context);
    return  GestureDetector(
      onTap: press,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: _media.size.width *0.05,vertical: _media.size.width *0.03),
          height: _media.size.width *0.45,
          width: _media.size.width *0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Opacity(opacity: 0.5,
                child: Image.asset('images/hijab.jpg',fit: BoxFit.cover,width: _media.size.width *1,))),
                 Center(child: Text('الحجابات ', style: TextStyle(fontFamily: 'Cairo',color: Colors.white,fontSize: _media.size.width *0.1),)),
            ],
          ),
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
    var customMediaQuery = _media.copyWith(textScaleFactor: 1.0);

    return MediaQuery(
      data: customMediaQuery,
      child: child,
    );
  }
}