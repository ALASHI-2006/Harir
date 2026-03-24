
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:harir/home/stuck_out.dart';
import 'package:harir/mkmlat/slider.dart';
import 'package:harir/shalat/details.dart';

import '../shalat/product.dart';

class dotninja extends StatefulWidget {
  const dotninja({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotninjaState createState() => _dotninjaState();
}
class _dotninjaState extends State<dotninja> {
  Color selectedcolor = hexToColor('#f3f4f9');
  List<String> colorHistoryHex = [];

  @override
  void initState() {
    super.initState();
    fetchColorsFromFirestore();
  }
 
Future<void> fetchColorsFromFirestore() async {
  try {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('product')
        .doc('tPPgzwu70L9tom3sN1S9') // Use the appropriate document ID
        .get();

    if (documentSnapshot.exists) {
      List<dynamic>? colorHexStrings = documentSnapshot.get('color');

      if (colorHexStrings != null && colorHexStrings.isNotEmpty) {
        setState(() {
          colorHistoryHex = List<String>.from(colorHexStrings);
          selectedcolor = hexToColor(colorHistoryHex[Random().nextInt(colorHistoryHex.length)]);
            widget.product.updateSelectedColor(selectedcolor);
        });
      } else {
        // Show a Snackbar if colorHexStrings is null or empty
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No colors found in Firestore.'),
          ),
        );
        // Navigate to another page here
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => splash_screen()),
        );
      }
    } else {
      // Navigate to another page if document is not found
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => splash_screen()),
      );
    }
  } catch (e) {
    print("Error fetching colors from Firestore: $e");
    // Navigate to another page if an error occurs
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => splash_screen()),
    );
  }}
 


 // Widget getSelectedSlider() {
 //   if (selectedcolor == hexToColor('#000000')) {
 //     return newslidergorget1();
  //  } else if (selectedcolor == hexToColor('#FFFFFF')) {
  //    return newslidergorget2();
  //  } else {
      // Add more conditions as needed
  //    return Container(); // Return a default widget if no condition matches
  //  }
 // }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);

    return Column(//#964B00
      children: [
          if (selectedcolor == hexToColor('#f3f4f9')) 
         const   newsliderninja(),
         if (selectedcolor == hexToColor('#110000'))
         const newsliderninja1(),
        
        Padding(
             padding: EdgeInsets.only(top: _media.size.width*0.02),
          child: Container(
            height: _media.size.width * 0.11,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: colorHistoryHex.map((hexColor) {
                  Color color = hexToColor(hexColor);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedcolor = color;
                        widget.onColorChanged(color);
                      });
                    },
                    child: Container(margin: EdgeInsets.symmetric(horizontal: _media.size.width*0.002),
                      width: _media.size.width*0.12,
                      height: _media.size.width*0.12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey, // Grey background for all colors
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(margin: EdgeInsets.symmetric(horizontal: _media.size.width*0.004),
                            width: _media.size.width * 0.1,
                            height: _media.size.width * 0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: color,
                            ),
                          ),
                          if (selectedcolor == color)
                            Icon(
                              Icons.check,
                              color: color == hexToColor('#f3f4f9')
                                  ? Colors.black
                                  : hexToColor('#f3f4f9')
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
     //   getSelectedSlider(), // Display the selected slider based on conditions
      ],
    );
  }
}


class dothijab_tabake extends StatefulWidget {
  const dothijab_tabake({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dothijab_tabakeState createState() => _dothijab_tabakeState();
}
class _dothijab_tabakeState extends State<dothijab_tabake> {
  Color selectedcolor = hexToColor('#f2f2f2');
  List<String> colorHistoryHex = [];

  @override
  void initState() {
    super.initState();
    fetchColorsFromFirestore();
  }
 
Future<void> fetchColorsFromFirestore() async {
  try {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('product')
        .doc('Lrm5LcagmL03SNT0XlrZ') // Use the appropriate document ID
        .get();

    if (documentSnapshot.exists) {
      List<dynamic>? colorHexStrings = documentSnapshot.get('color');

      if (colorHexStrings != null && colorHexStrings.isNotEmpty) {
        setState(() {
          colorHistoryHex = List<String>.from(colorHexStrings);
          selectedcolor = hexToColor(colorHistoryHex[Random().nextInt(colorHistoryHex.length)]);
            widget.product.updateSelectedColor(selectedcolor);
        });
      } else {
        // Show a Snackbar if colorHexStrings is null or empty
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No colors found in Firestore.'),
          ),
        );
        // Navigate to another page here
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => splash_screen()),
        );
      }
    } else {
      // Navigate to another page if document is not found
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => splash_screen()),
      );
    }
  } catch (e) {
    print("Error fetching colors from Firestore: $e");
    // Navigate to another page if an error occurs
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => splash_screen()),
    );
  }}
 


 // Widget getSelectedSlider() {
 //   if (selectedcolor == hexToColor('#000000')) {
 //     return newslidergorget1();
  //  } else if (selectedcolor == hexToColor('#FFFFFF')) {
  //    return newslidergorget2();
  //  } else {
      // Add more conditions as needed
  //    return Container(); // Return a default widget if no condition matches
  //  }
 // }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);

    return Column(//#964B00
      children: [
          if (selectedcolor == hexToColor('#001001')) 
         const newsliderhijab_tabake(),

         if (selectedcolor == hexToColor('#595c74'))
         const newsliderhijab_tabake1(),

           if (selectedcolor == hexToColor('#1b1f4d'))
         const newsliderhijab_tabake2(),

         if (selectedcolor == hexToColor('#f2f2f2'))
         const newsliderhijab_tabake3(),
        
        Padding(
             padding: EdgeInsets.only(top: _media.size.width*0.02),
          child: Container(
            height: _media.size.width * 0.11,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: colorHistoryHex.map((hexColor) {
                  Color color = hexToColor(hexColor);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedcolor = color;
                        widget.onColorChanged(color);
                      });
                    },
                    child: Container(margin: EdgeInsets.symmetric(horizontal: _media.size.width*0.002),
                      width: _media.size.width*0.12,
                      height: _media.size.width*0.12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey, // Grey background for all colors
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(margin: EdgeInsets.symmetric(horizontal: _media.size.width*0.004),
                            width: _media.size.width * 0.1,
                            height: _media.size.width * 0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: color,
                            ),
                          ),
                          if (selectedcolor == color)
                            Icon(
                              Icons.check,
                              color: color == hexToColor('#f2f2f2')
                                  ? Colors.black
                                  : hexToColor('#f2f2f2')
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
     //   getSelectedSlider(), // Display the selected slider based on conditions
      ],
    );
  }
}

