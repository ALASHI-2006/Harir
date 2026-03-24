
import 'package:flutter/material.dart';
import 'package:harir/shalat/details.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(bottom: _media.size.width*0.3,top: _media.size.width*0.3),
            child:   Text('متجر حرير ',
                       style: TextStyle(
                       fontFamily: 'ReemKufi',
                       fontSize: _media.size.width * 0.2,
                      fontWeight: FontWeight.bold,
                                   color: hexToColor('#9C0945'),
                                 ),
                                ),
          ),
          Icon(Icons.production_quantity_limits,size: _media.size.width*0.2,),
          Container(margin: EdgeInsets.symmetric(horizontal: _media.size.width*.05),
            child: Text('للأسف هذا المنتج لم يعد متوفر سنعمل على توفيره في اسرع وقت ',style: TextStyle(
             fontFamily: 'cairo',fontSize: _media.size.width*0.08
            ),)
          ),
        ],
      )),
    );
  }
}



class splash_screen1 extends StatefulWidget {
  const splash_screen1({super.key});

  @override
  State<splash_screen1> createState() => _splash_screen1State();
}

class _splash_screen1State extends State<splash_screen1> {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(bottom: _media.size.width*0.2,top: _media.size.width*0.3),
            child:   Text('متجر حرير ',
                       style: TextStyle(
                       fontFamily: 'ReemKufi',
                       fontSize: _media.size.width * 0.2,
                      fontWeight: FontWeight.bold,
                                   color: hexToColor('#9C0945'),
                                 ),
                                ),
          ),
          Icon(Icons.error,size: _media.size.width*0.2,),
          SizedBox(height: _media.size.width*0.1,),
          Container(margin: EdgeInsets.symmetric(horizontal: _media.size.width*.05),
            child: Text('يوجد تحديث للتطبيق يرجى الذهاب للمتجر و تحديث التطبيق ',
            style: TextStyle(
             fontFamily: 'cairo',fontSize: _media.size.width*0.08,
            ),)
          ),
        ],
      )),
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