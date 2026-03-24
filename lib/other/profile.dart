import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:harir/home/loginscreen.dart';
import 'package:harir/other/check_oreder.dart';
import 'package:harir/shalat/details.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'bottom.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:connectivity/connectivity.dart';
class EditProfileScreen extends StatefulWidget {
  final VoidCallback updateUserCallback;

  EditProfileScreen({required this.updateUserCallback});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isLoading = false;
   final user = FirebaseAuth.instance.currentUser;
    Future<bool> _onWillPop() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigationBarWidget()), );return false;}
  @override
  void initState() {
    super.initState();
    _loadUserData();
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
        _nameController.text = userData['name'];
        _emailController.text = userData['email'];
        _phoneController.text = userData['phone'];
      });
    }
  }
  Future<void> _deleteAccount() async {
    try {
      final User? user = _auth.currentUser;

      if (user != null) {
        // Delete the user's account
        await user.delete();

        // After deleting the account, you can navigate the user to a different screen or take any other necessary action.
        // For example, you can navigate to the login or home screen.
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    } catch (e) {
      print('Error deleting account: $e');
      // Handle account deletion error if needed.
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
       Navigator.of(context).pop();
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
Future<void> _confirmDeleteAccount() async {
  bool confirm = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomMediaQuery(
        child: AlertDialog(
          title: const Text('أنت الآن على وشك حذف حسابك نهائيًا'),
          content: const Text('هل أنت متأكد من أنك تريد حذف الحساب بشكل نهائي'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // User canceled account deletion
              },
              child: const Text('لا, أريد'),
            ),
            TextButton(
              onPressed: () async {
                // Reauthenticate the user before deleting the account
                try {
                  final User? user = _auth.currentUser;
                  if (user != null) {
                    // Prompt the user to enter their password for reauthentication
                    String? password = await _showReauthenticationDialog();
                    if (password == null || password.isEmpty) {
                      // Show an error message if the password is empty
                      Navigator.of(context).pop(false); // User canceled account deletion
                    } else {
                      AuthCredential credential = EmailAuthProvider.credential(
                        email: user.email!,
                        password: password,
                      );

                      await user.reauthenticateWithCredential(credential);

                      // User has been reauthenticated, proceed to delete the account
                      Navigator.of(context).pop(true); // User confirmed account deletion
                      _deleteAccount();

                      // Navigate to login screen after successful deletion
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()), // Replace with your login page widget
                      );
                    }
                  }
                } on FirebaseAuthException catch (e) {
                  print('FirebaseAuthException: $e');
                  // Handle specific FirebaseAuthException errors
                  String errorMessage = 'حدث خطأ أثناء التحقق من كلمة المرور';

                  if (e.code == 'wrong-password') {
                    errorMessage = 'كلمة المرور غير صحيحة';
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorMessage),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                  Navigator.of(context).pop(false); // User canceled account deletion
                } catch (e) {
                  print('Error reauthenticating: $e');
                  // Handle reauthentication error if needed
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('حدث خطأ أثناء التحقق من كلمة المرور'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                  Navigator.of(context).pop(false); // User canceled account deletion
                }
              },
              child: const Text('نعم , احذف الحساب'),
            ),
            TextButton(
              onPressed: () async {
                resetPassword();
              },
              child: Text('تغيير كلمة المرور '),
            ),
          ],
        ),
      );
    },
  );

  // No further action required here; deletion and navigation handled within the dialog.


  if (confirm == true) {
    // User confirmed deletion, no action required here; deletion will happen after reauthentication.
  }
}
 //signout



  Future<String?> _showReauthenticationDialog() async {
   String? enteredPassword;
    return await showDialog<String?>(
      context: context,
      builder: (BuildContext context) {
           var _media = MediaQuery.of(context);
        TextEditingController passwordController = TextEditingController();
        return CustomMediaQuery(
          child: AlertDialog(
            title: const Text('للتأكيد يرجى كتابة كلمة مرورك'),
            content: Container(
               width: _media.size.width*0.7,
               height: _media.size.width*0.3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey),
                    child: Padding(
                      padding:  EdgeInsets.only(right: _media.size.width*0.05),
                      child:TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'كلمة المرور',
                    labelStyle: TextStyle(fontFamily: 'Cairo'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يجب إدخال كلمة المرور';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    enteredPassword = value;
                  },
                ),)),
   const SizedBox(height: 10),
                Text(
                  enteredPassword == false ? '' : 'يجب إدخال كلمة المرور',
                  style: const TextStyle(color: Colors.red),
                ),
                    ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null); // Return null if canceled
              },
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                if (passwordController.text.isEmpty) {
                  // Show an error message if the password is empty
                  setState(() {
                    enteredPassword = null;
                  });
                } else {
                    
                  Navigator.of(context).pop(passwordController.text);
                }
              },
              child: const Text('موافق'),
              ),
            ],
          )
        );
   },
   ); 
  }
   Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Future<void> _signOut() async {
  try {
    await _auth.signOut(); // This signs the user out using Firebase Authentication
    // After signing out, you can navigate the user to the login or home screen
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const LoginScreen()));
  } catch (e) {
    print('Error signing out: $e');
    // Handle sign-out error if needed.
  }
}
  Future<void> facebookLogout() async {
    final FacebookLogin facebookLogin = FacebookLogin();

    // Log out from Facebook
    await facebookLogin.logOut();

    // Perform any additional tasks related to logging out, such as navigating to a login screen.
    // For example, you might want to clear the user's data from your app.
    // ...

    // Navigate to the login screen or any other screen as needed
    Navigator.pushReplacementNamed(context, 'LoginSecreen'); // Replace '/login' with your actual login screen route
  }


Future<void> signOutFromGoogle() async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  
  try {
    await googleSignIn.signOut();
  
    print("Google Sign Out Successful");
  } catch (error) {
    print("Error during Google Sign Out: $error");
    // Handle the error as needed
  }
}

  Future<void> _updateUserData() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      // Show a circular progress indicator while updating data
   ///   showDialog(
    //    context: context,
    //    builder: (BuildContext context) {
    //      return const Center(
    //        child: CircularProgressIndicator(),
     //     );
     //   },
    //    barrierDismissible: false,
    //  );

      // Update user data
      await _firestore.collection('users').doc(user.uid).update({
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
      });

    

      // Dismiss the circular progress indicator dialog
      Navigator.of(context, rootNavigator: true).pop();
    var _media = MediaQuery.of(context);
      // Show an Awesome Dialog indicating successful edit
     // ignore: use_build_context_synchronously
     AwesomeDialog(
    context: context,
    animType: AnimType.rightSlide,
    dialogType: DialogType.success,
    body: CustomMediaQuery(
      child: Container(
        height: _media.size.width*0.18,
        child: Column(
          children: [
          Center(
              child: Text(
                'لقد تم حفظ التعديل بنجاح ',
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


    Future<void> _setdata() async {
    final User? user = _auth.currentUser;
    if (user != null) {
      // Show a circular progress indicator while updating data
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        barrierDismissible: false,
      );

      // Update user data
      await _firestore.collection('users').doc(user.uid).set({
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
      });
    }}

  @override
  Widget build(BuildContext context) {
   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    var _media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor:hexToColor('#9C0945'),
      body: CustomMediaQuery(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
       

                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                         top: _media.size.width *0.1, ),
                      child: Center(
                        child: Text(
                          'ملفك الشخصي ',
                          style: TextStyle(
                             color: hexToColor('#ffffff'),
                            fontSize: _media.size.width * 0.09,
                            fontFamily: 'ReemKufi',
                          ),
                        ),
                      ),
                    ),
                   
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25)),
                      ),
                   margin: EdgeInsets.only(top: _media.size.width*0.3),
                      width: _media.size.width*1,
                      height: _media.size.width * 2,
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _isLoading 
                          ?  Center(child: Container(height: _media.size.width*0.5,width: _media.size.width*0.5,
                            child: LoadingAnimationWidget.hexagonDots(color: hexToColor('#9C0945'),size: _media.size.width *0.1)))
                          
                          
                          : Column(
                            children: [
                          
                    
                          SizedBox(height: _media.size.width * 0.03),
                          _isLoading
                              ? const Center(
                            child: CircularProgressIndicator(color: Colors.purpleAccent,),
                          )
                              : Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: _media.size.width * 0.06),
                            child: Container(                  height: _media.size.width*0.15,
                  width: _media.size.width*0.9,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 160, 160, 160),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: _media.size.width * 0.05),
                                child: Center(
                                  child: TextFormField(style: TextStyle(  fontSize: _media.size.width*0.042),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _nameController,
                                    decoration:  InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'الإسم ',
                                        labelStyle: TextStyle(
                                          fontFamily: 'Cairo',
                                          color: Colors.black,

                                          fontSize: _media.size.width*0.04
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: _media.size.width * 0.03),
                          _isLoading
                              ? const Center(
                            child:CircularProgressIndicator(color: Colors.purpleAccent,),
                          )
                              : Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: _media.size.width * 0.06),
                            child: Container(height: _media.size.width*0.15,
                  width: _media.size.width*0.9,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 160, 160, 160),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: _media.size.width * 0.05),
                                child: Center(
                                  child: TextFormField(
                                    style: TextStyle(  fontSize: _media.size.width*0.042),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _emailController,
                                    decoration:  InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'البريد الإلكتروني',
                                        labelStyle: TextStyle(
                                          fontFamily: 'Cairo',
                                          color: Colors.black,
                                           fontSize: _media.size.width*0.04
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: _media.size.width * 0.03),
                          _isLoading
                               ?const Center(
                            child: CircularProgressIndicator(color: Colors.purpleAccent,),
                          )
                              : Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: _media.size.width * 0.06),
                            child: Container(height: _media.size.width*0.15,
                  width: _media.size.width*0.9,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 160, 160, 160),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: _media.size.width * 0.03),
                                child: Center(
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    controller: _phoneController,
                                       style: TextStyle(  fontSize: _media.size.width*0.042),
                                    decoration:  InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'رقم الهاتف ',
                                        labelStyle: TextStyle(
                                          fontFamily: 'Cairo',
                                          color: Colors.black,
                                           fontSize: _media.size.width*0.04
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: _media.size.width * 0.05),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: _media.size.width * 0.06),
                                child: GestureDetector(
                                  onTap: () async {
                                    Future<bool> isConnected = checkConnectivity(); // Replace with your own logic

          if (await isConnected) {
            _updateUserData();
            _setdata();
          } else {
            // If not connected, show a message
            showDisconnectedMessage();
          }
        
                                  },
                                  child: Container(
                                    height: _media.size.width * 0.15,
                                    decoration: BoxDecoration(
                                        color: hexToColor('#9C0945'),
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: _media.size.width * 0.03),
                                            child: Text(
                                              'أحفظ التعديل ',
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color: hexToColor('#ffffff'),
                                             
                                                  fontSize: _media.size.width * 0.05,
                                                 ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: _media.size.width * 0.03),
                                            child:  Icon(
                                              Icons.check,
                                           color:  hexToColor('#ffffff'),
                                              size: _media.size.width * 0.05,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                           SizedBox(height: _media.size.width * 0.03),
                               Padding(
                                 padding: EdgeInsets.symmetric(
                                     horizontal: _media.size.width * 0.06),
                                 child: GestureDetector(
                                   onTap: () {
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => check_oreder()));
                                   },
                                   child: Container(
                                     height: _media.size.width * 0.15,
                                     decoration: BoxDecoration(
                                      color: hexToColor('#9C0945'),
                                         borderRadius: BorderRadius.circular(20)),
                                     child: Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Padding(
                                             padding: EdgeInsets.symmetric(
                                                 horizontal: _media.size.width * 0.03),
                                             child: Text(
                                               'تتبع حالة الطلب ',
                                               style: TextStyle(
                                                   fontFamily: 'Cairo',
                                                    color:  hexToColor('#ffffff'),
                                                   fontSize: _media.size.width * 0.05,
                                                  ),
                                             ),
                                           ),
                                           Padding(
                                             padding: EdgeInsets.symmetric(
                                                 horizontal: _media.size.width * 0.03),
                                             child:  Icon(
                                               Icons.calendar_today,
                                               color:  hexToColor('#ffffff'),    size: _media.size.width * 0.05,
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
      
                          SizedBox(height: _media.size.width * 0.03),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _media.size.width * 0.06),
                            child: GestureDetector(
                              onTap: () {
                                launch('mailto:7arir.store@gmail.com?'
                                    'subject=اقترح الأفضل لمتجر حرير ');
                              },
                              child: Container(
                                height: _media.size.width * 0.15,
                                decoration: BoxDecoration(
                                   color: hexToColor('#9C0945'),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: _media.size.width * 0.03),
                                        child: Text(
                                          'اقترح رأيك',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                               color: hexToColor('#ffffff'),
                                              fontSize: _media.size.width * 0.05,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: _media.size.width * 0.03),
                                        child:  Icon(
                                          Icons.mail,
                                           color: hexToColor('#ffffff'),   size: _media.size.width * 0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: _media.size.width * 0.03),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _media.size.width * 0.06),
                            child: GestureDetector(
                              onTap: () {
                                launch('tel:0792859580');
                              },
                              child: Container(
                                height: _media.size.width * 0.15,
                                decoration: BoxDecoration(
                                  color: hexToColor('#9C0945'),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: _media.size.width * 0.03),
                                        child:  Text(
                                          'اتصل بنا ',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: hexToColor('#ffffff'),
                                              fontSize: _media.size.width *0.05,
                                             ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: _media.size.width * 0.03),
                                        child:  Icon(
                                          Icons.phone,
                                          color: hexToColor('#ffffff'),    size: _media.size.width * 0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                             SizedBox(height: _media.size.width*0.03,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: _media.size.width*0.06),
                          child: GestureDetector(
                            onTap: () {
                         _signOut();
                         signOutFromGoogle();

                            },
                            child: Container(
                              height: _media.size.width *0.15,
                              decoration: BoxDecoration(
                            color: hexToColor('#9C0945'),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: _media.size.width *0.03),
                                      child:  Text(
                                        ' سجل خروجك ',
                                        style: TextStyle(fontFamily: 'Cairo', color: hexToColor('#ffffff'), 
                                        fontSize: _media.size.width *0.05,),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: _media.size.width *0.03),
                                      child:Icon(
                                        Icons.logout,
                                        color: hexToColor('#ffffff'),    size: _media.size.width * 0.05,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                          SizedBox(height: _media.size.width * 0.03),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _media.size.width * 0.06),
                            child: GestureDetector(
                              onTap: () {
                                _confirmDeleteAccount();
                              },
                              child: Container(
                                height: _media.size.width * 0.15,
                                decoration: BoxDecoration(
                                    color: hexToColor('#9C0945'),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: _media.size.width * 0.03),
                                        child:  Text(
                                          'احذف حسابك ',
                                          style: TextStyle(
                                              fontFamily: 'cairo',
                                              color: hexToColor('#ffffff'),
                                              fontSize: _media.size.width *0.05,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: _media.size.width * 0.03),
                                        child: Icon(
                                          Icons.delete,
                                          color: hexToColor('#ffffff') ,
                                             size: _media.size.width * 0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        //  Container(height: _media.size.width * 0.05,color: Colors.amber,),\
                        SizedBox(height: _media.size.width*.03,),
                           Center(child: Text('تابعنا او تواصل معنا على ',style: TextStyle(fontFamily: 'Cariro',fontSize: _media.size.width*0.05,fontWeight: FontWeight.w300),)),
                        SizedBox(height: _media.size.width*0.03,),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                            
                              GestureDetector(
                                 onTap: () {_launchInstagram();},
                                child: Container(height: _media.size.width*0.15,width: _media.size.width*0.15,
                                  child: CircleAvatar(backgroundImage: AssetImage('images/Instagram_icon.png'),)),  ),




  SizedBox(width: _media.size.width*0.02,),
                              


                                  GestureDetector(   onTap: () {_launchFacebookPage(); },
                                    child: Container(height: _media.size.width*0.15,width: _media.size.width*0.17,
                                  child: CircleAvatar(backgroundImage: AssetImage('images/facebook.jpg'),)), ),





  SizedBox(width: _media.size.width*0.02,),




                                  GestureDetector(      onTap: () { _launchTikTokPage();},
                                    child: Container(height: _media.size.width*0.15,width: _media.size.width*0.15,
                                    child: CircleAvatar(backgroundImage: AssetImage('images/tiktoik.png'),)),),



                                //    SizedBox(width: _media.size.width*0.01,),




                                  GestureDetector(      onTap: () {launch('whatsapp://send?phone=+962792859580'); },
                                    child: Container(height: _media.size.width*0.15,width: _media.size.width*0.22,
                                    child: CircleAvatar(backgroundImage: AssetImage('images/whatssapp.jpg',),)),)




                                    //images\whatsapp.png
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
  
              ],
            ),
          ),
        ),
      ),
    );
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

    _launchFacebookPage() async {
    const url = 'https://www.facebook.com/profile.php?id=61558783499321&mibextid=ZbWKwL/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
    _launchTikTokPage() async {
    final url = Uri.parse('https://www.tiktok.com/@7arirstore?_t=8lkPSsqQHJ3&_r=1');
    if (await canLaunchUrl(url)) {
      await launchUrl(url); // Try launching the Instagram app first
    } else {
      await launchUrl(url, ); // Fallback to web browser
    }
  }
    Future<void> _launchInstagram() async {
    final url = Uri.parse('https://www.instagram.com/7arir.store?igsh=amkwb29rY2d2bTN2/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url); // Try launching the Instagram app first
    } else {
      await launchUrl(url, ); // Fallback to web browser
    }
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

