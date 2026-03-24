
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:harir/home/stuck_out.dart';
import 'package:harir/mkmlat/slider.dart';
import 'package:harir/shalat/details.dart';
import 'package:harir/shalat/product.dart';

class dottnora extends StatefulWidget {
  const dottnora({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dottnoraState createState() => _dottnoraState();
}
class _dottnoraState extends State<dottnora> {
  Color selectedcolor = hexToColor('#fffeff');
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
        .doc('52fgPYm3QLUutBcy8E1F') // Use the appropriate document ID
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
          if (selectedcolor == hexToColor('#fffeff')) 
         const   newslidertnora(),
         if (selectedcolor == hexToColor('#000110'))
         const newslidertnora1(),
        
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
                              color: color == hexToColor('#fffeff')
                                  ? Colors.black
                                  : hexToColor('#fffeff')
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

/////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class dotkapa_kamis extends StatefulWidget {
  const dotkapa_kamis({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotkapa_kamisState createState() => _dotkapa_kamisState();
}
class _dotkapa_kamisState extends State<dotkapa_kamis> {
  Color selectedcolor = hexToColor('#f9f8f6');
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
        .doc('CVZ1OMEntvY4shr21cMI') // Use the appropriate document ID
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
          if (selectedcolor == hexToColor('#f9f8f6')) 
         const   newsliderkapa_kamis(),
         if (selectedcolor == hexToColor('#011000'))
         const newsliderkapa_kamis1(),
        
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
                              color: color == hexToColor('#f9f8f6')
                                  ? Colors.black
                                  : hexToColor('#f9f8f6')
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

/////////////////////////////////////////////////////////////////////////////////////
class dotkapa_hinec extends StatefulWidget {
  const dotkapa_hinec({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotkapa_hinecState createState() => _dotkapa_hinecState();
}
class _dotkapa_hinecState extends State<dotkapa_hinec> {
  Color selectedcolor = hexToColor('#fffffe');
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
        .doc('0W60bGDdSNWGEyQRdDtg') // Use the appropriate document ID
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
          if (selectedcolor == hexToColor('#fffffe')) 
         const   newsliderkapa_hinec(),
         if (selectedcolor == hexToColor('#000001'))
         const newsliderkapa_hinec1(),
        
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
                              color: color == hexToColor('#fffffe')
                                  ? Colors.black
                                  : hexToColor('#fffffe')
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



///////////////////////////////////////////////////////////////////////////////////////


class dotmo3sam extends StatefulWidget {
  const dotmo3sam({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotmo3samState createState() => _dotmo3samState();
}
class _dotmo3samState extends State<dotmo3sam> {
  Color selectedcolor = hexToColor('#f5f6ff');
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
        .doc('ms9jKqdLCxNPgN2FE58y') // Use the appropriate document ID
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
          if (selectedcolor == hexToColor('#f5f6ff')) 
         const   newslidermo3sam(),
         if (selectedcolor == hexToColor('#100001'))
         const newslidermo3sam1(),
        
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
                              color: color == hexToColor('#f5f6ff')
                                  ? Colors.black
                                  : hexToColor('#f5f6ff')
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

///////////////////////////////////////////////////////////////////////////////////////


class dotmo3sam_zm extends StatefulWidget {
  const dotmo3sam_zm({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotmo3sam_zmState createState() => _dotmo3sam_zmState();
}
class _dotmo3sam_zmState extends State<dotmo3sam_zm> {
  Color selectedcolor = hexToColor('#f3f3fb');
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
        .doc('ckEYr9T9brGLiRkahUbk') // Use the appropriate document ID
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
          if (selectedcolor == hexToColor('#f3f3fb')) 
         const   newslidermo3sam_zm(),
         if (selectedcolor == hexToColor('#010010'))
         const newslidermo3sam_zm1(),
        
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
                              color: color == hexToColor('#f3f3fb')
                                  ? Colors.black
                                  : hexToColor('#f3f3fb')
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