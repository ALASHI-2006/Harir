
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:harir/home/stuck_out.dart';

import 'package:harir/shalat/product.dart';

import 'package:harir/shalat/slider.dart';



Color hexToColor1(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

// ignore: must_be_immutable
class dotshifon extends StatefulWidget {
   dotshifon({
    Key? key,
    required this.onColorChanged,
    required this.product,
  
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;



  @override
  _dotshifonState createState() => _dotshifonState();
}
class _dotshifonState extends State<dotshifon> {
   Color selectedcolor = hexToColor('#ab9683');
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
          .doc('qPYCPl71fXDRkxJddBke') // Use the appropriate document ID
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
  }
  }

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
         if (selectedcolor == hexToColor('#628574')) 
         const   newslidershifon(),
         if (selectedcolor == hexToColor('#986081'))
         const newslidershifon1(),
         if (selectedcolor == hexToColor('#657bad'))
         const newslidershifon2(),
         if (selectedcolor == hexToColor('#2b142f'))
         const newslidershifon3(),
         if (selectedcolor == hexToColor('#5c4671'))
         const newslidershifon4(),
         if (selectedcolor == hexToColor('#bc9093'))
         const newslidershifon5(),
         if (selectedcolor == hexToColor('#827565'))
         const newslidershifon6(),
         if (selectedcolor == hexToColor('#7d5d64'))
         const newslidershifon7(),
         if (selectedcolor == hexToColor('#2f3a23'))
         const newslidershifon8(),
         if (selectedcolor == hexToColor('#3a394a'))
         const newslidershifon9(),
         if (selectedcolor == hexToColor('#ab9683'))
         const newslidershifon10(),
         if (selectedcolor == hexToColor('#5d3a2c'))
         const newslidershifon11(),
         if (selectedcolor == hexToColor('#4b5750'))
         const newslidershifon12(),
         if (selectedcolor == hexToColor('#947e93'))
         const newslidershifon13(),
         if (selectedcolor == hexToColor('#161d31'))
         const newslidershifon14(),
         if (selectedcolor == hexToColor('#32142b'))
         const newslidershifon15(),
         if (selectedcolor == hexToColor('#967071'))
         const newslidershifon16(),
         if (selectedcolor == hexToColor('#050505'))
         const newslidershifon17(),
         if (selectedcolor == hexToColor('#cdc4b9'))
         const newslidershifon18(),
         if (selectedcolor == hexToColor('#f0effe'))
         const newslidershifon19(),
         if (selectedcolor == hexToColor('#746478'))
         const newslidershifon20(),
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
                              color: color == hexToColor('#f0effe')
                                  ? Colors.black
                                  : hexToColor('#f0effe')
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




Color hexToColor(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotgorget extends StatefulWidget {


  const dotgorget({
    Key? key,
    required this.onColorChanged,
    required this.product,
  
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;
 
  @override
  _dotgorgetState createState() => _dotgorgetState();
}
class _dotgorgetState extends State<dotgorget> {
  Color selectedcolor = hexToColor('#000000');
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
          .doc('rMVSG1IBPFQtSlS6fePI') // Use the appropriate document ID
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
  }
  }

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
         if (selectedcolor == hexToColor('#654321')) 
         const   newslidergorget(),
         if (selectedcolor == hexToColor('#121121'))
         const newslidergorget1(),
         if (selectedcolor == hexToColor('#302011'))
         const newslidergorget2(),
         if (selectedcolor == hexToColor('#C08FA4'))
         const newslidergorget3(),
         if (selectedcolor == hexToColor('#808080'))
         const newslidergorget4(),
         if (selectedcolor == hexToColor('#303139'))
         const newslidergorget5(),
         if (selectedcolor == hexToColor('#61152B'))
         const newslidergorget6(),
         if (selectedcolor == hexToColor('#002D27'))
         const newslidergorget7(),
         if (selectedcolor == hexToColor('#AD885A'))
         const newslidergorget8(),
         if (selectedcolor == hexToColor('#39506C'))
         const newslidergorget9(),
         if (selectedcolor == hexToColor('#584232'))
         const newslidergorget10(),
         if (selectedcolor == hexToColor('#182013'))
         const newslidergorget11(),
         if (selectedcolor == hexToColor('#747B5D'))
         const newslidergorget12(),
         if (selectedcolor == hexToColor('#1D1B4E'))
         const newslidergorget13(),
         if (selectedcolor == hexToColor('#4F333F'))
         const newslidergorget14(),
         if (selectedcolor == hexToColor('#322517'))
         const newslidergorget15(),
         if (selectedcolor == hexToColor('#75585A'))
         const newslidergorget16(),
         if (selectedcolor == hexToColor('#B78C6E'))
         const newslidergorget17(),
         if (selectedcolor == hexToColor('#31121B'))
         const newslidergorget18(),
         if (selectedcolor == hexToColor('#000000')) 
         const newslidergorget19(),
         if (selectedcolor == hexToColor('#FFFFFF'))
         const newslidergorget20(),
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
                              color: color == hexToColor('#FFFFFF')
                                  ? Colors.black
                                  : hexToColor('#FFFFFF')
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

  
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

     Color hexToColor2(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotcotenkwait extends StatefulWidget {
  const dotcotenkwait({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotcotenkwaitState createState() => _dotcotenkwaitState();
}
class _dotcotenkwaitState extends State<dotcotenkwait> {
  Color selectedcolor = hexToColor('#afa795');
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
          .doc('1RyrfdWPCEGgqOxXj9VC') // Use the appropriate document ID
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
  }
  }

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
         if (selectedcolor == hexToColor('#afa795')) 
         const   newslidercotenkwait(),
         if (selectedcolor == hexToColor('#8f8583'))
         const newslidercotenkwait1(),
         if (selectedcolor == hexToColor('#b0b0ae'))
         const newslidercotenkwait2(),
         if (selectedcolor == hexToColor('#9a867b'))
         const newslidercotenkwait3(),
         if (selectedcolor == hexToColor('#918a80'))
         const newslidercotenkwait4(),
         if (selectedcolor == hexToColor('#0f1014'))
         const newslidercotenkwait5(),
         if (selectedcolor == hexToColor('#f2f3f8'))
         const newslidercotenkwait6(),
         if (selectedcolor == hexToColor('#65605a'))
         const newslidercotenkwait7(),
         if (selectedcolor == hexToColor('#867267'))
         const newslidercotenkwait8(),
         if (selectedcolor == hexToColor('#6d524b'))
         const newslidercotenkwait9(),
        
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
                              color: color == hexToColor('#f2f3f8')
                                  ? Colors.black
                                  : hexToColor('#f2f3f8')
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
                 


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
                        
     Color hexToColor3(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotglutter extends StatefulWidget {
  const dotglutter({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotglutterState createState() => _dotglutterState();
}
class _dotglutterState extends State<dotglutter> {
  Color selectedcolor = hexToColor('#020202');
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
          .doc('HEAYSbj2RclhugszxViY') // Use the appropriate document ID
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
  }
  }

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
         if (selectedcolor == hexToColor('#887a58')) 
         const   newsliderglutter(),
         if (selectedcolor == hexToColor('#94806c'))
         const newsliderglutter1(),
         if (selectedcolor == hexToColor('#020202'))
         const newsliderglutter2(),
         if (selectedcolor == hexToColor('#5c4e4a'))
         const newsliderglutter3(),
         if (selectedcolor == hexToColor('#8b6c64'))
         const newsliderglutter4(),
         if (selectedcolor == hexToColor('#ececec'))
         const newsliderglutter5(),
         
        
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
                              color: color == hexToColor('#ececec')
                                  ? Colors.black
                                  : hexToColor('#ececec')
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


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


     Color hexToColor4(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotcottonliner extends StatefulWidget {
  const dotcottonliner({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotcottonlinerState createState() => _dotcottonlinerState();
}
class _dotcottonlinerState extends State<dotcottonliner> {
  Color selectedcolor = hexToColor('#80576c');
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
          .doc('hvCXnzlJoeIynsbiagUg') // Use the appropriate document ID
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
  }
  }

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
         if (selectedcolor == hexToColor('#b4ab9a')) 
         const   newslidercottonliner(),
         if (selectedcolor == hexToColor('#7e7a70'))
         const newslidercottonliner1(),
         if (selectedcolor == hexToColor('#574636'))
         const newslidercottonliner2(),
         if (selectedcolor == hexToColor('#896c58'))
         const newslidercottonliner3(),
         if (selectedcolor == hexToColor('#886d67'))
         const newslidercottonliner4(),
         if (selectedcolor == hexToColor('#80576c'))
         const newslidercottonliner5(),
         if(selectedcolor == hexToColor('#fffffc'))
          const newslidercottonliner6(),
          if(selectedcolor== hexToColor('#7d867e'))
          const newslidercottonliner7(),
          if(selectedcolor == hexToColor('#50545d'))
          const newslidercottonliner8(),
          if(selectedcolor == hexToColor('#a27676'))
          const newslidercottonliner9(),         
        
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
                              color: color == hexToColor('#fffffc')
                                  ? Colors.black
                                  : hexToColor('#fffffc')
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


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
    Color hexToColor5(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotstras extends StatefulWidget {
  const dotstras({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotstrasState createState() => _dotstrasState();
}
class _dotstrasState extends State<dotstras> {
  Color selectedcolor = hexToColor('#ac8b7f');
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
          .doc('sHY4whb6hSVqRyCFpUOm') // Use the appropriate document ID
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
  }
  }

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
         if (selectedcolor == hexToColor('#a48594')) 
         const   newsliderstras(),
         if (selectedcolor == hexToColor('#ac8b7f'))
         const newsliderstras1(),
         if (selectedcolor == hexToColor('#b59f88'))
         const newsliderstras2(),
         if (selectedcolor == hexToColor('#9c8084'))
         const newsliderstras3(),
         if (selectedcolor == hexToColor('#878da0'))
         const newsliderstras4(),
         if (selectedcolor == hexToColor('#fff9f2'))
         const newsliderstras5(),
         if(selectedcolor == hexToColor('#6a6b68'))
          const newsliderstras6(),
          if(selectedcolor== hexToColor('#7b7461'))
          const newsliderstras7(),
       
        
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
                              color: color == hexToColor('#fff9f2')
                                  ? Colors.black
                                  : hexToColor('#fff9f2')
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
   Color hexToColor6(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotDOUBLE_STRICH extends StatefulWidget {
  const dotDOUBLE_STRICH({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotDOUBLE_STRICHState createState() => _dotDOUBLE_STRICHState();
}
class _dotDOUBLE_STRICHState extends State<dotDOUBLE_STRICH> {
  Color selectedcolor = hexToColor('#fefffc');
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
          .doc('hhxKynBLVbn6SxrTbogK') // Use the appropriate document ID
          .get();

     if (documentSnapshot.exists) {
      List<dynamic>? colorHexStrings = documentSnapshot.get('color');

      if (colorHexStrings != null && colorHexStrings.isNotEmpty) {
        setState(() {
          colorHistoryHex = List<String>.from(colorHexStrings);
          selectedcolor = hexToColor(colorHistoryHex[Random().nextInt(colorHistoryHex.length)]);  widget.product.updateSelectedColor(selectedcolor);
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
  }
  }

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
         if (selectedcolor == hexToColor('#5d5946')) 
         const   newsliderDOUBLE_STRICH(),
         if (selectedcolor == hexToColor('#360f21'))
         const newsliderDOUBLE_STRICH1(),
         if (selectedcolor == hexToColor('#674765'))
         const newsliderDOUBLE_STRICH2(),
         if (selectedcolor == hexToColor('#fefffc'))
         const newsliderDOUBLE_STRICH3(),
         if (selectedcolor == hexToColor('#6f777e'))
         const newsliderDOUBLE_STRICH4(),
        
       
        
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
                              color: color == hexToColor('#fefffc')
                                  ? Colors.black
                                  : hexToColor('#fefffc')
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


/////////////////////////////////////////////////////////////////////////////////////////////////////////
 


    Color hexToColor7(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotsatan extends StatefulWidget {
  const dotsatan({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotsatanState createState() => _dotsatanState();
}
class _dotsatanState extends State<dotsatan> {
  Color selectedcolor = hexToColor('#575d60');
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
        .doc('qCVHUU6o2yB2IEiTmvOL') // Use the appropriate document ID
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
         if (selectedcolor == hexToColor('#7e828c')) 
         const   newslidersatan(),
         if (selectedcolor == hexToColor('#9d866e'))
         const newslidersatan1(),
         if (selectedcolor == hexToColor('#575d60'))
         const newslidersatan2(),
      
       
        
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
                              color: color == hexToColor('#fff9f2')
                                  ? Colors.black
                                  : hexToColor('#fff9f2')
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

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Color hexToColor8(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotswarih extends StatefulWidget {
  const dotswarih({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotswarihState createState() => _dotswarihState();
}
class _dotswarihState extends State<dotswarih> {
  Color selectedcolor = hexToColor('#fff5f0');
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
          .doc('yMIjrdtVRrIVZFNpCmp0') // Use the appropriate document ID
          .get();

      if (documentSnapshot.exists) {
        List<dynamic>? colorHexStrings = documentSnapshot.get('color');

        if (colorHexStrings != null && colorHexStrings.isNotEmpty) {
          setState(() {
            colorHistoryHex = List<String>.from(colorHexStrings);
             selectedcolor = hexToColor(colorHistoryHex[Random().nextInt(colorHistoryHex.length)]);
               widget.product.updateSelectedColor(selectedcolor);
          });
        }
      }
    } catch (e) {
      print("Error fetching colors from Firestore: $e");
    }
  }

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
         if (selectedcolor == hexToColor('#010101')) 
         const   newsliderswarih(),
         if (selectedcolor == hexToColor('#fff5f0'))
         const newsliderswarih1(),
         if (selectedcolor == hexToColor('#ad9586'))
         const newsliderswarih2(),
      
       
        
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
                              color: color == hexToColor('#fff5f0')
                                  ? Colors.black
                                  : hexToColor('#fff5f0')
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



////////////////////////////////////////////////////////////////////////////



Color hexToColor9(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotshifon_motraz extends StatefulWidget {
  const dotshifon_motraz ({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotshifon_motrazState createState() => _dotshifon_motrazState();
}
class _dotshifon_motrazState extends State<dotshifon_motraz > {
  Color selectedcolor = hexToColor('#855668');
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
          .doc('FzyKZWHWBa6AMgh95ol7') // Use the appropriate document ID
          .get();

      if (documentSnapshot.exists) {
        List<dynamic>? colorHexStrings = documentSnapshot.get('color');

        if (colorHexStrings != null && colorHexStrings.isNotEmpty) {
          setState(() {
            colorHistoryHex = List<String>.from(colorHexStrings);
             selectedcolor = hexToColor(colorHistoryHex[Random().nextInt(colorHistoryHex.length)]);
               widget.product.updateSelectedColor(selectedcolor);
          });
        }
      }
    } catch (e) {
      print("Error fetching colors from Firestore: $e");
    }
  }

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
         if (selectedcolor == hexToColor('#fff7fb')) 
         const   newslidershifon_motraz(),
         if (selectedcolor == hexToColor('#b29781'))
         const newslidershifon_motraz1(),
         if (selectedcolor == hexToColor('#855668'))
         const newslidershifon_motraz2(),
        if(selectedcolor == hexToColor('#020202'))
         const newslidershifon_motraz3(),
        
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
                              color: color == hexToColor('#fff7fb')
                                  ? Colors.black
                                  : hexToColor('#fff7fb')
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


////////////////////////////////////////////////////////////////////////////////////////


Color hexToColor10(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotkashmir extends StatefulWidget {
  const dotkashmir ({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotkashmirState createState() => _dotkashmirState();
}
class _dotkashmirState extends State<dotkashmir > {
  Color selectedcolor = hexToColor('#9f8872');
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
          .doc('6rR9tE38sM5gTZFlpsZT') // Use the appropriate document ID
          .get();

      if (documentSnapshot.exists) {
        List<dynamic>? colorHexStrings = documentSnapshot.get('color');

        if (colorHexStrings != null && colorHexStrings.isNotEmpty) {
          setState(() {
            colorHistoryHex = List<String>.from(colorHexStrings);
             selectedcolor = hexToColor(colorHistoryHex[Random().nextInt(colorHistoryHex.length)]);
               widget.product.updateSelectedColor(selectedcolor);
          });
        }
      }
    } catch (e) {
      print("Error fetching colors from Firestore: $e");
    }
  }

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
         if (selectedcolor == hexToColor('#9f8872')) 
         const   newsliderkashmir(),
         if (selectedcolor == hexToColor('#81603e'))
         const newsliderkashmir1(),
         if (selectedcolor == hexToColor('#b29374'))
         const newsliderkashmir2(),
        if(selectedcolor == hexToColor('#6a6b71'))
         const newsliderkashmir3(),
        
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
                              color: color == hexToColor('#fff9f2')
                                  ? Colors.black
                                  : hexToColor('#fff9f2')
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

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Color hexToColor11(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotlikramojaker extends StatefulWidget {
  const dotlikramojaker ({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotlikramojakerState createState() => _dotlikramojakerState();
}
class _dotlikramojakerState extends State<dotlikramojaker > {
  Color selectedcolor = hexToColor('#000100');
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
          .doc('j1mz0Y8T8156WHxjmCWo') // Use the appropriate document ID
          .get();

      if (documentSnapshot.exists) {
        List<dynamic>? colorHexStrings = documentSnapshot.get('color');

        if (colorHexStrings != null && colorHexStrings.isNotEmpty) {
          setState(() {
            colorHistoryHex = List<String>.from(colorHexStrings);
             selectedcolor = hexToColor(colorHistoryHex[Random().nextInt(colorHistoryHex.length)]);
               widget.product.updateSelectedColor(selectedcolor);
          });
        }
      }
    } catch (e) {
      print("Error fetching colors from Firestore: $e");
    }
  }

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
         if (selectedcolor == hexToColor('#9b7881')) 
         const   newsliderlikra_mojaker(),
         if (selectedcolor == hexToColor('#b2aa9d'))
         const newsliderlikra_mojaker1(),
         if (selectedcolor == hexToColor('#fcfbff'))
         const newsliderlikra_mojaker2(),
        if(selectedcolor == hexToColor('#6f6559'))
         const newsliderlikra_mojaker3(),
          if (selectedcolor == hexToColor('#90867a')) 
         const   newsliderlikra_mojaker4(),
         if (selectedcolor == hexToColor('#62614d'))
         const newsliderlikra_mojaker5(),
         if (selectedcolor == hexToColor('#000100'))
         const newsliderlikra_mojaker6(),
        if(selectedcolor == hexToColor('#64564d'))
         const newsliderlikra_mojaker7(),
         if (selectedcolor == hexToColor('#795c4c')) 
         const   newsliderlikra_mojaker8(),
         if (selectedcolor == hexToColor('#71706e'))
         const newsliderlikra_mojaker9(),
         if (selectedcolor == hexToColor('#755b61'))
         const newsliderlikra_mojaker10(),
        
        
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
                              color: color == hexToColor('#fcfbff')
                                  ? Colors.black
                                  : hexToColor('#fcfbff')
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

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



Color hexToColor12(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotgorgetsatan extends StatefulWidget {
  const dotgorgetsatan ({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotgorgetsatanState createState() => _dotgorgetsatanState();
}
class _dotgorgetsatanState extends State<dotgorgetsatan> {
  Color selectedcolor = hexToColor('#001000');
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
          .doc('cG0y6KfUCNIWceS8rhBB') // Use the appropriate document ID
          .get();

      if (documentSnapshot.exists) {
        List<dynamic>? colorHexStrings = documentSnapshot.get('color');

        if (colorHexStrings != null && colorHexStrings.isNotEmpty) {
          setState(() {
            colorHistoryHex = List<String>.from(colorHexStrings);
             selectedcolor = hexToColor(colorHistoryHex[Random().nextInt(colorHistoryHex.length)]);

               widget.product.updateSelectedColor(selectedcolor);
          });
        }
      }
    } catch (e) {
      print("Error fetching colors from Firestore: $e");
    }
  }

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
         if (selectedcolor == hexToColor('#001000')) 
         const   newslidergorgetsatan(),
         if (selectedcolor == hexToColor('#a29584'))
          const   newslidergorgetsatan1(),
         if (selectedcolor == hexToColor('#997370'))
          const   newslidergorgetsatan2(),
        if(selectedcolor == hexToColor('#424856'))
          const   newslidergorgetsatan3(),
          if (selectedcolor == hexToColor('#45493b')) 
         const   newslidergorgetsatan4(),
         if (selectedcolor == hexToColor('#625857'))
         const   newslidergorgetsatan5(),
         if (selectedcolor == hexToColor('#634940'))
          const   newslidergorgetsatan6(),
        if(selectedcolor == hexToColor('#3b3328'))
         const   newslidergorgetsatan7(),
         if (selectedcolor == hexToColor('#fcfff8')) 
         const   newslidergorgetsatan8(),
         if (selectedcolor == hexToColor('#221411'))
          const   newslidergorgetsatan9(),
         if (selectedcolor == hexToColor('#65332c'))
         const   newslidergorgetsatan10(),
        
        
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
                              color: color == hexToColor('#fcfff8')
                                  ? Colors.black
                                  : hexToColor('#fcfff8')
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


////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Color hexToColor13(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotlonen extends StatefulWidget {
  const dotlonen ({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotlonenState createState() => _dotlonenState();
}
class _dotlonenState extends State<dotlonen> {
  Color selectedcolor = hexToColor('#000010');
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
          .doc('m17ojb1Jmp992e2d9Dde') // Use the appropriate document ID
          .get();

      if (documentSnapshot.exists) {
        List<dynamic>? colorHexStrings = documentSnapshot.get('color');

        if (colorHexStrings != null && colorHexStrings.isNotEmpty) {
          setState(() {
            colorHistoryHex = List<String>.from(colorHexStrings);
             selectedcolor = hexToColor(colorHistoryHex[Random().nextInt(colorHistoryHex.length)]);
               widget.product.updateSelectedColor(selectedcolor);
          });
        }
      }
    } catch (e) {
      print("Error fetching colors from Firestore: $e");
    }
  }

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
         if (selectedcolor == hexToColor('#000010')) 
         const   newsliderlonen(),
         if (selectedcolor == hexToColor('#7e8492'))
          const   newsliderlonen1(),
         if (selectedcolor == hexToColor('#72563e'))
          const   newsliderlonen2(),
        if(selectedcolor == hexToColor('#536d6e'))
          const   newsliderlonen3(),
          if (selectedcolor == hexToColor('#131734')) 
         const   newsliderlonen4(),
         if (selectedcolor == hexToColor('#474217'))
         const   newsliderlonen5(),
         if (selectedcolor == hexToColor('#7a6f5d'))
          const   newsliderlonen6(),
        if(selectedcolor == hexToColor('#787f5e'))
         const   newsliderlonen7(),
         if (selectedcolor == hexToColor('#3b1220')) 
         const   newsliderlonen8(),
         if (selectedcolor == hexToColor('#852f52'))
          const   newsliderlonen9(),
         if (selectedcolor == hexToColor('#23227f'))
         const   newsliderlonen10(),
        
        
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
                              color: color == hexToColor('#fcfbff')
                                  ? Colors.black
                                  : hexToColor('#fcfbff')
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



////////////////////////////////////////////////////////////////////////////////////////////////////////



Color hexToColor14(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotcottonmoskar extends StatefulWidget {
  const dotcottonmoskar ({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotcottonmoskarState createState() => _dotcottonmoskarState();
}
class _dotcottonmoskarState extends State<dotcottonmoskar> {
  Color selectedcolor = hexToColor('#010000');
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
          .doc('sxu5b729BwoMbWTV5zoo') // Use the appropriate document ID
          .get();

      if (documentSnapshot.exists) {
        List<dynamic>? colorHexStrings = documentSnapshot.get('color');

        if (colorHexStrings != null && colorHexStrings.isNotEmpty) {
          setState(() {
            colorHistoryHex = List<String>.from(colorHexStrings);
             selectedcolor = hexToColor(colorHistoryHex[Random().nextInt(colorHistoryHex.length)]);
               widget.product.updateSelectedColor(selectedcolor);
          });
        }
      }
    } catch (e) {
      print("Error fetching colors from Firestore: $e");
    }
  }

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
         if (selectedcolor == hexToColor('#a1a1ac')) 
         const   newslidercottomskar1(),
         if (selectedcolor == hexToColor('#968773'))
          const   newslidercottomskar2(),
         if (selectedcolor == hexToColor('#b3959a'))
          const   newslidercottomskar3(),
        if(selectedcolor == hexToColor('#4c5c89'))
          const   newslidercottomskar4(),
          if (selectedcolor == hexToColor('#7c5667')) 
         const   newslidercottomskar5(),
         if (selectedcolor == hexToColor('#010000'))
         const   newslidercottomskar6(),
         if (selectedcolor == hexToColor('#fcf4ff'))
          const   newslidercottomskar7(),
       
        
        
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
                              color: color == hexToColor('#fcf4ff')
                                  ? Colors.black
                                  : hexToColor('#fcf4ff')
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




Color hexToColor15(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotlikra_mksar extends StatefulWidget {
  const dotlikra_mksar ({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotlikra_mksarState createState() => _dotlikra_mksarState();
}
class _dotlikra_mksarState extends State<dotlikra_mksar> {
  Color selectedcolor = hexToColor('#100000');
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
          .doc('CA4BfkXRMRv66sBYAGW2') // Use the appropriate document ID
          .get();

      if (documentSnapshot.exists) {
        List<dynamic>? colorHexStrings = documentSnapshot.get('color');

        if (colorHexStrings != null && colorHexStrings.isNotEmpty) {
          setState(() {
            colorHistoryHex = List<String>.from(colorHexStrings);
             selectedcolor = hexToColor(colorHistoryHex[Random().nextInt(colorHistoryHex.length)]);
               widget.product.updateSelectedColor(selectedcolor);
          });
        }
      }
    } catch (e) {
      print("Error fetching colors from Firestore: $e");
    }
  }

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
         if (selectedcolor == hexToColor('#f2f2fa')) 
         const   newsliderlikra_mksar(),

         if (selectedcolor == hexToColor('#907868'))
          const   newsliderlikra_mksar1(),

         if (selectedcolor == hexToColor('#6a6e7e'))
          const   newsliderlikra_mksar2(),

        if(selectedcolor == hexToColor('#8e746e'))
          const    newsliderlikra_mksar3(),

          if (selectedcolor == hexToColor('#755d59')) 
         const    newsliderlikra_mksar4(),

         if (selectedcolor == hexToColor('#694452'))
         const    newsliderlikra_mksar5(),

         if (selectedcolor == hexToColor('#9b9887'))
          const    newsliderlikra_mksar6(),

         if (selectedcolor == hexToColor('#100000'))
          const    newsliderlikra_mksar7(),

     if (selectedcolor == hexToColor('#6f6865'))
          const    newsliderlikra_mksar8(),
        
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
                              color: color == hexToColor('#f2f2fa')
                                  ? Colors.black
                                  : hexToColor('#f2f2fa')
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////


Color hexToColor16(String hexColor) {
  return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
}

class dotlyorah_glutter extends StatefulWidget {
  const dotlyorah_glutter ({
    Key? key,
    required this.onColorChanged,
    required this.product,
  }) : super(key: key);

  final ValueChanged<Color> onColorChanged;
  final Product product;

  @override
  _dotlyorah_glutterState createState() => _dotlyorah_glutterState();
}
class _dotlyorah_glutterState extends State<dotlyorah_glutter> {
  Color selectedcolor = hexToColor('#92868f');
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
          .doc('wkOtSJDRP1a4R1lOi9vs') // Use the appropriate document ID
          .get();

      if (documentSnapshot.exists) {
        List<dynamic>? colorHexStrings = documentSnapshot.get('color');

        if (colorHexStrings != null && colorHexStrings.isNotEmpty) {
          setState(() {
            colorHistoryHex = List<String>.from(colorHexStrings);
             selectedcolor = hexToColor(colorHistoryHex[Random().nextInt(colorHistoryHex.length)]);
               widget.product.updateSelectedColor(selectedcolor);
          });
        }
      }
    } catch (e) {
      print("Error fetching colors from Firestore: $e");
    }
  }

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
         if (selectedcolor == hexToColor('#92868f')) 
         const   newsliderlyorah_glutter(),

         if (selectedcolor == hexToColor('#998062'))
          const   newsliderlyorah_glutter1(),

         if (selectedcolor == hexToColor('#aa9987'))
          const   newsliderlyorah_glutter2(),


        
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
                              color: color == hexToColor('#fcf4ff')
                                  ? Colors.black
                                  : hexToColor('#fcf4ff')
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
