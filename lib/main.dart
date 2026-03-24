

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:harir/home/splash_screen.dart';
import 'package:harir/home/stuck_out.dart';
import 'package:harir/other/bottom.dart';
import 'package:harir/hijab/veiwer.dart';
import 'package:harir/other/profile.dart';
import 'package:harir/other/usernull.dart';
import 'package:harir/screens/admin.dart';
import 'package:harir/shalat/details.dart';
import 'package:harir/shalat/firstone.dart';
import 'package:harir/home/home_screen.dart';
import 'package:harir/home/loginscreen.dart';
import 'package:harir/mkmlat/secondone.dart';
import 'package:harir/home/signups_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:harir/hijab/thirdone.dart';
import 'package:harir/shalat/product.dart';
import 'package:harir/shalat/shalatviewer.dart';
import 'package:harir/mkmlat/mkmlatviewer.dart';
import 'package:provider/provider.dart';
import 'other/cart.dart';
import 'other/check_oreder.dart';
import 'package:package_info/package_info.dart';



void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Run the app with the CartProvider
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);


  
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(hexToColor('#9C0945'))
      ),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale("ar", "AE")],
      locale: const Locale("ar", "AE"),
      initialRoute: '/',
      routes: {
        '/': (context) => const Auth1(),
        'editprofile': (context) => EditProfileScreen(updateUserCallback: () {}),
        'bottom': (context) => const BottomNavigationBarWidget(),
        'HomeScreen': (context) => HomeScreen(),
        'Signupscreen': (context) => const SignupScreen(),
        'LoginSecreen': (context) => const LoginScreen(),
        'firstone': (context) => firstone( press: () { Navigator.push( context,  MaterialPageRoute(  builder: (context) => shalatviewer(product: shalatProducts[1]),  ), );},),
        'secondone': (context) => secondone( press: () {Navigator.push( context,  MaterialPageRoute(  builder: (context) => mkmlatviewer(product: shalatProducts[1]),),); },),
        'thirdone': (context) => therdone(press: () {Navigator.push( context, MaterialPageRoute( builder: (context) => hijabviewer(product: shalatProducts[1]),  ),   );  }, ),
        'cart':(context) => CartScreen(),
        'check_oreder':(context) => check_oreder(),
        'null':(context) => Bottomnull(),
         
      },
    );
  }

 MaterialColor createMaterialColor(Color color) {
  List<int> strengths = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int strength in strengths) {
    swatch[strength] = Color.fromRGBO(
      r,
      g,
      b,
      1.0,
    );
  }

  return MaterialColor(color.value, swatch);
}
}

Future<UserCredential?> signInAnonymously() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
    return userCredential;
  } catch (e) {
    print("Error signing in anonymously: $e");
    return null;
  }
}
class Auth1 extends StatefulWidget {
  const Auth1({Key? key});

  @override
  State<Auth1> createState() => _Auth1State();
}

class _Auth1State extends State<Auth1> {
 
    
  
  Future<bool> remoteconfig ()async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String Virion = packageInfo.version;
    print(packageInfo.version);
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 60),
    minimumFetchInterval: const Duration(seconds: 1),
)); await remoteConfig.fetchAndActivate();
    String appVirsion = remoteConfig.getString('appVirsion');
    print(appVirsion);

    if(appVirsion.compareTo(Virion) == 1){
    return true;
     } else{ 
    return false; }
  }
@override
  void initState() {
    remoteconfig();
    super.initState();
  }
  


  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    
    
  
     return
      
       FutureBuilder(
        future: remoteconfig(),
        builder: (context, snapshot) {
        if(snapshot.data == true){
          return splash_screen1();
         } else {return
          StreamBuilder<User?>(
          stream: _auth.authStateChanges(),
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return loading_screen();
            } else if (snapshot.hasData && snapshot.data != null) {
              User? user = snapshot.data;
              if (user!.emailVerified) {
                return FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance.collection('users').doc(user.uid).get(),
                  builder: (context, userSnapshot) {
                    if (userSnapshot.hasData) {
                      Map<String, dynamic>? userData = userSnapshot.data!.data() as Map<String, dynamic>?;
           
                      // Check if user data and role exist
                      if (userData != null && userData.containsKey('role')) {
                        if (userData['role'] == 'admin') {
                          // User is an admin, return the admin page.
                          return admin(); // Replace with the widget for the admin page.
                        } else {
                          // User is not an admin, allow access to the app.
                          return  loading_screen();
                        }
                      } else {
                        // Handle the case where 'role' field is missing in user data.
                        return loading_screen();
                      }
                    } else {
                      // Handle the case where user data cannot be retrieved.
                      return loading_screen1();
                    }
                  },
                );
              } else {
                // User is not verified, navigate to a verification screen.
                return  loading_screen1(); // Create a VerificationScreen widget.
              }
            } else {
              // User is not authenticated, always display the LoginScreen.
              return FutureBuilder<UserCredential?>(
                // Check if the user is signed in anonymously
                future: signInAnonymously(),
                builder: (context, anonSnapshot) {
                              if (anonSnapshot.connectionState == ConnectionState.waiting) {
                    return  loading_screen1();
                  } else if (anonSnapshot.hasData) {
                    // User signed in anonymously, allow access to the app.
                    return const loading_screen();
                  } else {
                    // Handle the case where anonymous authentication fails.
                    return const loading_screen();
                  }
                },
              );
              }
            },
          );
        }
       
         } );
 
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