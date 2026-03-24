import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:harir/home/signups_screen.dart';
import 'package:harir/other/bottom.dart';
import 'package:harir/other/usernull.dart';
import 'package:harir/shalat/details.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final myKey = GlobalKey<FormState>();
  static final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool showPassword = false;
  bool _isLoading = false;
  bool _isPrivacyPolicyAccepted = true;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _showSnackbar = false; // Flag to show the Snackbar
  final _snackbarDuration = const Duration(seconds: 5);
   String phone = '';
  
   _facebookLogin() async {
    // Create an instance of FacebookLogin
    final fb = FacebookLogin();
    // Log in
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile, // permission to get public profile
      FacebookPermission.email,// permission to get email address 
    ]);
    // Check result status
    switch (res.status) {
      case FacebookLoginStatus.success:
        final FacebookAccessToken? accessToken = res.accessToken; // get accessToken for auth login
        final profile = await fb.getUserProfile(); // get profile of user
        final imageUrl = await fb.getProfileImageUrl(width: 100); // get user profile image
        final email = await fb.getUserEmail(); // get user's email address

        print('Access token: ${accessToken?.token}');
        print('Hello, ${profile!.name}! You ID: ${profile.userId}');
        print('Your profile image: $imageUrl');
        if (email != null)
          print('And your email is $email');

        //push to success page after successfully signed in
        Navigator.push(context, MaterialPageRoute(builder: ((context) => BottomNavigationBarWidget(
        
        ))));
        

        break;
      case FacebookLoginStatus.cancel:
        // User cancel log in
        break;
      case FacebookLoginStatus.error:
        // Log in failed
        print('Error while log in: ${res.error}');
        break;
    }

  }
   Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
 void showDisconnectedMessage() {
      var _media = MediaQuery.of(context);
     AwesomeDialog(
    context: context,
    animType: AnimType.rightSlide,
    dialogType: DialogType.error,
    body: CustomMediaQuery(
      child: Container(
        height: _media.size.width*0.18,
        child: Column(
          children: [
          Center(
              child: Text(
                'تحقق من اتصالك بالشبكة ',
                style: TextStyle(fontFamily: 'Cairo',fontSize: _media.size.width*0.06),
              ),
            ),
            SizedBox(height: _media.size.width*0.05,),
          
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

 

Future<void> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  
  // Once signed in, return the UserCredential
  final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

  // Access user information
  final User? user = userCredential.user;

  if (user != null) {
    // Check if the user exists in Firestore
    final DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(user.uid).get();

    if (userSnapshot.exists) {
      // User already exists, update only specific fields
      await _firestore.collection('users').doc(user.uid).update({
        'name': user.displayName,
         'email':user.email,
      });
    } else {
      // User does not exist, add all fields
      await _firestore.collection('users').doc(user.uid).set({
        'email': user.email,
        'name': user.displayName,
         'phone':phone,
      });
    }
  }

  // Navigate to the desired screen
  Navigator.of(context).pushNamedAndRemoveUntil('bottom', (route) => false);
}



  Future<void> signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }


  Future<void> _loadUserData() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _isLoading = true;
      });

      final DocumentSnapshot userData =
          await _firestore.collection('users').doc(user.uid).get();

      setState(() {
        _isLoading = false;
        _emailController.text = userData['email'];
      });
    }
  }
   void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: hexToColor('#9C0945'),
        content: CustomMediaQuery(child: Text(message,style: TextStyle(color: Colors.white,fontFamily: 'Cairo',fontWeight: FontWeight.bold),)),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
  }

 Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );

      // Show a success Snackbar or navigate to a success screen
      showSnackbar(
        "تم إرسال رابط استعادة كلمة المرور. يرجى التحقق من بريدك لإعادة تعيين كلمة المرور.",
      );
    } catch (e) {
      // Handle password reset errors
      showSnackbar(
        "حدث خطأ أثناء إرسال رابط استعادة كلمة المرور. يرجى المحاولة مرة أخرى.",
      );
    }
  }

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true; // Start loading
    });

    Timer(_snackbarDuration, () {
      // Show Snackbar after 5 seconds if still loading
      if (_isLoading) {
        showArabicSnackbar(context, "تحقق من اتصالك وحاول مرة أخرى.");
        setState(() {
          _isLoading = false; // Stop loading
          _showSnackbar = true; // Set flag to true to prevent repeated Snackbars
        });
      }
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,)
      final user = _auth.currentUser;
      if (user != null ) {
       
   
        Navigator.of(context).pushReplacementNamed('bottom');
      } 
    } on FirebaseAuthException catch (e) {
    
      if (e.code == 'user-not-found') {
         final _media = MediaQuery.of(context);
       // ignore: use_build_context_synchronously
       AwesomeDialog(  
    context: context,
    animType: AnimType.rightSlide,
    dialogType: DialogType.error,
    body: CustomMediaQuery(
      child: Container(
        height: _media.size.width*0.6,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: _media.size.width*0.04),
                child: Text(
                  'لا يوجد لديك حساب يستعمل هذا البريد الإلكتروني ',
                  style: TextStyle(fontFamily: 'Cairo',fontSize: _media.size.width*0.045),
                ),
              ),
            ),
            SizedBox(height: _media.size.width*0.05,),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                  openSignupscreen();
                  },
                  child: Text(
                    'هل تريد إنشاء حساب',
                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white,fontSize: _media.size.width*0.04),
                  ),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>( Size(_media.size.width *0.6, _media.size.width *0.15), ),
                    backgroundColor: MaterialStateProperty.all(hexToColor('#9C0945'),),
                  ),
                ),
                const SizedBox(width: 25,height: 10,), // Adjust spacing between buttons
               // Adjust spacing between buttons
                TextButton(
                  onPressed: () {
               Navigator.pop(context);
               },
                  child: Text(
                    'لقد فهمت ذلك',
                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white,fontSize: _media.size.width*0.04),
                  ),
                  style: ButtonStyle(

                     fixedSize: MaterialStateProperty.all<Size>( Size(_media.size.width *0.6, _media.size.width *0.15), ),
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
      } else if (e.code == 'wrong-password') {
             final _media = MediaQuery.of(context);
       // ignore: use_build_context_synchronously
       AwesomeDialog(  
    context: context,
    animType: AnimType.rightSlide,
    dialogType: DialogType.error,
    body: CustomMediaQuery(
      child: Container(
        height: _media.size.width*0.65,
        child: Column(
          children: [
          Center(
              child: Text(
                'كلمة المرور غير صحيحة ',
                style: TextStyle(fontFamily: 'Cairo',fontSize: _media.size.width*0.045),
              ),
            ),
            SizedBox(height: _media.size.width*0.04,),
            Column(
              children: [
                TextButton(
                  onPressed: resetPassword,
                 
                
                  // ignore: sort_child_properties_last
                  child:  Text(
                    'إعادة تعين كلمة المرور ',
                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white,fontSize: _media.size.width*0.04),
                  ),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>( Size(_media.size.width *0.6, _media.size.width *0.15), ),
                    backgroundColor: MaterialStateProperty.all(hexToColor('#9C0945'),),
                  ),
                ),const SizedBox(width: 25,height: 10,),
                 TextButton(
                  onPressed: () {
                  launch("https://mail.google.com/mail/u/0/#inbox");
                  },
                  child: Text(
                    'الذهاب إلى البريد الإلكتروني ',
                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white,fontSize: _media.size.width*0.04),
                  ),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>( Size(_media.size.width *0.6, _media.size.width *0.15), ),
                    backgroundColor: MaterialStateProperty.all(hexToColor('#9C0945'),),
                  ),
                ),
                const SizedBox(width: 25,height: 10,), // Adjust spacing between buttons
               // Adjust spacing between buttons
                TextButton(
                  onPressed: () {
               Navigator.pop(context);
               },
                  child: Text(
                    'لقد فهمت ذلك',
                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white,fontSize: _media.size.width*0.04),
                  ),
                  style: ButtonStyle(

                     fixedSize: MaterialStateProperty.all<Size>( Size(_media.size.width *0.6, _media.size.width *0.15), ),
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
      } else {
     showSnackbar('حدث خطأ غير معروف يرجى المحاولة فيما بعد');
      }
      
    } finally {
      // Stop loading and reset the _showSnackbar flag
      setState(() {
        _isLoading = false;
        _showSnackbar = false;
      });
    }
  }

  void _showNotVerifiedDialog() {
     final _media = MediaQuery.of(context);
     AwesomeDialog(
    context: context,
    animType: AnimType.rightSlide,
    dialogType: DialogType.success,
    body: CustomMediaQuery(
      child: Container(
        height: _media.size.width*0.8,
        child: Column(
          children: [
          Center(
              child: Text(
                'لم يتم التحقق من بريدك الإلكتروني',
                style: TextStyle(fontFamily: 'Cairo',fontSize: _media.size.width*0.045),
              ),
            ),
            SizedBox(height: _media.size.width*0.05,),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    launch("https://mail.google.com/mail/u/0/#inbox");
                  },
                  child: Text(
                    'الذهاب إلى البريد الإلكتروني ',
                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white,fontSize: _media.size.width*0.04),
                  ),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>( Size(_media.size.width *0.6, _media.size.width *0.15), ),
                    backgroundColor: MaterialStateProperty.all(hexToColor('#9C0945'),),
                  ),
                ),
                const SizedBox(width: 25,height: 10,), // Adjust spacing between buttons
               // Adjust spacing between buttons
                TextButton(
                  onPressed: () async{
                Navigator.of(context).pop(); // Close the dialog
                  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: hexToColor('#9C0945'),
        content: CustomMediaQuery(child: Text('لقد تم إعادة إرسال رسالة التحقق',style: TextStyle(fontFamily: 'Cairo',color: Colors.white
        ,fontSize: _media.size.width*0.04),)),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
                
                  final user = _auth.currentUser;
                  if (user != null) {
                      await user.sendEmailVerification();} // Close the dialog
               },
                  child: Text(
                    'إعادة إرسال رسالة التحقق',
                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white,fontSize: _media.size.width*0.04),
                  ),
                  style: ButtonStyle(

                     fixedSize: MaterialStateProperty.all<Size>( Size(_media.size.width *0.6, _media.size.width *0.15), ),
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

  void openSignupscreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SignupScreen()));
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
  
  void showPrivacyPolicyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PrivacyPolicyPage();
      },
    );
  }

  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void showArabicSnackbar( context, String message) {
    if (!_showSnackbar) {
      var _media = MediaQuery.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          
          backgroundColor: hexToColor('#9C0945'), // Purple accent background
          content: Text(
            message,
            style: TextStyle(
              color: Colors.white, // White text color
              fontFamily: 'Cairo', // Arabic font
              fontSize: _media.size.width * 0.04, // Adjust font size
           // Right-to-left text direction for Arabic
            ),
          ),
          duration: _snackbarDuration,
        ),
      );
    } return;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
    @override
  Widget build(BuildContext context) {
  

  var _media = MediaQuery.of(context);
 

    return  Scaffold(
      backgroundColor:Colors.white,
      body: Form(
        key: myKey,
        child: SafeArea(
          child: Center(
            child: CustomMediaQuery(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                
                    
                    
                    
                    
                      Text('متجر حرير ',
                         style: TextStyle(
                         fontFamily: 'ReemKufi',
                         fontSize: _media.size.width * 0.16,
                        fontWeight: FontWeight.bold,
                                     color: hexToColor('#9C0945'),
                                   ),
                                  ),
                
     
                          SizedBox(height: _media.size.width *0.1),
                
                         Padding(
                 padding:  EdgeInsets.symmetric(horizontal: _media.size.width * 0.06),
                 child: Container(
                  height: _media.size.width*0.22,
                  width: _media.size.width*0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                     child: Padding(
                     padding:  EdgeInsets.symmetric(horizontal: _media.size.width *0.02,),
                     child: Center(
                       child: TextFormField(
                         validator: (value) {
                              if (value!.isEmpty) {
                              showArabicSnackbar(context, 'يجب عليك كتابة الايميل');
                              return'';
                                //'يجب عليك كتابة الايميل';
                              } else if (!emailRegex.hasMatch(value)) {
                                showArabicSnackbar(context, 'اكتب البريد الإلكتروني بشكل صحيح');
                                return'';
                               // 'اكتب البريد الإلكتروني بشكل صحيح';
                              }
                              return null;
                            },
                          keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        style: TextStyle(
                          fontSize: _media.size.width*0.038
                        ),
                        decoration:  InputDecoration(
                            errorStyle: TextStyle(fontSize: _media.size.width*0.000000000000000000000000001),
                        suffixIcon: Icon(Icons.email_outlined),
                        suffixIconColor: hexToColor('#9C0945'),
                          border:  OutlineInputBorder(borderSide: BorderSide(color: hexToColor('#9C0945'),)),
                          labelText: 'البريد الإلكتروني',
                          hintText: 'البريد الإلكتروني ',
                          labelStyle: TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.black,
                            fontSize: _media.size.width *0.043,
                          
                          )
                            
                        ),
                       
                       ),
                     ),
                   ),
                 ),
                         ),
                     
                          SizedBox(height: _media.size.width*0.02,),
                    
                Padding(
                 padding:  EdgeInsets.symmetric(horizontal: _media.size.width * 0.06),
                 child: Container(
                  height: _media.size.width*0.22,
                  width: _media.size.width*0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                   child: Padding(
                     padding:  EdgeInsets.symmetric(horizontal:_media.size.width * 0.02 ),
                     child: Center(
                       child: TextFormField(
                            validator: (value) {
                            if (value!.isEmpty ){
                              showArabicSnackbar(context, "يجب عليك كتابة كلمة المرور");
                              return'';
                            // return "يجب عليك كتابة كلمة المرور";
                            }else if(value.length<6) {
                          showArabicSnackbar(context, "يجب أن تكون كلمة المرور اكثر من 5 رموز");
                          return'';
                             // return "يجب أن تكون كلمة المرور اكثر من 5 رموز";
                            }
                            return null;
                            },
                                          style: TextStyle(
                          fontSize: _media.size.width*0.038
                        ),
                        controller: _passwordController,
                        obscureText: !showPassword,
                        decoration: InputDecoration(
                             errorStyle: TextStyle(fontSize: _media.size.width*0.000000000000000000000000001),
                          border:  OutlineInputBorder(borderSide: BorderSide(color: hexToColor('#9C0945'),)),
                          labelText: "كلمة المرور",
                          hintText: 'كلمة المرور ',
                          labelStyle:  TextStyle(
                             fontSize: _media.size.width *0.043,
                            fontFamily: 'Cairo',
                            color: Colors.black,
                          ),
                           suffixIcon: SizedBox(height: _media.size.width*0.075,
                             child: IconButton(
                                      onPressed: togglePasswordVisibility,
                                      icon: Icon(
                                         
                                        showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off ,
                                        color: hexToColor('#9C0945'),
                                        size: _media.size.width*0.06,
                                        
                                      )),
                           ),
                        ),
                       ),
                     ),
                   ),
                 ),
                         ),
                    
                    
                    
                    
                    
                     SizedBox(height: _media.size.width * 0.03,),
                    
                     ElevatedButton( onPressed:     

                    _isLoading || !_isPrivacyPolicyAccepted ? null : () async{
                                       Future<bool> isConnected = checkConnectivity();
                       
                         if(await isConnected == false){
                          return showDisconnectedMessage();
                         }
                      if (myKey.currentState!.validate()) {
                         _signIn();
                      }else {
    
       
        }
                    },
                     style: ElevatedButton.styleFrom(
                      
                        primary: hexToColor('#9C0945'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding:  EdgeInsets.symmetric(
                            vertical:_media.size.width * 0.035 , horizontal: _media.size.width * 0.053),
                        minimumSize:  Size(_media.size.width *.87, _media.size.width * .1),
                      ),
                    child: _isLoading
                        ?  CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(hexToColor('#9C0945'),),
                          )
                        :  Text("تسجيل الدخول",style: TextStyle(fontFamily: 'Cairo',fontSize: _media.size.width * 0.05),),
                        
                  ),
    
                   
                     SizedBox(height: _media.size.width * 0.03,),
                    
                     Padding(
                       padding:  EdgeInsets.symmetric(horizontal: _media.size.width*0.06),
                       child: ElevatedButton(
                                         onPressed: () async {
                            Future<bool> isConnected = checkConnectivity(); 

         if(await isConnected == false ){return showDisconnectedMessage();}else{             
                         setState(() {
                           // Set _isLoading to true while the authentication is in progress
                           _isLoading = true;
                         });
                     
                         // Call the signInAnonymously function
                         UserCredential? result = await signInAnonymously();
                      
                               
                         setState(() {
                           // Set _isLoading to false when authentication is completed
                           _isLoading = false;
                         });
                     
                         if (result != null) {
                           // Authentication was successful, handle the next steps as needed
                           // For example, you might want to navigate to another screen
                           Navigator.push( context, MaterialPageRoute( builder: (context) => Bottomnull()));
                         } else {
                           // Authentication failed, you may want to show an error message
                           // or handle it in a way that makes sense for your application
                           // For example, you might want to display a snackbar with an error message
                           ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                               content: Text('Failed to sign in anonymously'),
                             ),
                           );
                         }
                                           }  },
                       
                        style: ElevatedButton.styleFrom(
                        
                          primary: hexToColor('#9C0945'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding:  EdgeInsets.symmetric(
                              vertical:_media.size.width * 0.035 , horizontal: _media.size.width * 0.053),
                          minimumSize:  Size(_media.size.width *.87, _media.size.width * .1),
                        ),
                                         child: _isLoading
                          ?  CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(hexToColor('#9C0945'),)
                            )
                          :  Row(
                            children: [
                              Text('الدخول كزائر ',style: TextStyle(fontFamily: 'Cairo',fontSize: _media.size.width * 0.05),),
                             SizedBox(width: _media.size.width*0.4,),
                              Icon(Icons.person,size: _media.size.width*0.08,),
                            ],
                          ),
                          
                                       ),
                     ),
                  Padding(
                    padding:  EdgeInsets.only(right: _media.size.width*0.05,top: _media.size.width*0.02),
                    child: Row(
                      children: [
                    
                     Transform.scale(
                      scale: _media.size.width*0.002,
                       child: Checkbox(
                                     value: _isPrivacyPolicyAccepted,
                                     onChanged: (newValue) {
                                       setState(() {
                        _isPrivacyPolicyAccepted = newValue!;
                                       });
                                     },
                                     
                                   ),
                     ),
                                Column(
                                  children: [
                                // ignore: prefer_const_constructors
                                Row(children:  [
                        
                                 Text(
                                ' لقد قرأت ووافقت على  ', // Customize the text as needed
                                  style: TextStyle(
                    fontSize: _media.size.width * 0.035,
                    fontFamily: 'Cairo',
                    color: Colors.black,
                                  ),
                                ),
                                 GestureDetector(
                        onTap: () {
                                showPrivacyPolicyDialog(context);
                        },
                        child: Container(
                                decoration:  BoxDecoration(
                                  border: Border(
                        bottom: BorderSide(
                        color: hexToColor('#9C0945'), // Customize the line color
                        width: 1 , // Adjust the line width as needed
                        ),
                                  ),
                                ),
                                child:  Padding(
                                  padding:  EdgeInsets.only(top: _media.size.width*0.01),
                                  child: Text(
                    'سياسة الخصوصية',
                    style: TextStyle(
                          fontSize: _media.size.width * 0.035,
                          fontWeight: FontWeight.bold,
                     
                          color: hexToColor('#9C0945'), // Customize the text color
                          decoration: TextDecoration.none, // Remove the default underline
                    ),
                                  ),
                                ),
                        ),
                      ),
                      
                      
                      
                      
                      
                      
                                ],),   // Display a validation message if the privacy policy is not accepted
                                  if (!_isPrivacyPolicyAccepted)
                         Padding(
                        padding: EdgeInsets.symmetric(horizontal: _media.size.width *0.05, vertical: _media.size.width * 0.01),
                        child: Text(
                                'يجب أن توافق على سياسة الخصوصية أولاً.', // Customize the validation message
                                style: TextStyle(
                                  fontSize: _media.size.width * 0.035,
                                  color: Colors.red, // Display in red
                                ),
                        ),
                        ),
                                  ])
                      ]),
                  ),  
                    
                    
                    
                    
                     SizedBox(height: _media.size.width * 0.03,),
                    
                    
                    
                    
                     Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                    
                    
                    
                    
                          Text(' لم تسجل دخول بعد ؟',
                         style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: _media.size.width * 0.034,
                    fontFamily: 'Cairo'
                         ),
                         
                         
                         ),
                         
                    
                    
                    
                    
                    GestureDetector(
                    onTap: openSignupscreen,
                    
                    
                    child:    Text(' إنشاء الحساب',
                    
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    fontSize: _media.size.width * 0.034,
                        color: hexToColor('#9C0945'),
                    fontFamily: 'Cairo'
                    ),
                    
                    
                    ),
                    ),
                    
                    
                    
                    
                    
                       
                    
                    
               
                    
                    
                     ],
                     ),
                    
                   !_isPrivacyPolicyAccepted

                          ? Padding(padding: EdgeInsets.only(top:_media.size.width*0.03 , ),
                            child: LoadingAnimationWidget.threeArchedCircle(color: hexToColor('#9C0945'), size: _media.size.width*0.1))
                          
                         :
                    Column(children: [
                  SizedBox(height:_media.size.width*0.02 ,),
                    GestureDetector(onTap: ()async{
                     Future<bool> isConnected = checkConnectivity(); 

         if(await isConnected == false){
        
          return showDisconnectedMessage();
         }else{
      
showDialog(
  context: context,
  barrierDismissible: false, // Prevent user from dismissing while loading
  builder: (BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  },
);

try {
  await signInWithGoogle();
   // Close the progress dialog on success
} catch (error) {
  // Handle sign-in errors (e.g., show error message)
  print(error); // Log the error for debugging
 // Close the progress dialog on error
} finally {
  // Always close the progress dialog, even on successful sign-in
 // Navigator.pop(context);
}
        }
                    },
                      
                      child: Container(height: _media.size.width*0.15,width: _media.size.width*0.9,decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: hexToColor('#9C0945'),),

                       child: Row(mainAxisAlignment: MainAxisAlignment.center,
                         children:   [
                           Text('تسجيل الدخول عبر جوجل ',style: TextStyle(color: Colors.white,
                            fontFamily: 'Cairo',fontSize: _media.size.width*0.04,fontWeight: FontWeight.bold),),SizedBox(width: _media.size.width*0.03, ),
                         Container(height: _media.size.width*0.1,width: _media.size.width*0.1,
                          child: CircleAvatar(backgroundColor: Colors.white,foregroundImage: AssetImage('images/google-logo-icon-png-transparent-background-osteopathy-16.png'),))],),
                                           ),
                    )
                  ])
                    
                    
                
                    
                    
                       
                    
                         
                         
                         
                         
                         
                         
                 
                    
                    
                    
                    
                    
                    
                    
            ])
                    
                ),
              ),
            ),
              ),
        ) );
    
    
      


  }
  void showDisconnected1Message() {
      var _media = MediaQuery.of(context);
     AwesomeDialog(
    context: context,
    animType: AnimType.rightSlide,
    dialogType: DialogType.error,
    body: CustomMediaQuery(
      child: Container(
        height: _media.size.width*0.18,
        child: Column(
          children: [
          Center(
              child: Text(
                'تحقق من اتصالك بالشبكة ',
                style: TextStyle(fontFamily: 'Cairo',fontSize: _media.size.width*0.06),
              ),
            ),
            SizedBox(height: _media.size.width*0.05,),
          
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









class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     var _media = MediaQuery.of(context);
    return CustomMediaQuery(
      child: Scaffold(
        appBar: AppBar(backgroundColor: hexToColor('#9C0945'),
         iconTheme:  IconThemeData(color: hexToColor('#9C0945'),),
          title:  Padding(
            padding: EdgeInsets.only(left: _media.size.width *.14),
            child:  Center(
              child: Text('سياسة الخصوصية ',
              style: TextStyle(
                fontSize: _media.size.width * 0.07,
                
              ),),
            ),
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.all(_media.size.width*0.04),
          child: ListView(
            children:  [
              Text(
                '''سياسة الخصوصية لدى حرير 
    
    
    
    في حرير، نحن ملتزمون بحماية خصوصيتك وضمان أمان معلوماتك الشخصية. توضح هذه السياسة سواء نحن كيفية جمعنا واستخدمنا ونشرنا وحمينا معلوماتك عندما تزور متجرنا أو تستخدم خدماتنا. من خلال استخدام خدماتنا، أنت توافق على الممارسات الموجودة في هذه السياسة.
    
    المعلومات التي نجمعها
    
    نقوم بجمع أنواع مختلفة من المعلومات عندما تتفاعل مع حرير، وتشمل ذلك:
    
    أ. المعلومات الشخصية: وتشمل ذلك اسمك ومعلومات الاتصال بك (مثل عنوان البريد الإلكتروني ورقم الهاتف والعنوان الجسدي (الموقع) ) ومعلومات الدفع عندما تقوم بعملية شراء.
    
    ب. معلومات الاستخدام: قد نقوم بجمع معلومات حول كيفية تفاعلك مع موقعنا على الويب، بما في ذلك عنوان IP الخاص بك ونوع المستعرض ومعلومات الجهاز وأنماط التصفح.
    
    ج. معلومات المعاملات: قد نقوم بجمع معلومات تتعلق بمشترياتك، مثل تاريخ الطلب وتفاصيل الدفع.
    
    كيف نستخدم معلوماتك
    
    نستخدم المعلومات التي نجمعها لأغراض متعددة، بما في ذلك:
    
    أ. تقديم وتحسين الخدمات: نستخدم معلوماتك لتنفيذ طلباتك، والتواصل معك بشأن مشترياتك، وتحسين خدماتنا.
    
    ب. التسويق والعروض الترويجية: بموافقتك، قد نرسل لك مواد ترويجية، وعروض خاصة، وتحديثات حول منتجاتنا وخدماتنا.
    
    ج. دعم العملاء: نستخدم معلوماتك لتقديم دعم العملاء والتعامل مع أي استفسارات أو مشكلات قد تواجهها.
    
    د. الامتثال القانوني والشروط: قد نستخدم معلوماتك للامتثال بالتزاماتنا القانونية وفرض سياساتنا.
    
    مشاركة معلوماتك
    
    قد نشارك معلوماتك مع الأطراف التالية:
    
    أ. مقدمي الخدمة: قد نشارك معلوماتك مع مقدمي خدمات الجهات الثالثة الذين يساعدوننا في تقديم خدماتنا، مثل معالجي المدفوعات وشركات الشحن.
    
    ب. المتطلبات القانونية: قد نكشف عن معلوماتك للامتثال بالالتزامات القانونية والاستجابة لطلبات الجهات الإنفاذية وحماية حقوقنا وحقوق الآخرين.
    
    ج. نقل الأعمال: إذا مررنا باندماج أو استحواذ أو بيع للأصول، فإن معلوماتك قد يتم نقلها كجزء من الصفقة.
    
    اختياراتك
    
    أ. إلغاء الاشتراك: يمكنك إلغاء الاشتراك في تلقي الاتصالات التسويقية منا في أي وقت عن طريق اتباع التعليمات الموجودة في الاتصال.
    
    ب. الوصول والتحديث: لديك الحق في الوصول إلى معلوماتك الشخصية وتحديثها. يمكنك القيام بذلك عن طريق تسجيل الدخول إلى حسابك أو الاتصال بنا.
    
    ج. الحذف: يمكنك طلب حذف معلوماتك الشخصية، على سبيل المثال وفقًا لالتزامات قانونية وسياسات الاحتفاظ بالبيانات لدينا.
    
    الأمان
    
    نحن نعتمد على تدابير أمان لحماية معلوماتك من الوصول غير المصرح به، والكشف، والتغيير، والتدمير. ومع ذلك، لا يمكن ضمان الأمان التام لنقل البيانات عبر الإنترنت أو التخزين الإلكتروني، ولا يمكننا ضمان الأمان المطلق.
    
    خصوصية الأطفال
    
    خدماتنا ليست مخصصة للأطفال دون سن الثالثة عشرة. نحن لا نقوم بجمع أو تخزين معلومات من الأطفال دون سن الثالثة عشرة بدون موافقة الوالدين.
    
    تغييرات على سياسة الخصوصية هذه
    
    قد نقوم بتحديث سياسة الخصوصية هذه بشكل دوري ليعكس التغييرات في ممارساتنا. سنقوم بإعلامك بأي تغييرات كبيرة من خلال نشر السياسة المحدثة على موقعنا على الويب.
    
    تواصل معنا
    
    إذا كانت لديك أي أسئلة أو مخاوف بشأن سياسة الخصوصية هذه أو معلوماتك الشخصية، يرجى الاتصال بنا على:
    
    email: 7arir.store@gmail.com
    
    phone: 0792859580
    
    [معلومات الاتصال]
    
    من خلال استخدام خدماتنا، توافق على الممارسات الموجودة في سياسة الخصوصية هذه.''',
                style: TextStyle(
                  fontSize: _media.size.width * 0.047,
                
                   fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
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
    var customMediaQuery = _media.copyWith(textScaleFactor: 1.1);

    return MediaQuery(
      data: customMediaQuery,
      child: child,
    );
  }
}



  Future<void> _signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.accessToken != null) {
        // User is logged in
        print('Logged in with Facebook');
      } else {
        // Login failed
        print('Failed to log in with Facebook');
      }
    } catch (e) {
      print('Error logging in with Facebook: $e');
    }
  }