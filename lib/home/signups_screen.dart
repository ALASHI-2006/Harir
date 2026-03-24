import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:harir/home/loginscreen.dart';
import 'package:harir/shalat/details.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _yourName = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _yourphonenumber = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final myKey = GlobalKey<FormState>();
  static final RegExp nameRegex = RegExp(r"^[a-zA-Z\u0600-\u06FF ]+$");
  static final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool showPassword = false;
  bool _signingUp = false;
  bool _showSnackbar1 = false; // Flag to show the Snackbar
  final _snackbarDuration = const Duration(seconds: 5);
  bool _isPrivacyPolicyAccepted = true;
  final user = FirebaseAuth.instance.currentUser;
  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void showSnackbar(String message) {
    var _media = MediaQuery.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: hexToColor('#9C0945'),
        content: CustomMediaQuery(
            child: Text(
          message,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              fontSize: _media.size.width * 0.04),
        )),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
  }

  void showPrivacyPolicyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PrivacyPolicyPage();
      },
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

  Future<void> signUp() async {
    setState(() {
      _signingUp = true;
    });

    try {
      // Check if the email already exists
      var userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Send email verification link
      await userCredential.user!.sendEmailVerification();

      // Reset the signup state
      setState(() {
        _signingUp = false;
      });

      // Show the email verification dialog
      showEmailVerificationDialog();
    } catch (e) {
      // Reset the signup state
      setState(() {
        _signingUp = false;
      });

      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );

          // Check if the email is verified
          if (user.user!.emailVerified) {
            showEmailalreadtused();
          } else {
            // The user exists but is not verified, show the not verified dialog
            //_showNotVerifiedDialog();
            showEmailVerificationDialog();
          }
        } else {
          // Handle other Firebase Authentication errors if needed
          showCustomDialog(
            context,
            "خطأ في التسجيل",
            "حدث خطأ أثناء تسجيل البريد الإلكتروني. يرجى المحاولة مرة أخرى.",
          );
        }
      }
    }
  }

  void showEmailVerificationDialog() async {
    final _media = MediaQuery.of(context);
    await AwesomeDialog(
      context: context,
      animType: AnimType.rightSlide,
      dialogType: DialogType.success,
      body: CustomMediaQuery(
        child: Container(
          height: _media.size.width * 0.8,
          child: Column(
            children: [
              Center(
                child: Text(
                  'لقد تم إرسال رسالة تحقق إلى بريدك الإلكتروني ',
                  style: TextStyle(
                      fontFamily: 'Cairo', fontSize: _media.size.width * 0.045),
                ),
              ),
              SizedBox(
                height: _media.size.width * 0.05,
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      launch("https://mail.google.com/mail/u/0/#inbox");
                    },
                    child: Text(
                      'الذهاب إلى البريد الإلكتروني ',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          fontSize: _media.size.width * 0.04),
                    ),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(_media.size.width * 0.6, _media.size.width * 0.15),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(hexToColor('#9C0945')),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                    height: 10,
                  ), // Adjust spacing between buttons
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      openLoginScreen();
                    },
                    child: Text(
                      'لقد قمت بالتحقق بالفعل',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          fontSize: _media.size.width * 0.04),
                    ),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(_media.size.width * 0.6, _media.size.width * 0.15),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(hexToColor('#9C0945')),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                    height: 10,
                  ), // Adjust spacing between buttons
                  TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop(); // Close the dialog
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: hexToColor('#9C0945'),
                          content: CustomMediaQuery(
                              child: Text(
                            'لقد تم إعادة إرسال رسالة التحقق',
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                color: Colors.white,
                                fontSize: _media.size.width * 0.04),
                          )),
                          duration: Duration(
                              seconds: 3), // Adjust the duration as needed
                        ),
                      );
                      final user = FirebaseAuth.instance.currentUser;
                      await user!.sendEmailVerification(); // Close the dialog
                    },
                    child: Text(
                      'إعادة إرسال رسالة التحقق',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          fontSize: _media.size.width * 0.04),
                    ),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(_media.size.width * 0.6, _media.size.width * 0.15),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(hexToColor('#9C0945')),
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

  void showEmailalreadtused() async {
    final _media = MediaQuery.of(context);
    await AwesomeDialog(
      context: context,
      animType: AnimType.rightSlide,
      dialogType: DialogType.info,
      body: CustomMediaQuery(
        child: Container(
          height: _media.size.width * 0.75,
          child: Column(
            children: [
              Center(
                child: Text(
                  'البريد الإلكتروني مستخدم بالفعل ',
                  style: TextStyle(
                      fontFamily: 'Cairo', fontSize: _media.size.width * 0.045),
                ),
              ),
              SizedBox(
                height: _media.size.width * 0.05,
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'لقد فهمت ذلك ',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          fontSize: _media.size.width * 0.04),
                    ),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(_media.size.width * 0.6, _media.size.width * 0.15),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(hexToColor('#9C0945')),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                    height: 10,
                  ), // Adjust spacing between buttons
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      openLoginScreen();
                    },
                    child: Text(
                      'الذهاب  لتسجيل الدخول',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          fontSize: _media.size.width * 0.04),
                    ),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(_media.size.width * 0.6, _media.size.width * 0.15),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(hexToColor('#9C0945')),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                    height: 10,
                  ), // Adjust spacing between buttons
                  TextButton(
                    onPressed: resetPassword,
                    child: Text(
                      'تغير كلمة المرور ',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          fontSize: _media.size.width * 0.04),
                    ),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(_media.size.width * 0.6, _media.size.width * 0.15),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(hexToColor('#9C0945')),
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

  void showEmailResentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomMediaQuery(
          child: AlertDialog(
            title: const Text(
              "تم إعادة إرسال البريد الإلكتروني",
              style: TextStyle(
                fontFamily: 'Cairo',
              ),
            ),
            content:
                const Text("تم إعادة إرسال رابط التحقق إلى بريدك الإلكتروني."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text("موافق"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showNotVerifiedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomMediaQuery(
          child: AlertDialog(
            title: const Text("لم يتم التحقق من البريد الإلكتروني"),
            content: const Text(
              "لقد تم إدخال معلوماتك بالفعل و لك لم يتم التحقق من البريد الإلكتروني الرجاء التحقق من البريد عن طريق الضغط على  الرابط المرسل إلى بريدك الإلكروني",
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  final user = _auth.currentUser;
                  if (user != null) {
                    await user.sendEmailVerification();
                    Navigator.of(context).pop(); // Close the dialog
                    _showSnackbar(
                        "تم إعادة إرسال رسالة التحقق إلى بريدك الإلكتروني.");
                  }
                },
                child: const Text("إعادة إرسال"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text("موافق"),
              ),
            ],
          ),
        );
      },
    );
  }

  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  Future<void> showCustomDialog(
      BuildContext context, String title, String content) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomMediaQuery(
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: hexToColor('#9C0945'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      "موافق",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  void dispose() {
    super.dispose();
    _yourName.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void showArabicSnackbar(context, String message) {
    if (!_showSnackbar1) {
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
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Form(
        key: myKey,
        child: SafeArea(
          child: Center(
            child: CustomMediaQuery(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'متجر حرير ',
                      style: TextStyle(
                        fontFamily: 'ReemKufi',
                        fontSize: _media.size.width * 0.16,
                        fontWeight: FontWeight.bold,
                        color: hexToColor('#9C0945'),
                      ),
                    ),
                    SizedBox(height: _media.size.width * 0.15),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _media.size.width * 0.03),
                      child: Container(
                        height: _media.size.width * 0.22,
                        width: _media.size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: _media.size.width * 0.02),
                          child: Center(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  //showArabicSnackbar(context, 'يجب عليك كتابة اسمك ');
                                  return 'يجب عليك كتابة اسمك ';

                                  //'يجب عليك كتابة الايميل';
                                } else if (!nameRegex.hasMatch(value)) {
                                  showArabicSnackbar(
                                      context, 'اكتب اسمك بشكل صحيح');
                                  return '';
                                  // 'اكتب البريد الإلكتروني بشكل صحيح';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                              controller: _yourName,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.abc),
                                  border: OutlineInputBorder(),
                                  hintText: 'الإسم ',
                                  labelText: 'الإسم',
                                  labelStyle: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.black,
                                    fontSize: _media.size.width * 0.043,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: _media.size.width * 0.015),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _media.size.width * 0.03),
                      child: Container(
                        height: _media.size.width * 0.22,
                        width: _media.size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: _media.size.width * 0.02),
                          child: Center(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  showArabicSnackbar(
                                      context, 'يجب عليك كتابة الايميل');
                                  return '';
                                  //'يجب عليك كتابة الايميل';
                                } else if (!emailRegex.hasMatch(value)) {
                                  showArabicSnackbar(context,
                                      'اكتب البريد الإلكتروني بشكل صحيح');
                                  return '';
                                  // 'اكتب البريد الإلكتروني بشكل صحيح';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      fontSize: _media.size.width *
                                          0.000000000000000000000000001),
                                  suffixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(),
                                  hintText: 'البريد الإلكتروني ',
                                  labelText: 'البريد الإلكتروني ',
                                  labelStyle: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.black,
                                    fontSize: _media.size.width * 0.043,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _media.size.width * 0.015,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: _media.size.width * 0.03),
                        child: Container(
                          height: _media.size.width * 0.22,
                          width: _media.size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _media.size.width * 0.02),
                            child: Center(
                              child: Center(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      showArabicSnackbar(context,
                                          "يجب عليك كتابة كلمة المرور");
                                      return '';
                                      //  return "يجب عليك كتابة كلمة المرور";
                                    } else if (value.length < 6) {
                                      showArabicSnackbar(context,
                                          "يجب أن تكون كلمة المرور اكثر من 5 رموز");
                                      return '';
                                      // return "يجب أن تكون كلمة المرور اكثر من 5 رموز";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: _passwordController,
                                  obscureText: !showPassword,
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                        fontSize: _media.size.width *
                                            0.000000000000000000000000001),
                                    border: OutlineInputBorder(),
                                    hintText: 'كلمة المرور ',
                                    labelText: 'كلمة المرور',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.black,
                                      fontSize: _media.size.width * 0.043,
                                    ),
                                    suffixIcon: SizedBox(
                                      height: _media.size.width * 0.075,
                                      child: IconButton(
                                          onPressed: togglePasswordVisibility,
                                          icon: Icon(
                                            showPassword
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            // color: hexToColor('#9C0945'),
                                            size: _media.size.width * 0.06,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: _media.size.width * 0.015,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _media.size.width * 0.03),
                      child: Container(
                        height: _media.size.width * 0.22,
                        width: _media.size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: _media.size.width * 0.02),
                          child: Center(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  showArabicSnackbar(
                                      context, "يجب عليك كتابة الرقم الهاتف");
                                  return '';

                                  // return "يجب عليك كتابة الرقم الهاتف";
                                } else if (value.length < 10) {
                                  showArabicSnackbar(context,
                                      " يجب أن يكون رقم الهاتف من 10 ارقام ");
                                  return '';
                                  // return " يجب أن يكون رقم الهاتف من 10 ارقام ";
                                } else if (value.length > 10) {
                                  showArabicSnackbar(context,
                                      " يجب أن يكون رقم الهاتف من 10 ارقام ");
                                  return '';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              controller: _yourphonenumber,
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      fontSize: _media.size.width *
                                          0.000000000000000000000000001),
                                  suffixIcon: Icon(Icons.phone),
                                  border: OutlineInputBorder(),
                                  hintText: 'رقم الهاتف',
                                  labelText: 'رقم الهاتف',
                                  labelStyle: TextStyle(
                                    fontFamily: 'Cairo',
                                    color: Colors.black,
                                    fontSize: _media.size.width * 0.043,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                    !_isPrivacyPolicyAccepted
                        ? Padding(
                            padding: EdgeInsets.only(
                              top: _media.size.width * 0.03,
                            ),
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: hexToColor('#9C0945'),
                                size: _media.size.width * 0.1))
                        : Column(children: [
                            SizedBox(
                              height: _media.size.width * 0.035,
                            ),
                            _signingUp
                                ? CircularProgressIndicator() // Show progress indicator
                                : ElevatedButton(
                                    onPressed: () async {
                                      Future<bool> isConnected =
                                          checkConnectivity();

                                      if (await isConnected == false) {
                                        return showDisconnectedMessage();
                                      }

                                      if (myKey.currentState!.validate() &&
                                          await isConnected) {
                                        await signUp();
                                        final userCollection = FirebaseFirestore
                                            .instance
                                            .collection('users');
                                        final newUser = {
                                          'name': _yourName.text.trim(),
                                          'email': _emailController.text.trim(),
                                          'phone': _yourphonenumber.text.trim(),
                                        };
                                        final user =
                                            FirebaseAuth.instance.currentUser;
                                        if (user != null) {
                                          await userCollection
                                              .doc(user.uid)
                                              .set(newUser);
                                        }
                                        if (user != null) {
                                          await user.sendEmailVerification();
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: hexToColor('#9C0945'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: _media.size.width * 0.035,
                                          horizontal:
                                              _media.size.width * 0.053),
                                      minimumSize: Size(_media.size.width * .87,
                                          _media.size.width * .1),
                                    ),
                                    child: Text(
                                      "سجل الان",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: _media.size.width * 0.05,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                          ]),
                    SizedBox(
                      height: _media.size.width * 0.03,
                    ),
                    GestureDetector(
                      onTap: openLoginScreen,
                      child: Text(
                        'لدي حساب بالفعل',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          color: hexToColor('#9C0945'),
                          fontSize: _media.size.width * 0.036,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _media.size.width * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void openLoginScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  void showDisconnectedMessage() {
    var _media = MediaQuery.of(context);
    AwesomeDialog(
      context: context,
      animType: AnimType.rightSlide,
      dialogType: DialogType.error,
      body: CustomMediaQuery(
        child: Container(
          height: _media.size.width * 0.18,
          child: Column(
            children: [
              Center(
                child: Text(
                  'تحقق من اتصالك بالشبكة ',
                  style: TextStyle(
                      fontFamily: 'Cairo', fontSize: _media.size.width * 0.06),
                ),
              ),
              SizedBox(
                height: _media.size.width * 0.05,
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
}

class CustomTextFiled extends StatefulWidget {
  const CustomTextFiled({
    Key? key,
    this.focusNode,
    required this.fillColor,
    required this.focusColor,
    // add whaterver properties that your textfield needs. like controller and ..
  }) : super(key: key);

  final FocusNode? focusNode;
  final Color focusColor;
  final Color fillColor;

  @override
  _CustomTextFiledState createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: focusNode.hasFocus ? widget.focusColor : widget.fillColor,
      ),
    );
  }
}
