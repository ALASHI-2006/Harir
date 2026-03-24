import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:harir/home/loginscreen.dart';
import 'package:harir/other/bottom.dart';
import 'package:harir/shalat/details.dart';
import 'package:flutter/animation.dart'; // Import for animations

class loading_screen extends StatefulWidget {
  const loading_screen({super.key});

  @override
  State<loading_screen> createState() => _loading_screenState();
}

class _loading_screenState extends State<loading_screen>
    with TickerProviderStateMixin {
  Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  late final AnimationController _animationController;
  late final AnimationController _animationController1;
  // double _topPosition = 0.0; // Initial top position for first text
  // double _opacity = 0.0;     // Initial opacity for second text

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavigationBarWidget(),
          ),
        );
      }
    });
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController1 =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animationController.forward();
    _animationController1.forward();
    _animationController.addListener(() {
      setState(() {
        // Adjust height as needed
        //   _topPosition = -180.0 * _animationController.value; // Fade in with animation progress
      });
    });

    _animationController1.addListener(() {
      setState(() {
        // Adjust height as needed
        //  _opacity = _animationController1.value; // Fade in with animation progress
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        // Use Stack for positioning
        children: [
          Center(
            // Center the first text vertically
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: _media.size.width * .5),
                child: Text(
                  'متجر حرير ',
                  style: TextStyle(
                    fontFamily: 'ReemKufi',
                    fontSize: _media.size.width * 0.2,
                    fontWeight: FontWeight.bold,
                    color: hexToColor('#9C0945'),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: _media.size.height * 0.1), // A
              child: Text(
                'كل ما يلزم المحجبة في مكان واحد ',
                style: TextStyle(
                  fontFamily: 'ReemKufi',
                  fontSize: _media.size.width * 0.065,
                  color: hexToColor('#9C0945'),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right, // Right-align the text
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class loading_screen1 extends StatefulWidget {
  const loading_screen1({super.key});

  @override
  State<loading_screen1> createState() => _loading_screen1State();
}

class _loading_screen1State extends State<loading_screen1>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final AnimationController _animationController1;
  // double _topPosition = 0.0; // Initial top position for first text
  // double _opacity = 0.0;     // Initial opacity for second text
  Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      if (mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => LoginScreen())));
      }
    });
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController1 =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animationController.forward();
    _animationController1.forward();
    _animationController.addListener(() {
      setState(() {
        // Adjust height as needed
        //    _topPosition = -180.0 * _animationController.value; // Fade in with animation progress
      });
    });

    _animationController1.addListener(() {
      setState(() {
        // Adjust height as needed
        //  _opacity = _animationController1.value; // Fade in with animation progress
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        // Use Stack for positioning
        children: [
          Center(
            // Center the first text vertically
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: _media.size.width * .5),
                child: Text(
                  'متجر حرير ',
                  style: TextStyle(
                    fontFamily: 'ReemKufi',
                    fontSize: _media.size.width * 0.2,
                    fontWeight: FontWeight.bold,
                    color: hexToColor('#9C0945'),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: _media.size.height * 0.1), // A
              child: Text(
                'كل ما يلزم المحجبة في مكان واحد ',
                style: TextStyle(
                  fontFamily: 'ReemKufi',
                  fontSize: _media.size.width * 0.065,
                  color: hexToColor('#9C0945'),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right, // Right-align the text
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class loading_screen2 extends StatefulWidget {
  const loading_screen2({super.key});

  @override
  State<loading_screen2> createState() => _loading_screen2State();
}

class _loading_screen2State extends State<loading_screen2>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final AnimationController _animationController1;
  // double _topPosition = 0.0; // Initial top position for first text
  // double _opacity = 0.0;     // Initial opacity for second text
  Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {});
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController1 =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animationController.forward();
    _animationController1.forward();
    _animationController.addListener(() {
      setState(() {
        // Adjust height as needed
        //    _topPosition = -180.0 * _animationController.value; // Fade in with animation progress
      });
    });

    _animationController1.addListener(() {
      setState(() {
        // Adjust height as needed
        //  _opacity = _animationController1.value; // Fade in with animation progress
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        // Use Stack for positioning
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: _media.size.width * .5),
              child: Text(
                'متجر حرير ',
                style: TextStyle(
                  fontFamily: 'ReemKufi',
                  fontSize: _media.size.width * 0.2,
                  fontWeight: FontWeight.bold,
                  color: hexToColor('#9C0945'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: _media.size.height * 0.1), // A,
              child: Text(
                'يرجى التحقق من اتصالك بالأنترنت ',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: _media.size.width * 0.065,
                  color: hexToColor('#9C0945'),
                ),
                textAlign: TextAlign.right, // Right-align the text
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class loading_screen3 extends StatefulWidget {
  const loading_screen3({super.key});

  @override
  State<loading_screen3> createState() => _loading_screen3State();
}

class _loading_screen3State extends State<loading_screen3>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final AnimationController _animationController1;
  // double _topPosition = 0.0; // Initial top position for first text
  // double _opacity = 0.0;     // Initial opacity for second text
  Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController1 =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animationController.forward();
    _animationController1.forward();
    _animationController.addListener(() {
      setState(() {
        // Adjust height as needed
        //   _topPosition = -180.0 * _animationController.value; // Fade in with animation progress
      });
    });

    _animationController1.addListener(() {
      setState(() {
        // Adjust height as needed
        // _opacity = _animationController1.value; // Fade in with animation progress
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        // Use Stack for positioning
        children: [
          Center(
            // Center the first text vertically
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: _media.size.width * .5),
                child: Text(
                  'متجر حرير ',
                  style: TextStyle(
                    fontFamily: 'ReemKufi',
                    fontSize: _media.size.width * 0.2,
                    fontWeight: FontWeight.bold,
                    color: hexToColor('#9C0945'),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: _media.size.height * 0.1), // A
              child: Text(
                'كل ما يلزم المحجبة في مكان واحد ',
                style: TextStyle(
                  fontFamily: 'ReemKufi',
                  fontSize: _media.size.width * 0.065,
                  color: hexToColor('#9C0945'),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right, // Right-align the text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
