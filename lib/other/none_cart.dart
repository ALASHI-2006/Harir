import 'package:flutter/material.dart';
import 'package:harir/shalat/details.dart';

class non_cart extends StatefulWidget {
  const non_cart({super.key});

  @override
  State<non_cart> createState() => _non_cartState();
}

class _non_cartState extends State<non_cart> {
  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return Scaffold(backgroundColor: hexToColor('#9C0945'),
      body:
     SafeArea(child:  SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                      padding: EdgeInsets.only(
                         top: _media.size.width *0.09, ),
                      child: Center(
                        child: Text(
                          'السلة ',
                          style: TextStyle(
                             color: hexToColor('#ffffff'),
                            fontSize: _media.size.width * 0.09,
                            fontFamily: 'ReemKufi',
                          ),
                        ),
                      ),
                    ),
                      Container( decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25)),
                      ),
                   margin: EdgeInsets.only(top: _media.size.width*0.25),
                      width: _media.size.width*1,
                      
                        child: 
                        Container(height: _media.size.width*1.78,
                            child: Center(
                                child: CustomMediaQuery(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.remove_shopping_cart,
                                          size: _media.size.width *0.4,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          'عربة التسوق فارغة',
                                          style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: _media.size.width *0.07,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ))])])),),);
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