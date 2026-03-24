
// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:harir/mkmlat/slider.dart';
import 'package:harir/other/check_oreder.dart';
import 'package:harir/shalat/details.dart';
import 'package:harir/shalat/slider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shalat/product.dart';
import 'bottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String orederState = 'قيد التنفيذ';
  String selectedCity = 'إربد'; // Selected city from dropdown
  String currentLocation = ''; // User's live location
  //String selectedPaymentOption = ''; // Initialize it at the beginnin
  String selectedPaymentOption ='الدفع عند الإستلام ';
  bool isLocationEmpty = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
    Future<bool> _onWillPop() async {
    // Handle the back button press here
    // You can navigate to the home screen or show a confirmation dialog
    // For now, I'll navigate to the HomeScreen
   
  Navigator.pushReplacement(
      context,
     MaterialPageRoute(builder: (context) => const BottomNavigationBarWidget()),);

    // Return false to prevent the default behavior (pop)
    return false;
  }

List<String> jordanCities = [
  'عمان',
  'الزرقاء',
  'إربد',
  'الرصيفة',
  'وادي السير',
  'عجلون',
  'العقبة',
  'مادبا',
  'المفرق',
  'جرش',
  'الطفيلة',
  'الكرك',
  'معان',
  'السلط',
];



 @override
  void initState() {
    super.initState();
    _loadUserData();
  }

 Future<void> _loadUserData() async {
    final User? user = _auth.currentUser;
    if (user != null) {
   

      final DocumentSnapshot userData =
          await _firestore.collection('users').doc(user.uid).get();

      setState(() {
    
        _nameController.text = userData['name'];
        _emailController.text = userData['email'];
        _phoneController.text = userData['phone'];
      });
    }
  }

  Future<void> _updateUserData() async {
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
      await _firestore.collection('users').doc(user.uid).update({
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
      });

      // Dismiss the circular progress indicator dialog
      Navigator.of(context, rootNavigator: true).pop();

      // Show an Awesome Dialog indicating successful edit
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        // ignore: deprecated_member_use
        animType: AnimType.scale,
        headerAnimationLoop: false,
        title: 'تم التعديل بنجاح!',
        desc: 'تم حفظ التغييرات بنجاح.',
      ).show();
    }
  }
    Map<String, String> colorImageMapping = {
      //////////////////////////////////////////////gorget//////////////////////////////////////////////////////
  hexToColor('#FFFFFF').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fgorget.white.png?alt=media&token=84cf5a0f-8047-41ed-bcf4-f638e2f8b5fd',
  hexToColor('#654321').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fbrown.jpg?alt=media&token=259a6f81-50cd-4b2e-8136-350371ebcffa',
  hexToColor('#121121').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fdarkblue.jpg?alt=media&token=db4c3d08-469e-4152-8e92-9cfc39fe6872',
  hexToColor('#302011').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fbani.jpg?alt=media&token=6920c245-5a7c-494b-816f-548b3184695b',
  hexToColor('#C08FA4').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fbink.jpg?alt=media&token=5e2bc7c7-43b6-47c0-8b89-f6b5bb290751',
  hexToColor('#808080').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Framadefateh.jpg?alt=media&token=564f71c6-fe86-4b05-b914-7d20a4f4c058',
  hexToColor('#303139').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Framde3amek.jpg?alt=media&token=35bb3de2-4d72-4a2e-ad5d-6cd5d9a380c1',
  hexToColor('#000000').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fblack.jpeg?alt=media&token=4e688233-4961-43d5-9f3c-748baa691fd6',
  hexToColor('#61152B').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fred.jpg?alt=media&token=9d12b473-aac0-4739-89d2-818c8bc4960b',
  hexToColor('#002D27').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fgraeeeennnn.jpg?alt=media&token=b63fddaf-9a55-4486-bee4-f04a25cc0c63',
  hexToColor('#AD885A').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2F3saled.jpg?alt=media&token=9abdf81b-2753-4557-9f4a-f124095c7919',
  hexToColor('#39506C').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fbluee.jpg?alt=media&token=afdeec47-8fec-47b1-a2a4-d0b8832002c6',
  hexToColor('#584232').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fcapik.jpg?alt=media&token=fc8f8db4-a510-43bf-8990-6087cc0a8b38',
  hexToColor('#182013').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fdarkgraen.jpg?alt=media&token=732d8b98-7a49-421d-b82f-2672fd77ec0d',
  hexToColor('#747B5D').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fgraengggg.jpg?alt=media&token=012b8e68-56c7-4833-b6f2-a59c152c992b',
  hexToColor('#1D1B4E').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fnile.jpg?alt=media&token=123ff07d-8e16-4cdc-8dfd-7870b08b42c5',
  hexToColor('#4F333F').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fnood.jpg?alt=media&token=b6cf089a-6d53-418c-aa67-1dffec48114c',
  hexToColor('#322517').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fbraonjjj.jpg?alt=media&token=945deb64-e0d0-447a-9c82-7297adf80c4d',
  hexToColor('#75585A').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fnoodd.jpg?alt=media&token=dad29469-dabc-45d9-8560-26653c72bd36',
  hexToColor('#B78C6E').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fpigj.jpg?alt=media&token=7643e3dc-4644-42d0-b84c-08a71a673e32',
  hexToColor('#31121B').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2F5amre.jpg?alt=media&token=aa6a87da-c74f-4598-a8b8-3a449f43669f',
  ////////////////////////////////////////////////////shifon//////////////////////////////////////////////////////////////2b142f
  hexToColor('#628574').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_00_IMG_8033.JPG?alt=media&token=0ae7f133-4e23-42c0-b14c-675aa6d075b0',
  hexToColor('#986081').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_04_IMG_8035.JPG?alt=media&token=d16d1599-832e-4514-9ea5-c3db941dc18d',
  hexToColor('#657bad').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_08_IMG_8036.JPG?alt=media&token=eaff3c98-da26-4aef-bba6-9d938c7fdba2',
  hexToColor('#2b142f').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_12_IMG_8037.JPG?alt=media&token=29b7ff7b-b23a-44ad-bb9e-550862ef7a8d',
  hexToColor('#5c4671').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_16_IMG_8038.JPG?alt=media&token=33c080f4-8977-4939-bffe-6314621f13be',
  hexToColor('#bc9093').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_19_IMG_8039.JPG?alt=media&token=6efd9924-8a71-4f30-976d-307d71edf971',
  hexToColor('#827565').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_23_IMG_8040.JPG?alt=media&token=dfd4be86-62da-43dd-8b89-28462576c43e',
  hexToColor('#7d5d64').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_26_IMG_8041.JPG?alt=media&token=3b99a7c1-2590-4dc3-8345-15c0e50319c3',
  hexToColor('#2f3a23').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_35_IMG_8042.JPG?alt=media&token=71fef8e8-ebcb-49e4-8198-9b12c0c42e22',
  hexToColor('#3a394a').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_40_IMG_8043.JPG?alt=media&token=74dfddf6-060f-4e28-8a0c-811accfd22e4',
  hexToColor('#ab9683').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_45_IMG_8044.JPG?alt=media&token=706ff6c0-6eae-4a01-9f8f-7f37e12b9301',
  hexToColor('#5d3a2c').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_04_IMG_8045.JPG?alt=media&token=f441a68f-06f0-4beb-8f7e-6848b5996848',
  hexToColor('#4b5750').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_07_IMG_8046.JPG?alt=media&token=8710735d-e966-406a-b09e-585679cb3335',
  hexToColor('#947e93').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_09_IMG_8047.JPG?alt=media&token=63978b08-b5cc-4d59-8564-48d967c6118e',
  hexToColor('#161d31').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_13_IMG_8048.JPG?alt=media&token=b8c7b0fa-75e4-4683-a252-7b45c9c07cd0',
  hexToColor('#32142b').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_17_IMG_8049.JPG?alt=media&token=9c919572-b473-4e87-a855-1f653825879f',
  hexToColor('#967071').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_24_IMG_8050.JPG?alt=media&token=68db8c63-fa1f-4486-8a91-f2c17b824751',
  hexToColor('#050505').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_28_IMG_8051.JPG?alt=media&token=eb63352a-579d-4992-ab94-e80362df2e34',
  hexToColor('#cdc4b9').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_31_IMG_8052.JPG?alt=media&token=a04f09ec-292e-48d6-b561-3a0eb0eff586',
  hexToColor('#f0effe').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_36_IMG_8054.JPG?alt=media&token=a101e3c1-15a0-4141-a6e1-056d59183cf7',
  hexToColor('#746478').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_40_IMG_8056.JPG?alt=media&token=5b17f1ba-9581-4d3b-9a05-72c491be8e0a',
  ///////////////////////////////////////////////////////cotton kwaite/////////////////////////////////////////////
  hexToColor('#afa795').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_30_IMG_7236.JPG?alt=media&token=a01ee3dd-9815-4ef2-bf8e-dd0eb4e5e108',
  hexToColor('#8f8583').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_33_IMG_7237.JPG?alt=media&token=f43f7683-d86e-4317-a58c-f55724ecb844',
  hexToColor('#b0b0ae').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_37_IMG_7238.JPG?alt=media&token=973a8574-3d18-4f57-8d92-3f2afb160c6d',
  hexToColor('#9a867b').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_39_IMG_7240.JPG?alt=media&token=ea0fb372-1755-47ae-a352-a1288d7f8840',
  hexToColor('#918a80').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_41_IMG_7242.JPG?alt=media&token=8228ed0b-7620-4879-9cf5-9ea9e70c2355',
  hexToColor('#0f1014').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_44_IMG_7245.JPG?alt=media&token=4fc33b35-d7c0-4263-94bd-dec18ef7d8a2',
  hexToColor('#f2f3f8').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_46_IMG_7247.JPG?alt=media&token=dfe73a50-5f4a-493a-996d-ab884d3e56c2',
  hexToColor('#65605a').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_48_IMG_7251.JPG?alt=media&token=2ccd3a7b-c6e5-417a-9625-3ee0d68fcdb9',
  hexToColor('#867267').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_51_IMG_7255.JPG?alt=media&token=c4c8913a-4384-453f-983e-ec6240ef6502',
  hexToColor('#6d524b').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_53_IMG_7257.JPG?alt=media&token=6f37fc19-228d-4385-9f24-f964521444eb',
 //////////////////////////////////////////////////////////////gluter///////////////////////////////////////////////////////////////////////////////
  hexToColor('#887a58').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fbeg%20gamek.JPG?alt=media&token=af7d0b97-76ca-4101-a478-81ef83eaa609',
  hexToColor('#94806c').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fbeg.JPG?alt=media&token=a8610e63-a93d-4a6f-87fc-d2da94d927f8',
  hexToColor('#020202').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fblack.JPG?alt=media&token=184cda3a-afda-44c5-b8e6-b4353e61fc12',
  hexToColor('#5c4e4a').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fnahdi.JPG?alt=media&token=dc061046-86c8-49d1-b922-c130b51d4ae8',
  hexToColor('#8b6c64').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fpink.JPG?alt=media&token=9df5e69b-f856-463b-9964-91ac987148eb',
  hexToColor('#ececec').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fwhite.JPG?alt=media&token=a1c45cd1-6921-4c88-8494-cfcf91d34d71',
   ////////////////////////////////////////////////////////////////coton liner ///////////////////////////////////////////////////////////////////////////////
  hexToColor('#b4ab9a').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_35_IMG_7975.JPG?alt=media&token=7e31f06b-4ab0-4207-8545-06873629458b',
  hexToColor('#7e7a70').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_37_IMG_7976.JPG?alt=media&token=59743e44-17b8-4957-9ac7-3e8c1b5fef6a',
  hexToColor('#574636').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_41_IMG_7977.JPG?alt=media&token=8cc20d4a-6dd2-48d1-a05a-57d6b80b95dc'
 ,hexToColor('#896c58').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_44_IMG_7978.JPG?alt=media&token=0f8bfbb8-03e2-41c9-a789-d1ad012a7fc0',
  hexToColor('#886d67').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_47_IMG_7979.JPG?alt=media&token=8cbfc122-50fd-4f30-8076-3a56a8bb2861',
  hexToColor('#80576c').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_51_IMG_7980.JPG?alt=media&token=8c8802da-2f30-4172-be5f-208b0c7da21f',
  hexToColor('#fffffc').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_55_IMG_7982.JPG?alt=media&token=3b6538d5-9127-4c8c-88b8-fb7e1e4f09d2',
  hexToColor('#7d867e').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_23_00_IMG_7984.JPG?alt=media&token=99225d51-79cc-46ef-99ca-25a03e3dec55',
  hexToColor('#50545d').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_23_08_IMG_7986.JPG?alt=media&token=23b45f89-fca0-4733-8277-6b0ac36e3285',
  hexToColor('#a27676').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2Fliner%20coton%20pink.JPG?alt=media&token=617cff14-d1fa-454b-b874-09a2317b3b2a',
  ////////////////////////////////////////////////////////////stras/////////////////////////////////////////////////////////////////////////////////// 
  hexToColor('#a48594').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_30_IMG_7961.JPG?alt=media&token=6af7c59a-1553-4a12-97e4-943df26398ca',
  hexToColor('#ac8b7f').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_34_IMG_7962.JPG?alt=media&token=92da722f-f891-438f-9529-9cd016b72d11',
  hexToColor('#b59f88').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_40_IMG_7963.JPG?alt=media&token=f5bc6b2a-5aa2-45ec-9a57-41852836679c',
  hexToColor('#9c8084').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_43_IMG_7965.JPG?alt=media&token=7c809c0f-13f7-4570-bd29-b81f4a88c820',
  hexToColor('#878da0').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_47_IMG_7966.JPG?alt=media&token=bc786486-f9fc-428f-a17f-cd4399bcd7ab',
  hexToColor('#fff9f2').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_59_IMG_7967.JPG?alt=media&token=445abc63-f02d-434c-ab6d-4e08ebedc076',
  hexToColor('#6a6b68').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_22_03_IMG_7969.JPG?alt=media&token=a98caaa8-e226-49d9-967e-2a33c167c879',
  hexToColor('#7b7461').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_22_05_IMG_7970.JPG?alt=media&token=d2dba9f5-744d-4c47-ac1d-4d3ce7a6ef46',
  //////////////////////////////////////////////////////////double_Strich//////////////////////////////////////////////////////////////////////
  hexToColor('#5d5946').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_14_IMG_7987.JPG?alt=media&token=f0f56383-dcf9-44fc-b13a-959b4593e337',
  hexToColor('#360f21').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_16_IMG_7988.JPG?alt=media&token=fbd87002-a731-4406-9da4-46e4461bbf2d',
  hexToColor('#674765').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_18_IMG_7989.JPG?alt=media&token=7018d4f2-b660-4f20-99b9-ce27b7ab1163',
  hexToColor('#fefffc').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_21_IMG_7992.JPG?alt=media&token=1b1d653e-d5fc-4512-9dab-ffb700c2f766',
  hexToColor('#6f777e').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_23_IMG_7993.JPG?alt=media&token=92afd321-32c1-48e8-baf5-33e0b4ecbb55',
  //////////////////////////////////////////////////////////satan//////////////////////////////////////////////////////////////
  hexToColor('#7e828c').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%2F2024_03_16_19_58_IMG_8092.JPG?alt=media&token=8ea85ba5-4547-4ae7-89f1-52afcb6f6167',
  hexToColor('#9d866e').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%2F2024_03_16_20_02_IMG_8094.JPG?alt=media&token=709f7b3b-9420-48cb-8ac7-951db23fdbbe',
  hexToColor('#575d60').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%2F2024_03_16_20_04_IMG_8095.JPG?alt=media&token=481c2430-571f-483f-ac64-2154dc563931',
  ////////////////////////////////////////////////////////swarih////////////////////////////////////////////////////////////////////////////
  hexToColor('#010101').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/swarih%2F2024_03_16_19_49_IMG_8087.JPG?alt=media&token=96e473a4-d98f-4f2b-8d4d-cb81ed2b5bba',
  hexToColor('#fff5f0').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/swarih%2F2024_03_16_19_52_IMG_8089.JPG?alt=media&token=2c568fad-1674-4993-abdf-ff638ff32498',
  hexToColor('#ad9586').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/swarih%2F2024_03_16_19_55_IMG_8091.JPG?alt=media&token=4e0bff75-4633-4d89-9335-bd3af55fb17d',
  /////////////////////////////////////////////////////////////////////shifon_motraz//////////////////////////////
  hexToColor('#fff7fb').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon_motaraz%2F2024_03_16_19_35_IMG_8083.JPG?alt=media&token=e1e2b244-95cf-4e7b-8aa3-e0698a577adc',
  hexToColor('#b29781').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon_motaraz%2F2024_03_16_19_39_IMG_8084.JPG?alt=media&token=ac2101d1-a18f-4944-bebf-e35da64b2eb4',
  hexToColor('#855668').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon_motaraz%2F2024_03_16_19_43_IMG_8085.JPG?alt=media&token=3f16c812-7c7d-4121-b32c-e170f2cd9015',
  hexToColor('#020202').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon_motaraz%2F2024_03_16_19_45_IMG_8086.JPG?alt=media&token=94225fbb-1061-4c52-b26f-1347d7d02bf8',
  ///////////////////////////////////////////////////////////////kashmir//////////////////////////////////////////////////
  hexToColor('#9f8872').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kashmir%2F2024_03_08_21_00_IMG_7873.JPG?alt=media&token=8f725fa0-7523-42d3-9cdc-2bea93a151af',
  hexToColor('#81603e').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kashmir%2F2024_03_08_21_06_IMG_7875.JPG?alt=media&token=f73ef8ca-7164-4b55-ab21-f14339d496a7',
  hexToColor('#b29374').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kashmir%2F2024_03_08_21_18_IMG_7876.JPG?alt=media&token=4a727ad0-e3a3-4208-b58d-c70152eb7901',
  hexToColor('#6a6b71').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kashmir%2F2024_03_08_21_23_IMG_7877.JPG?alt=media&token=318e5671-35e0-420d-b9c7-c6c0103d094e',
  ///////////////////////////////////////////////////likra_mojakr/////////////////////////////////////////////////////////////////////////////////
  hexToColor('#9b7881').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_09_IMG_7544.JPG?alt=media&token=2e3b7a0b-3e6f-40bd-af09-629258e59c65',
  hexToColor('#b2aa9d').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_11_IMG_7545.JPG?alt=media&token=358e201f-1959-4c63-93c6-a189e8623ca4',
  hexToColor('#fcfbff').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_13_IMG_7546.JPG?alt=media&token=e06aad6f-d2ef-4bcc-954d-e34fc2c5b2ca',
  hexToColor('#6f6559').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_16_IMG_7547.JPG?alt=media&token=88f52057-cf6d-4082-a887-93f62366d521',
  hexToColor('#90867a').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_20_IMG_7548.JPG?alt=media&token=418d75b8-7bc3-445f-b388-0f2a30fa7383',
  hexToColor('#62614d').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_24_IMG_7549.JPG?alt=media&token=cda6db84-c389-45c4-a348-1d78e56b434a',
  hexToColor('#000100').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_26_IMG_7550.JPG?alt=media&token=53b86aa5-52a1-4942-9d4d-91ee8189dd01',
  hexToColor('#64564d').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_30_IMG_7552.JPG?alt=media&token=c6654ac6-4954-4734-8c01-6c87e1677ac9',
  hexToColor('#795c4c').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_33_IMG_7553.JPG?alt=media&token=8be726be-774b-4de6-ba38-7e3babdb9940',
  hexToColor('#71706e').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_35_IMG_7554.JPG?alt=media&token=039dc67e-6090-4873-9f86-6d2c67eadaf2',
  hexToColor('#755b61').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_40_IMG_7555.JPG?alt=media&token=b7ad42ad-3b64-493a-a62d-629cbf74b6fd',
/////////////////////////////////////////////////////////lonen///////////////////////////////////////////////////////////////
  hexToColor('#000010').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_28_IMG_7455.JPG?alt=media&token=9b072cb0-7583-4204-9ccb-9b08bef30388',
  hexToColor('#7e8492').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_31_IMG_7456.JPG?alt=media&token=758fee9b-12c8-49bb-8480-2d05fa6a7485',
  hexToColor('#72563e').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_35_IMG_7463.JPG?alt=media&token=b5842877-e909-44b0-a63b-a35e7f2b0bc2',
  hexToColor('#536d6e').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_52_IMG_7472.JPG?alt=media&token=5477e3bb-49dd-4702-8648-41f8dd0be56f',
  hexToColor('#131734').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_55_IMG_7473.JPG?alt=media&token=c8bbb67a-3c98-498d-8640-e6f786aa315b',
  hexToColor('#474217').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_59_IMG_7476.JPG?alt=media&token=3f85aeea-0359-4cbf-98c3-63f7e08ac671',
  hexToColor('#7a6f5d').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_23_00_IMG_7478.JPG?alt=media&token=802d2d60-ba09-4879-b17b-70aa89d3f78b',
  hexToColor('#787f5e').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_23_05_IMG_7480.JPG?alt=media&token=7dccd1b8-3473-4623-927d-97bfb3eb8a9c',
  hexToColor('#3b1220').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_23_07_IMG_7481.JPG?alt=media&token=1d6a906e-f19c-4f50-8a49-aaa75d1427b1',
  hexToColor('#852f52').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_23_10_IMG_7482.JPG?alt=media&token=0aeb8da2-a537-40e3-a067-98033b939735',
  hexToColor('#23227f').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_23_14_IMG_7483.JPG?alt=media&token=f9526587-b20a-4539-9b83-7ffe0f6f2d1c',
//////////////////////////////////////////////////////gorgetsatan//////////////////////////////////////////////////////////////////////
  hexToColor('#001000').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_19_IMG_7310.JPG?alt=media&token=904bda66-7849-4e54-a0a1-64ef4c2e6636',
  hexToColor('#a29584').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_24_IMG_7319.JPG?alt=media&token=55709def-2263-4a84-9c43-6bb8ce56e981',
  hexToColor('#997370').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_26_IMG_7322.JPG?alt=media&token=130a5322-cdc5-46e4-82d5-445c236c3cfb',
  hexToColor('#424856').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_28_IMG_7324.JPG?alt=media&token=7e4bd035-2f5d-4e25-b0da-c21792f6a60f',
  hexToColor('#45493b').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_30_IMG_7325.JPG?alt=media&token=8c946947-17b3-4873-b557-7ea48feddeee',
  hexToColor('#625857').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_32_IMG_7330.JPG?alt=media&token=c3913826-29f1-4441-9396-41f6ea5bce18',
  hexToColor('#634940').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_35_IMG_7331.JPG?alt=media&token=409acee1-db9e-4b42-9a49-a745001af7ec',
  hexToColor('#3b3328').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_36_IMG_7333.JPG?alt=media&token=dbb22f76-fe35-4746-88cc-85af47da934a',
  hexToColor('#fcfff8').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_40_IMG_7337.JPG?alt=media&token=5c3811e4-db10-4bb3-8ff3-5d0c0f8f9d5e',
  hexToColor('#221411').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_41_IMG_7338.JPG?alt=media&token=77814fc9-c273-402f-8483-98df738a57e4',
  hexToColor('#65332c').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_44_IMG_7342.JPG?alt=media&token=f017cbf8-4b8d-49cd-8371-6e3e8f78543f',
  ///////////////////////////////////////////////////cotton moskar////////////////////////////////////////////////////////////////////
  hexToColor('#a1a1ac').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_31_IMG_8111.JPG?alt=media&token=7870b5ac-7f9b-400f-ba07-a7fa57b53e6c',
  hexToColor('#968773').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_33_IMG_8112.JPG?alt=media&token=2f1745ea-d4f3-497a-8112-07ea511ac469',
  hexToColor('#b3959a').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_36_IMG_8113.JPG?alt=media&token=bec7c9ef-641d-47c4-b372-8486e5b09a4e',
  hexToColor('#4c5c89').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_40_IMG_8114.JPG?alt=media&token=2ec81cfd-9c61-4ba7-9063-6b498f385de2',
  hexToColor('#7c5667').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_47_IMG_8118.JPG?alt=media&token=5843580b-d7cc-489c-aea2-2914fb07b83c',
  hexToColor('#010000').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_53_IMG_8123.JPG?alt=media&token=049585fa-a224-440b-8378-dea1f7780ecc',
  hexToColor('#fcf4ff').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_22_00_IMG_8124.JPG?alt=media&token=3773e0f0-9be5-4109-9f46-6d4cf6cadc42',
///////////////////////////////////////////////////likra mksar//////////////////////////////////////////////////////////////////////////////////
  hexToColor('#f2f2fa').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_26_IMG_7878.JPG?alt=media&token=efd922c1-de7e-4cc9-8f14-83bd76d9f1be',
  hexToColor('#907868').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_31_IMG_7880.JPG?alt=media&token=47d37a2f-7a34-4584-afdf-0e0d0be4bc47',
  hexToColor('#6a6e7e').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_34_IMG_7881.JPG?alt=media&token=a2db1514-25de-4695-8216-e6d2e7c18d59',
  hexToColor('#8e746e').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_39_IMG_7882.JPG?alt=media&token=f034b92f-2d2c-426f-8468-b7c970668a8d',
  hexToColor('#755d59').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_42_IMG_7883.JPG?alt=media&token=6ef7ce29-6fa8-4843-8d26-1c60626d6d4e',
  hexToColor('#694452').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_49_IMG_7886.JPG?alt=media&token=dee09d12-71b0-48d9-9b46-f25f95ae10aa',
  hexToColor('#9b9887').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_52_IMG_7887.JPG?alt=media&token=6e43a836-36c6-480c-b92c-105573711862',
  hexToColor('#100000').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_55_IMG_7890.JPG?alt=media&token=8ef86d5b-aded-4e47-bae6-3c86d7c73aa5',
  hexToColor('#6f6865').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_58_IMG_7891.JPG?alt=media&token=d7257f97-4894-48bc-9e3b-05bf8a204d3a',
////////////////////////////////////////////////////lyorah glutter /////////////////////////////////////////////////
  hexToColor('#92868f').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lyorah%20glutter%2F2024_03_16_20_07_IMG_8096.JPG?alt=media&token=751a1ce5-518f-4fbc-b0a2-6bf61549c753',
  hexToColor('#998062').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lyorah%20glutter%2F2024_03_16_20_11_IMG_8097.JPG?alt=media&token=d9f9267f-b67e-49e7-979a-09a9794115a9',
  hexToColor('#aa9987').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lyorah%20glutter%2F2024_03_16_20_54_IMG_8098.JPG?alt=media&token=73ff55c9-cb46-470b-ad95-5b5cac1bcb20',
/////////////////////////////////////////////////ttnora///////////////////////////////////////////////////////////////////
  hexToColor('#fffeff').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/tnora%2F2024_03_18_22_16_IMG_8173.JPG?alt=media&token=a2a97ea9-79f8-4dd6-925b-d01e242c5ee8',
  hexToColor('#000110').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/tnora%2F2024_03_18_22_27_IMG_8179.JPG?alt=media&token=3be28754-dda0-4e01-b95e-966cd77d9e72',
////////////////////////////////////////////////ninja///////////////////////////////////////
  hexToColor('#f3f4f9').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/ninja%2F2024_03_18_23_31_IMG_8201.JPG?alt=media&token=dea3d084-f164-420e-a971-901791faf9fd',
  hexToColor('#110000').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/ninja%2F2024_03_18_23_41_IMG_8202.JPG?alt=media&token=f7677152-1c01-48fd-8bde-26240fbc003d',
////////////////////////////////////////////////kapa kamis///////////////////////////////////////////////
  hexToColor('#f9f8f6').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kapa%20kamis%2F2024_03_18_22_53_IMG_8187.JPG?alt=media&token=814c9db4-ac8d-4c33-b9a8-ac3255b5370c',
  hexToColor('#011000').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kapa%20kamis%2F2024_03_18_23_12_IMG_8195.JPG?alt=media&token=dc2b42c2-07c7-4a67-b82d-5db5ba63fb5f',
////////////////////////////////////////////////hinec.////////////////////////////////////////
  hexToColor('#fffffe').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kapa_hinek%2F2024_03_18_22_33_IMG_8183.JPG?alt=media&token=5663e74e-f94e-440b-a0a6-d28f8d076adb',
  hexToColor('#000001').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kapa_hinek%2F2024_03_18_22_44_IMG_8186.JPG?alt=media&token=5b8e5492-3ee2-4dc7-a923-9661cab97a2e',
///////////////////////////////////////////////mo3sam////////////////////////////////////////////////////////////
  hexToColor('#f5f6ff').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mo3sam%20zrar%2F2024_03_18_21_46_IMG_8156.JPG?alt=media&token=370e67bb-b9b5-405a-9e76-8d24a03379b9',
  hexToColor('#100001').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mo3sam%20zrar%2F2024_03_18_21_40_IMG_8154.JPG?alt=media&token=a6b4a278-782f-4ff3-a300-c7380fbcb492',
///////////////////////////////////////////////mo3sam_zm////////////////////////////////////////////////////////////
  hexToColor('#f3f3fb').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mo3sam_zm%2F2024_03_18_22_03_IMG_8171.JPG?alt=media&token=694944ca-ef09-4b41-b13b-1ed90622e7dd',
  hexToColor('#010010').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mo3sam_zm%2F2024_03_18_22_00_IMG_8169.JPG?alt=media&token=e4b708c1-cf8c-4cee-b778-b95de2b4866b',
/////////////////////////////////////////////hijab tabake//////////////////////////////////////////
  hexToColor('#001001').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/hijab_tabaqi%2F2024_03_17_22_33_IMG_8132.JPG?alt=media&token=1a4d9b81-61f0-4e73-8116-5209665fc417',
  hexToColor('#595c74').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/hijab_tabaqi%2F2024_03_17_22_39_IMG_8135.JPG?alt=media&token=4556faf9-f89f-4f2e-ba68-231025db56ac',
    hexToColor('#1b1f4d').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/hijab_tabaqi%2F2024_03_17_22_42_IMG_8136.JPG?alt=media&token=b2a32a67-e034-4691-8492-be0d5a8e122d',
  hexToColor('#f2f2f2').value.toRadixString(16):'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/hijab_tabaqi%2F2024_03_17_22_47_IMG_8138.JPG?alt=media&token=22a7a957-d3e6-4aae-aeb6-2373149ef45d',


  };
  Future<void> _confirmData() async {
   final User? user = _auth.currentUser;
    if (user != null) {
      // Show a circular progress indicator while updating data
    
      // Update user data
      await _firestore.collection('users').doc(user.uid).update({
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
      });
    }}

   Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }


Future<void> saveinfirebase() async {
  try {
    final User? user = _auth.currentUser;
    if (user != null) {
      final cartProvider = context.read<CartProvider>();
      final cartItems = cartProvider.cartItems;

      // Update user data
      await _firestore.collection('users').doc(user.uid).update({
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'selectedCity': selectedCity,
        'location': _locationController.text,
      });

      // Get the existing orders for the user
      DocumentSnapshot userDoc = await _firestore.collection('orders').doc(user.uid).get();

      // Create a list to store order details
      List<Map<String, dynamic>> orderDetails = [];

      // Check if the user has existing orders
      if (userDoc.exists) {
        // If yes, get the existing order details
        orderDetails = List<Map<String, dynamic>>.from(userDoc['orderDetails']);
      }

      // Save cart details to the "orders" collection
      for (final item in cartItems) {
        final colorIdentifier = item.selectedColor.value.toRadixString(16);
        final imageUrl = colorImageMapping[colorIdentifier];
        orderDetails.add({
          'userId': user.uid,
          'productName': item.product.title,
          'productColor': item.selectedColor.toString(),
          'quantity': item.quantity,
          'totalPrice': item.product.price * item.quantity,
          'paymentOption': selectedPaymentOption,
          'location': _locationController.text,
          'image': imageUrl,
          'selectedCity': selectedCity,
            'orderstate': orederState,
               'email': _emailController.text,
        'name': _nameController.text,
        'phone': _phoneController.text,
        });
      }

      // Save or update orders in the "orders" collection in Firestore
      await _firestore.collection('orders').doc(user.uid).set({
        'email': _emailController.text,
        'name': _nameController.text,
        'phone': _phoneController.text,
        'orderDetails': orderDetails,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Clear the cart after successful purchase
      cartProvider.clearCart();


  

      // Show a success dialog to the user
   final _media = MediaQuery.of(context);
  
  AwesomeDialog(
    context: context,
    animType: AnimType.bottomSlide,
    dialogType: DialogType.success,
    body: CustomMediaQuery(
      child: Container(
        height: _media.size.width*0.37,
        child: Column(
          children: [
          Center(
              child: Text(
                'تمت عملية الطلب بنجاح ',
                style: TextStyle(fontSize: _media.size.width*0.045 ,fontFamily: 'Cairo' ),
              ),
            ),
            SizedBox(height: _media.size.width*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: ((context)=> check_oreder())));

                  },
                  child: const Text(
                    'لقد فهمت ',
                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(hexToColor('#9C0945')),
                     fixedSize: MaterialStateProperty.all<Size>( Size(_media.size.width *0.6, _media.size.width *0.15), ),
                    
                  ),
                ),
              
              ],
            ),
          ],
        ),
      ),
    ),

  ).show();
    }
  } catch (e) {
    // Handle errors if any
    print('Error during purchase: $e');
  }
}


























  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final cartItems = cartProvider.cartItems;
      final _media = MediaQuery.of(context);
    
   
   


    double total = 0.0;
    for (final item in cartItems) {
      total += item.product.price * item.quantity; // Multiply price by quantity
    }
   // Function to handle the Checkbox change



 
    return Scaffold(
       backgroundColor:hexToColor('#9C0945') ,
 
        body: SafeArea(
            child: SingleChildScrollView(
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
                      Container( decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25)),
                      ),
                   margin: EdgeInsets.only(top: _media.size.width*0.25),
                      width: _media.size.width*1,
                      
                        child: cartItems.isEmpty
                          ?  Container(height: _media.size.width*1.85,
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
                          )
                          :Column(
                                                children: [
                                                                 CustomMediaQuery(
                            child: Container(
                              height: _media.size.width * 0.2,
                              width: _media.size.width *2,
                              decoration:  BoxDecoration(
                                color:  hexToColor('#9C0945'),
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(right: _media.size.width *0.03),
                                    child: Text(
                                      'المجموع: JD ${total.toStringAsFixed(2)}',
                                      style: TextStyle(fontSize: _media.size.width *0.05,color:Colors.white,fontFamily: 'Cairo'),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: _media.size.width *0.03),
                                   child :ElevatedButton(
                                  style: ButtonStyle(
                                     fixedSize: MaterialStateProperty.all<Size>( Size(_media.size.width *0.35, _media.size.width *0.15), ),
                                  backgroundColor: MaterialStateProperty.all<Color>(hexToColor('#ffffff')),
                                  ),
                                  onPressed: () {
                                  showModalBottomSheet(
                                    enableDrag: true,
                                    context: context,
                                     isScrollControlled: true,
                                     backgroundColor: Colors.transparent,
                                    builder: (context) =>  Padding(
                                      padding: MediaQuery.of(context).viewInsets,
                                      child: CustomMediaQuery(
                                        child: SingleChildScrollView(
                                          child: Form(key: _formKey, autovalidateMode: AutovalidateMode.onUserInteraction,
                                            child: Column(
                                                          children: [
                                                            Container(
                                               decoration:  BoxDecoration(
                                                 color: hexToColor('#9C0945'),
                                                 borderRadius: const BorderRadius.only(
                                                     topRight: Radius.circular(25),
                                                     topLeft: Radius.circular(25)),
                                               ),
                                               margin: EdgeInsets.only(top: _media.size.width * 0.24),
                                               width: _media.size.width*1,
                                               height: _media.size.width *1.22,
                                        
                                               child:  Column(
                                                 crossAxisAlignment: CrossAxisAlignment.center,
                                                 children: <Widget>[
                                                 Center(child: Padding(
                                                   padding:  EdgeInsets.only(top: _media.size.width*0.04),
                                                   child: Text('هل أنت متأكد من معلوماتك ؟ ',style:
                                                    TextStyle(fontFamily: 'Cairo',color: Colors.white,fontSize: _media.size.width * 0.06  ),),
                                                 )),
                                                   SizedBox(height: _media.size.width *0.04,),
                                                  Padding(
                                                     padding:
                                                     EdgeInsets.symmetric(horizontal: _media.size.width * 0.06),
                                                     child: Container(
                                                       decoration: BoxDecoration(
                                                         color: Colors.white,
                                                         borderRadius: BorderRadius.circular(12),
                                                       ),
                                                       child: Padding(
                                                         padding:
                                                         EdgeInsets.symmetric(horizontal: _media.size.width * 0.05),
                                                         child: TextFormField(
                                                           keyboardType: TextInputType.name,
                                                           controller: _nameController,
                                                           decoration: const InputDecoration(
                                                               border: InputBorder.none,
                                                               labelText: 'الإسم ',
                                                               labelStyle: TextStyle(
                                                                 fontFamily: 'Cairo',
                                                                 color: Colors.black,
                                                               )),
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                    SizedBox(height: _media.size.width *0.03,),
                                                   Padding(
                                                     padding:
                                                     EdgeInsets.symmetric(horizontal: _media.size.width * 0.06),
                                                     child: Container(
                                                       decoration: BoxDecoration(
                                                         color: Colors.white,
                                                         borderRadius: BorderRadius.circular(12),
                                                       ),
                                                       child: Padding(
                                                         padding:
                                                         EdgeInsets.symmetric(horizontal: _media.size.width * 0.05),
                                                         child: TextFormField(
                                                           keyboardType: TextInputType.emailAddress,
                                                           controller: _emailController,
                                                           decoration: const InputDecoration(
                                                               border: InputBorder.none,
                                                               labelText: 'البريد الإلكتروني',
                                                               labelStyle: TextStyle(
                                                                 fontFamily: 'Cairo',
                                                                 color: Colors.black,
                                                               )),
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                  SizedBox(height: _media.size.width *0.03,),
                                                        Padding(
                                                     padding:
                                                     EdgeInsets.symmetric(horizontal: _media.size.width * 0.06),
                                                     child: Container(
                                                       decoration: BoxDecoration(
                                                         color: Colors.white,
                                                         borderRadius: BorderRadius.circular(12),
                                                       ),
                                                       child: Padding(
                                                         padding:
                                                         EdgeInsets.symmetric(horizontal: _media.size.width * 0.03),
                                                      child: TextFormField(
                                                        validator: (value) {
                                                                                  if (value!.isEmpty) {
                                                                                    return "يجب عليك كتابة الرقم الهاتف";
                                                                                  } else if (value.length < 10) {
                                                                                    return " يجب أن يكون رقم الهاتف من 10 ارقام ";
                                                                                  } else if (value.length > 10) {
                                                                                    return "يجب ان يكون رقم الهاتف من 10 ارقام";
                                                                                  }
                                                                                  return null;
                                                                                },
                                                      
                                                                       keyboardType: TextInputType.number,
                                                                       controller: _phoneController,
                                                              decoration: const InputDecoration(
                                                                 border: InputBorder.none,
                                                               labelText: 'رقم الهاتف',
                                                                 labelStyle: TextStyle(
                                                                fontFamily: 'Cairo',
                                                               color: Colors.black,
                                                           ),
                                                       ),
                                                            ),
                                                       ),
                                                     ),
                                                   ),
                                                   SizedBox(height: _media.size.width *0.07,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      ElevatedButton(
                                                        style: ButtonStyle( fixedSize: MaterialStateProperty.all<Size>( Size(_media.size.width *0.28, _media.size.width *0.15), ),backgroundColor: MaterialStateProperty.all(hexToColor('#9C0945'),)),
                                                        onPressed: () async{
                                                           Future<bool> isConnected = checkConnectivity(); //
                                                         if  (await isConnected ) {
                                                         _confirmData();
                                                       if(_formKey.currentState!.validate()) {
                                             
                                                          showModalBottomSheet(
                                                               enableDrag: true,
                                                                context: context,
                                                                 isScrollControlled: true,
                                                                 backgroundColor: Colors.transparent,
                                                                builder: (context) => 
                                                                Padding(
                                                               padding: MediaQuery.of(context).viewInsets,
                                                                  child: CustomMediaQuery(
                                                                    child: SingleChildScrollView(
                                                                                                child: Form(key: _formKey2, autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                                  child: Column(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                                 decoration:   BoxDecoration(
                                                                                                                 color: hexToColor('#9C0945'),
                                                                                                                 borderRadius: const BorderRadius.only(
                                                                                                                     topRight: Radius.circular(25),
                                                                                                                     topLeft: Radius.circular(25)),
                                                                                                               ),
                                                                                                               margin: EdgeInsets.only(top: _media.size.width * 0.24),
                                                                                                               width: _media.size.width*1,
                                                                                                               height: _media.size.width *1.2,
                                                                                                      child: SingleChildScrollView(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding:  EdgeInsets.only(top: _media.size.width*0.04),
                                                                                                              child: Text('تفاصيل الموقع و الدفع ',style: TextStyle(fontFamily: 'Cario',fontSize: _media.size.width *0.06,color: Colors.white),),
                                                                                                            ),
                                                                                                            SizedBox(height: _media.size.width*0.03),
                                                                                                            Container(
                                                                                                              
                                                                                                              width: _media.size.width *0.91,
                                                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),  color: Colors.white,),
                                                                                                              child: Padding(
                                                                                                                padding:  EdgeInsets.symmetric(horizontal: _media.size.width *0.08 ),
                                                                                                                child: TextFormField(
                                                                                                                   validator:                      (value) {
                                                                                                                                      if (value!.isEmpty) {
                                                                                                                                        return "بجب عليك كتابة الموقع";
                                                                                                                                      }
                                                                                                                                      return null;
                                                                                                                                    },
                                                                                                                  controller: _locationController,
                                                                                                                  decoration: const InputDecoration(
                                                                                                                    labelText: 'الحي / الشارع ',hintText: 'الموقع بالتحديد ',
                                                                                                                    border: InputBorder.none,
                                                                                                                  )
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            SizedBox(height: _media.size.width*0.03),
                                                                                                                       Container( width: _media.size.width *0.91,
                                                                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white),
                                                                                                                         child: Padding(
                                                                                                                                                               padding:  EdgeInsets.symmetric(horizontal:_media.size.width *0.04),
                                                                                                                                                               child: StatefulBuilder(   builder: (BuildContext context, StateSetter setState) {
                                                                                                                                                                return DropdownButton<String>(
                                                                                                                                                                    icon: Padding(
                                                                                                                                                                      padding:  EdgeInsets.only(right: _media.size.width *0.55),
                                                                                                                                                                      child: const Icon(Icons.location_city),
                                                                                                                                                                    ),
                                                                                                                                                                    iconSize: _media.size.width *0.08,
                                                                                                                                                                                       value: selectedCity,
                                                                                                                                                                                       onChanged: (String? newValue) {
                                                                                                                                                                                         setState(() {
                                                                                                                                                                                           selectedCity = newValue!;
                                                                                                                                                                                         });
                                                                                                                                                                                       },
                                                                                                                                                                                       items: jordanCities.map((String city) {
                                                                                                                                                                                         return DropdownMenuItem<String>(
                                                                                                                                                                                           value: city,
                                                                                                                                                                                           child: CustomMediaQuery(child: Text(city)),
                                                                                                                                                                                         );
                                                                                                                                                                                       }).toList(),
                                                                                                                                                                                     );
                                                                                                                                                               }   ),
                                                                                                                         ),
                                                                                                                       ),
                                                                                                                       SizedBox(height: _media.size.width*0.05,),
                                                                                                           const Text('الدفع عبر:',style: TextStyle(color: Colors.white,
                                                                                                           ),),
                                                                                                          StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                                                                                                            return Column(
                                                                                                              children: [
                                                                                                             // Row(  children: [ Radio(value: 'الدفع عبر الفيزا',  groupValue: selectedPaymentOption,     onChanged: (String? value) { setState(() { selectedPaymentOption = value!;  });  },   ),   Text('الفيزا')  ]    ),          
                                                                                                              Row(
                                                                                                                children: [
                                                                                                                  Radio(
                                                                                                                    fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {return states.contains(MaterialState.selected) ? Colors.black : Colors.grey; }),
                                                                                                                    value: 'الدفع عند الإستلام',
                                                                                                                    groupValue: selectedPaymentOption,
                                                                                                                    onChanged: (String? value) {
                                                                                                                      setState(() {
                                                                                                                                                                selectedPaymentOption = value!; // Update the selected payment option
                                                                                                                      });
                                                                                                                    },
                                                                                                                  ),
                                                                                                                  const Text('الدفع عند الإستلام',style: TextStyle(color: Colors.white),),
                                                                                                                ],
                                                                                                              ),
                                  
                                                                                                             Text('قيمة التوصيل تتراوح بين 2 أو 3 دنانير حسب منطقتك ',style: TextStyle(fontFamily: 'Cairo',fontSize: _media.size.width*0.04,color: Colors.white),)
                                                                                                              ],
                             
                                                                                                            );
                                                                                                                                                              }  ),
                                  
                                                                                                                      SizedBox(height: _media.size.width*0.08 ),
                                                                                                                   ElevatedButton(child: const Text('اكمل عملية الشراء ', style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold),),onPressed: () async{
                                                                                                                    Future<bool> isConnected = checkConnectivity(); if  (await isConnected ) { 
                                                if (_formKey2.currentState!.validate()) {
                          if (selectedPaymentOption == true) {
                             AwesomeDialog(
                          context: context,
                          animType: AnimType.bottomSlide,
                          dialogType: DialogType.error,
                          body: CustomMediaQuery(
                            child: Container(
                              height: _media.size.width*0.15,
                              child: Column(
                                children: [
                                Center(
                          child: Text(
                            'يرجى اختيار طريقة الدفع ',
                            style: TextStyle(fontSize: _media.size.width*0.05 ,fontFamily: 'Cairo', ),
                          ),
                                                ),
                              
                              
                                ],
                              ),
                            ),
                          ),
                                  
                                                ).show();
                          }
                          saveinfirebase();}
                             } else {
                          showDisconnectedMessage();
                          }
                                  },                                                                                            style: ButtonStyle( fixedSize: MaterialStateProperty.all<Size>( Size(_media.size.width *0.55, _media.size.width *0.15), ),backgroundColor: MaterialStateProperty.all(hexToColor('#9C0945'),)),
                                                                                                          ),
                                                                                                          SizedBox(height:_media.size.width*0.022 ,),
                                                                                                       //   Text('* في حال ادخال المعلومات بشكل خاطئ لن يتم استلام الطلب',style: TextStyle(color: Colors.red,fontSize: _media.size.width *0.035,fontFamily: 'Cairo',fontWeight: FontWeight.bold),)
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                                  ),
                                                                                                    ],
                                                                                                  ),
                                                         
                                                                                                ),
                                                                    ),
                                                                  ),
                                                                )
                                                              
                                                            );}
                                                            }else{showDisconnectedMessage();}
                                                        } 
                                                      ,  
                                                      
                                                      
                                                    
                                  
                                                       child: Text('تأكيد ',style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold,fontSize: _media.size.width *0.04),)),
                                                     SizedBox(width: _media.size.width *0.03,),
                                                      ElevatedButton(
                                                        style: ButtonStyle( fixedSize: MaterialStateProperty.all<Size>( Size(_media.size.width *0.28, _media.size.width *0.15), ),backgroundColor: MaterialStateProperty.all(hexToColor('#9C0945'),)),
                                                        onPressed: ()async{
                                                          Future<bool> isConnected = checkConnectivity(); //
                                                         if  (await isConnected ){
                                                         _updateUserData();}
                                                         else{
                                                          showDisconnectedMessage();
                                                         }
                                                         
                                                        }
                                                      , child: Text('تم التعديل ',style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold,fontSize: _media.size.width *0.042),)),
                                                    ],
                                                  ),
                                                   SizedBox(height:_media.size.width*0.032 ,),
                                                   Text('* في حال ادخال المعلومات بشكل خاطئ لن يتم استلام الطلب',style: TextStyle(color: Colors.white,fontSize: _media.size.width *0.035,fontFamily: 'Cairo',fontWeight: FontWeight.bold),)
                                                 ]
                                               )
                                                            ),
                                                          ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                   
                                  );
                                  },
                                  child:  CustomMediaQuery(
                                    child: Text(
                                    'تأكيد الشراء',
                                    style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold,fontSize: _media.size.width*0.045,color: hexToColor('#9C0945')),
                                    ),
                                  ),
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ),
                                                
                          CustomMediaQuery(
                            child: SingleChildScrollView(
                              child: Column(
                                children: cartItems.map((item) {
                                  return SingleChildScrollView(
                                    child: Column(
                                      children: [
                                       Container(
                                                             decoration: BoxDecoration(
                                                               borderRadius: BorderRadius.circular(12),
                                                          color: Colors.white,       
                                                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5),spreadRadius: 10, blurRadius: 7, offset: const Offset(0, 3),), ],
                                                             ),
                                                             height: _media.size.width * 0.52,
                                                             width: _media.size.width * 0.95,
                                                             margin: EdgeInsets.only(top: _media.size.width * 0.02,bottom: _media.size.width*0.01),
                                                             // Other properties of your Container
                                                                       
                                          child: Row(
                                            children: [
                                              // Product Image and Selected Color
                                              Expanded(flex: 3,
                                                child: Column(
                                                  children: [
                                                    Container(
                                              
                                                      child: Column(
                                                      children: [
                                                  
                                            
                                                                    if (item.product.id == 1 && item.selectedColor == hexToColor('#628574'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon(),)
                                                                                        ),
                                                            if (item.product.id == 1 && item.selectedColor == hexToColor('#986081'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon1(),)
                                                                                        ),
                                                            if (item.product.id == 1 && item.selectedColor == hexToColor('#657bad'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon2(),)
                                                                                        ),
                                                            if (item.product.id == 1 && item.selectedColor == hexToColor('#2b142f'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                               height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon3(),)
                                                                                        ),
                                                            if (item.product.id == 1 && item.selectedColor == hexToColor('#5c4671'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon4(),)
                                                                                        ),
                                                              if (item.product.id == 1 && item.selectedColor == hexToColor('#bc9093'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon5(),)
                                                                                        ),
                                                              
                                                               if (item.product.id == 1 && item.selectedColor ==   hexToColor('#827565'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon6(),)
                                                                                        ),
                                                               if (item.product.id == 1 && item.selectedColor ==  hexToColor('#7d5d64'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon7(),)
                                                                                        ),
                                                               if (item.product.id == 1 && item.selectedColor == hexToColor('#2f3a23'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon8(),)
                                                                                        ),
                                                               if (item.product.id == 1 &&  item.selectedColor == hexToColor('#3a394a'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon9(),)
                                                                                        ),
                                                               if (item.product.id == 1 &&  item.selectedColor == hexToColor('#ab9683'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon10(),)
                                                                                        ),
                                                               if (item.product.id == 1 &&  item.selectedColor == hexToColor('#5d3a2c'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon11(),)
                                                                                        ),
                                                               if (item.product.id == 1 &&  item.selectedColor == hexToColor('#4b5750'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon12(),)
                                                                                        ),
                                                                if (item.product.id == 1 && item.selectedColor ==hexToColor('#947e93'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon13(),),
                                                                                        ),
                                                                if (item.product.id == 1 && item.selectedColor == hexToColor('#161d31'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon14(),
                                                                                        ),),

                                                                                         if (item.product.id == 1 && item.selectedColor == hexToColor('#32142b'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon15(),)
                                                                                        ),

                                                                         if (item.product.id == 1 && item.selectedColor == hexToColor('#967071'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon16(),)
                                                                                        ),

                                                                          if (item.product.id == 1 && item.selectedColor == hexToColor('#050505'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon17(),)
                                                                                        ),

                                                                           if (item.product.id == 1 && item.selectedColor == hexToColor('#cdc4b9'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon18(),)
                                                                                        ),

                                                                            if (item.product.id == 1 && item.selectedColor == hexToColor('#f0effe'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon19(),)
                                                                                        ),

                                                                          if (item.product.id == 1 && item.selectedColor == hexToColor('#746478'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon20(),)
                                                                                        ),
                                                                                  
                                                                                  
                                                                        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                                                                     
                                                                                  
                                                                                  
                                                                                  
                                                                                  
                                                                                                                 
                                                                                               if (item.product.id == 2 && item.selectedColor == hexToColor('#654321'))
                                                                                   ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget())),
                                                                      
                                                                       
                                                                       
                                                                                      if ( item.product.id == 2 &&  item.selectedColor == hexToColor('#121121'))
                                                                          ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget1(),)),
                                                                       
                                                                       
                                                                                      if (item.product.id == 2 &&  item.selectedColor == hexToColor('#302011'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget2(),)),
                                                                       
                                                                       
                                                                                      if (item.product.id == 2 &&  item.selectedColor == hexToColor('#C08FA4'))
                                                                          ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                            child: const newslidergorget3(),),
                                                                          ),
                                                                       
                                                                       
                                                                                      if (item.product.id == 2 &&  item.selectedColor == hexToColor('#808080'))
                                                                                       ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget4(),)),
                                                                       
                                                                       
                                                                                        if (item.product.id == 2 &&  item.selectedColor == hexToColor('#303139'))
                                                                          ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget5(),)),
                                                                       
                                                                       
                                                                                         if (item.product.id == 2 &&  item.selectedColor == hexToColor('#61152B'))
                                                                           ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget6(),)),
                                                                       
                                                                       
                                                                                         if (item.product.id == 2 &&  item.selectedColor ==  hexToColor('#002D27'))
                                                                          ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget7(),)),
                                                                       
                                                                       
                                                                       
                                                                                         if (item.product.id == 2 &&  item.selectedColor ==  hexToColor('#AD885A'))
                                                                          ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget8(),)),
                                                                       
                                                                       
                                                                       
                                                                                         if (item.product.id == 2 &&  item.selectedColor == hexToColor('#39506C'))
                                                                           ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget9(),)),
                                                                       
                                                                       
                                                                                         if ( item.product.id == 2 &&  item.selectedColor == hexToColor('#584232'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget10(),)),
                                                                       
                                                                       
                                                                                         if (item.product.id == 2 &&   item.selectedColor == hexToColor('#182013'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget11(),)),
                                                                       
                                                                       
                                                                                         if (item.product.id == 2 &&  item.selectedColor == hexToColor('#747B5D'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget12(),)),
                                                                       
                                                                       
                                                                       
                                                                                         if ( item.product.id == 2 &&  item.selectedColor == hexToColor('#1D1B4E'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget13(),)),
                                                                       
                                                                       
                                                                          if (item.product.id == 2 &&  item.selectedColor == hexToColor('#4F333F'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget14(),)),
                                                                       
                                                                       
                                                                          if (item.product.id == 2 &&  item.selectedColor ==hexToColor('#322517'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget15(),)),
                                                                       
                                                                       
                                                                          if ( item.product.id == 2 &&  item.selectedColor ==hexToColor('#75585A'))
                                                                          ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget16(),)),
                                                                       
                                                                       
                                                                          if (item.product.id == 2 &&  item.selectedColor == hexToColor('#B78C6E'))
                                                                          ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget17(),)),
                                                                       
                                                                       
                                                                          if (item.product.id == 2 &&  item.selectedColor ==hexToColor('#31121B'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget18(),)),
                                                                       
                                                                       
                                                                          if (item.product.id == 2 &&  item.selectedColor== hexToColor('#000000'))
                                                                         ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget19(),)),
                                                                       
                                                                       
                                                                          if ( item.product.id == 2 &&  item.selectedColor == hexToColor('#FFFFFF'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorget20(),)),     
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                                                         if ( item.product.id == 3  && item.selectedColor == hexToColor('#afa795'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercotenkwait(),)), 

                                                                         if ( item.product.id == 3  && item.selectedColor == hexToColor('#8f8583'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercotenkwait1(),)), 

                                                                       if ( item.product.id == 3  && item.selectedColor == hexToColor('#b0b0ae'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercotenkwait2(),)),

                                                                          if ( item.product.id == 3  && item.selectedColor == hexToColor('#9a867b'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercotenkwait3(),)), 

                                                                        if ( item.product.id == 3  && item.selectedColor == hexToColor('#918a80'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercotenkwait4(),)), 



                                                                       if ( item.product.id == 3  && item.selectedColor == hexToColor('#0f1014'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercotenkwait5(),)), 

                                                                          if ( item.product.id == 3  && item.selectedColor == hexToColor('#f2f3f8'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercotenkwait6(),)), 


                                                                      if ( item.product.id == 3  && item.selectedColor == hexToColor('#65605a'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercotenkwait7(),)),


                                                                          if ( item.product.id == 3  && item.selectedColor == hexToColor('#867267'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercotenkwait8(),)), 


                                                                        if ( item.product.id == 3  && item.selectedColor == hexToColor('#6d524b'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercotenkwait9(),)), 







     ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                                                             
                                                                         if ( item.product.id == 4  && item.selectedColor == hexToColor('#887a58'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderglutter(),)), 


                                                                          if ( item.product.id == 4  && item.selectedColor == hexToColor('#94806c'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderglutter1(),)), 


                                                                          if ( item.product.id == 4  && item.selectedColor == hexToColor('#020202'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderglutter2(),)), 


                                                                          if (item.product.id == 4  &&  item.selectedColor == hexToColor('#5c4e4a'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderglutter3(),)), 


                                                                           if (item.product.id == 4  &&  item.selectedColor == hexToColor('#8b6c64'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderglutter4(),)), 


                                                                          if (item.product.id == 4  &&  item.selectedColor == hexToColor('#ececec'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderglutter5(),)), 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                                        
                                                                          if (item.product.id == 5  && item.selectedColor == hexToColor('#b4ab9a'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottonliner(),)), 



                                                                             if (item.product.id == 5  && item.selectedColor == hexToColor('#7e7a70'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottonliner1(),)), 


                                                                            if ( item.product.id == 5  && item.selectedColor == hexToColor('#574636'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottonliner2(),)), 

                                                                         if ( item.product.id == 5  && item.selectedColor == hexToColor('#896c58'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottonliner3(),)), 

                                                                       if ( item.product.id == 5  && item.selectedColor == hexToColor('#886d67'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottonliner4(),)), 

                                                                           if ( item.product.id == 5  && item.selectedColor == hexToColor('#80576c'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottonliner5(),)), 

                                                                   if ( item.product.id == 5  && item.selectedColor == hexToColor('#fffffc'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottonliner6(),)), 

                                                                            if ( item.product.id == 5  && item.selectedColor == hexToColor('#7d867e'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottonliner7(),)), 

                                                                               if ( item.product.id == 5  && item.selectedColor == hexToColor('#50545d'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottonliner8(),)), 

                                                                               if ( item.product.id == 5  && item.selectedColor == hexToColor('#a27676'))
                                                                        ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottonliner9(),)), 
/////////////////////////////////////////////            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////              
                                                                          
                                                                             if (item.product.id == 6 && item.selectedColor == hexToColor('#a48594'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderstras(),)), 


                                                                               if (item.product.id == 6 && item.selectedColor == hexToColor('#ac8b7f'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderstras1(),)), 



                                                                           if (item.product.id == 6 && item.selectedColor == hexToColor('#b59f88'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderstras2(),)), 



                                                                          if (item.product.id == 6 && item.selectedColor == hexToColor('#9c8084'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderstras3(),)), 



                                                                             if (item.product.id == 6 && item.selectedColor == hexToColor('#878da0'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderstras4(),)), 


 
                                                                             if (item.product.id == 6 && item.selectedColor == hexToColor('#fff9f2'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderstras5(),)), 



                                                                              if (item.product.id == 6 && item.selectedColor == hexToColor('#6a6b68'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderstras6(),)),                                                       



                                                                        if (item.product.id == 6 && item.selectedColor == hexToColor('#7b7461'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderstras7(),)), 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                               
                                                                        if (item.product.id == 7 && item.selectedColor == hexToColor('#5d5946'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderDOUBLE_STRICH(),)), 


                                                                        if (item.product.id == 7 && item.selectedColor == hexToColor('#360f21'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderDOUBLE_STRICH1(),)), 



                                                                              if (item.product.id == 7 && item.selectedColor == hexToColor('#674765'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderDOUBLE_STRICH2(),)), 


                                                                              if (item.product.id == 7 && item.selectedColor == hexToColor('#fefffc'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderDOUBLE_STRICH3(),)), 


                                                                          if (item.product.id == 7 && item.selectedColor == hexToColor('#6f777e'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderDOUBLE_STRICH4(),)), 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                                      
                                                                          if (item.product.id == 8 && item.selectedColor == hexToColor('#7e828c'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidersatan(),)),                  



                                                                          if (item.product.id == 8 && item.selectedColor == hexToColor('#9d866e'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidersatan1(),)),



                                                                             if (item.product.id == 8 && item.selectedColor == hexToColor('#575d60'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidersatan2(),)),
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                                                          
                                                                          if (item.product.id == 9 && item.selectedColor == hexToColor('#010101'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderswarih(),)),                  



                                                                          if (item.product.id == 9 && item.selectedColor == hexToColor('#fff5f0'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderswarih1(),)),



                                                                             if (item.product.id == 9 && item.selectedColor == hexToColor('#ad9586'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderswarih2(),)),


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                                                    
                                                                          if (item.product.id == 10 && item.selectedColor == hexToColor('#fff7fb'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon_motraz(),)),                  



                                                                          if (item.product.id == 10 && item.selectedColor == hexToColor('#b29781'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon_motraz1(),)),



                                                                             if (item.product.id == 10 && item.selectedColor == hexToColor('#855668'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon_motraz2(),)),

                                                                               if (item.product.id == 10 && item.selectedColor == hexToColor('#020202'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidershifon_motraz3(),)),
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                                        
                                                                         if (item.product.id == 11 && item.selectedColor == hexToColor('#9f8872'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderkashmir(),)),                  



                                                                          if (item.product.id == 11 && item.selectedColor == hexToColor('#81603e'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderkashmir1(),)),



                                                                             if (item.product.id == 11 && item.selectedColor == hexToColor('#b29374'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderkashmir2(),)),

                                                                               if (item.product.id == 11 && item.selectedColor == hexToColor('#6a6b71'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderkashmir3(),)),
///////////////////////////////////////////////////////////////////////////////////////////likra mojaker//////////////////////////////////////////////////////////////
                                                                          if (item.product.id == 12 && item.selectedColor == hexToColor('#9b7881'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mojaker(),)),



                                                                             if (item.product.id == 12 && item.selectedColor == hexToColor('#b2aa9d'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mojaker1(),)),

                                                                               if (item.product.id == 12 && item.selectedColor == hexToColor('#fcfbff'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mojaker2(),)),


                                                                          if (item.product.id == 12 && item.selectedColor == hexToColor('#6f6559'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mojaker3(),)),



                                                                             if (item.product.id == 12 && item.selectedColor == hexToColor('#90867a'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mojaker4(),)),

                                                                               if (item.product.id == 12 && item.selectedColor == hexToColor('#62614d'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mojaker5(),)),

                                                                          if (item.product.id == 12 && item.selectedColor == hexToColor('#000100'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mojaker6(),)),



                                                                             if (item.product.id == 12 && item.selectedColor == hexToColor('#64564d'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mojaker7(),)),

                                                                               if (item.product.id == 12 && item.selectedColor == hexToColor('#795c4c'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mojaker8(),)),


                                                                             if (item.product.id == 12 && item.selectedColor == hexToColor('#71706e'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mojaker9(),)),

                                                                               if (item.product.id == 12 && item.selectedColor == hexToColor('#755b61'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mojaker10(),)),
///////////////////////////////////////////////////////////////////////////////lonen////////////////////////////////////////////////////////////////////////////////////////

                                                                           if (item.product.id == 13 && item.selectedColor == hexToColor('#000010'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlonen(),)),

                                                                           if (item.product.id == 13 && item.selectedColor == hexToColor('#7e8492'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlonen1(),)),

                                                                               if (item.product.id == 13 && item.selectedColor == hexToColor('#72563e'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlonen2(),)),

                                                                             if (item.product.id == 13 && item.selectedColor == hexToColor('#536d6e'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlonen3(),)),


                                                                           if (item.product.id == 13 && item.selectedColor == hexToColor('#131734'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlonen4(),)),

                                                                              if (item.product.id == 13 && item.selectedColor == hexToColor('#474217'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlonen5(),)),



                                                                      if (item.product.id == 13 && item.selectedColor == hexToColor('#7a6f5d'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlonen6(),)),

                                                                             if (item.product.id == 13 && item.selectedColor == hexToColor('#787f5e'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlonen7(),)),

                                                                    if (item.product.id == 13 && item.selectedColor == hexToColor('#3b1220'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlonen8(),)),

                                                                        if (item.product.id == 13 && item.selectedColor == hexToColor('#852f52'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlonen9(),)),

                                                                    if (item.product.id == 13 && item.selectedColor == hexToColor('#23227f'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlonen10(),)),
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                                                           if (item.product.id == 14 && item.selectedColor == hexToColor('#001000'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorgetsatan(),)),


                                                                          if (item.product.id == 14 && item.selectedColor == hexToColor('#a29584'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorgetsatan1(),)),

                                                                          if (item.product.id == 14 && item.selectedColor == hexToColor('#997370'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorgetsatan2(),)),

                                                                          if (item.product.id == 14 && item.selectedColor == hexToColor('#424856'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorgetsatan3(),)),

                                                                          if (item.product.id == 14 && item.selectedColor == hexToColor('#45493b'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorgetsatan4(),)),

                                                                          if (item.product.id == 14 && item.selectedColor == hexToColor('#625857'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorgetsatan5(),)),

                                                                          if (item.product.id == 14 && item.selectedColor == hexToColor('#634940'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorgetsatan6(),)),

                                                                          if (item.product.id == 14 && item.selectedColor == hexToColor('#3b3328'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorgetsatan7(),)),

                                                                          if (item.product.id == 14 && item.selectedColor == hexToColor('#fcfff8'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorgetsatan8(),)),

                                                                          if (item.product.id == 14 && item.selectedColor == hexToColor('#221411'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorgetsatan9(),)),

                                                                          if (item.product.id == 14 && item.selectedColor == hexToColor('#65332c'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidergorgetsatan10(),)),

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                                                          if (item.product.id == 15 && item.selectedColor == hexToColor('#a1a1ac'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottomskar1(),)),

                                                                          if (item.product.id == 15 && item.selectedColor == hexToColor('#968773'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottomskar2(),)),

                                                                          if (item.product.id == 15 && item.selectedColor == hexToColor('#b3959a'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottomskar3(),)),

                                                                          if (item.product.id == 15 && item.selectedColor == hexToColor('#4c5c89'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottomskar4(),)),

                                                                          if (item.product.id == 15 && item.selectedColor == hexToColor('#7c5667'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottomskar5(),)),

                                                                          if (item.product.id == 15 && item.selectedColor == hexToColor('#010000'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottomskar6(),)),

                                                                          if (item.product.id == 15 && item.selectedColor == hexToColor('#fcf4ff'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidercottomskar7(),)),

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                                                          if (item.product.id == 16 && item.selectedColor == hexToColor('#f2f2fa'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mksar(),)),

                                                                          if (item.product.id == 16 && item.selectedColor == hexToColor('#907868'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mksar1(),)),

                                                                         if (item.product.id == 16 && item.selectedColor == hexToColor('#6a6e7e'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mksar2(),)),


                                                                              if (item.product.id == 16 && item.selectedColor == hexToColor('#8e746e'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mksar3(),)),

                                                                             if (item.product.id == 16 && item.selectedColor == hexToColor('#755d59'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mksar4(),)),

                                                                          if (item.product.id == 16 && item.selectedColor == hexToColor('#694452'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mksar5(),)),

                                                                                if (item.product.id == 16 && item.selectedColor == hexToColor('#9b9887'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mksar6(),)),


                                                                                if (item.product.id == 16 && item.selectedColor == hexToColor('#100000'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mksar7(),)),

                                                                             if (item.product.id == 16 && item.selectedColor == hexToColor('#6f6865'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlikra_mksar8(),)),

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                                             if (item.product.id == 17 && item.selectedColor == hexToColor('#92868f'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlyorah_glutter(),)),


                                                                             if (item.product.id == 17 && item.selectedColor == hexToColor('#998062'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlyorah_glutter1(),)),


                                                                             if (item.product.id == 17 && item.selectedColor == hexToColor('#aa9987'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderlyorah_glutter2(),)),
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                                             if (item.product.id == 18 && item.selectedColor == hexToColor('#fffeff'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidertnora(),)),

                                                                             if (item.product.id == 18 && item.selectedColor == hexToColor('#000110'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidertnora1(),)),
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                                                             if (item.product.id == 19 && item.selectedColor == hexToColor('#f3f4f9'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderninja(),)),

                                                                             if (item.product.id == 19 && item.selectedColor == hexToColor('#110000'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderninja1(),)),

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                                      if (item.product.id == 20 && item.selectedColor == hexToColor('#f9f8f6'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderkapa_kamis(),)),

                                                                             if (item.product.id == 20 && item.selectedColor == hexToColor('#011000'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderkapa_kamis1(),)),
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                                      if (item.product.id == 21 && item.selectedColor == hexToColor('#fffffe'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderkapa_hinec(),)),

                                                                        if (item.product.id == 21 && item.selectedColor == hexToColor('#000001'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderkapa_hinec1(),)),
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                                                      if (item.product.id == 22 && item.selectedColor == hexToColor('#f5f6ff'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidermo3sam(),)),

                                                                        if (item.product.id == 22 && item.selectedColor == hexToColor('#100001'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidermo3sam1(),)),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                                     if (item.product.id == 23 && item.selectedColor == hexToColor('#f3f3fb'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidermo3sam_zm(),)),

                                                                        if (item.product.id == 23 && item.selectedColor == hexToColor('#010010'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newslidermo3sam_zm1(),)),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                                        if (item.product.id == 24 && item.selectedColor == hexToColor('#001001'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderhijab_tabake(),)),


                                                                        if (item.product.id == 24 && item.selectedColor == hexToColor('#595c74'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderhijab_tabake1(),)),                                                                          

                                                                        if (item.product.id == 24 && item.selectedColor == hexToColor('#1b1f4d'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderhijab_tabake2(),)),


                                                                        if (item.product.id == 24 && item.selectedColor == hexToColor('#f2f2f2'))
                                                                            ClipRRect(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12)),
                                                                            child: Container(
                                                                            height: _media.size.width*0.52, 
                                                                            width: _media.size.width*0.7,
                                                                          child: const newsliderhijab_tabake3(),)),
                                                                                              ]),
                                                    ),
                                                                          
                                                    
                                                
                                                    
                                                  ],
                                                ),
                                              ),
                                              
                                              // Product Details
                                              Expanded(
                                                flex: 3,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:  EdgeInsets.only(top: _media.size.width*0.05 ),
                                                      child: Container(width: _media.size.width*0.6,height: _media.size.width*0.1,color: Colors.amberAccent,
                                                        child: Center(
                                                          child: Text(
                                                            item.product.title,
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: _media.size.width*0.05,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: _media.size.width*0.02),
                                                    Padding(
                                                       padding:  EdgeInsets.only(right:_media.size.width*0.05, ),
                                                      child: Text(
                                                        'السعر: JD ${item.product.price.toStringAsFixed(2)}',
                                                        style: const TextStyle(fontFamily: 'Cairo'),
                                                      ),
                                                    ),
                                                 const SizedBox(height: 8),
                                                           Padding(
                                                            padding:  EdgeInsets.only(right:_media.size.width*0.05, ),
                                                             child: Row(
                                                                                                     children: [
                                                                                                       const Text('اللون المختار ', style: TextStyle(fontFamily: 'Cairo'),),
                                                                                                   Container(  width: _media.size.width*0.088,
                                                                                                       height: _media.size.width*0.088,
                                                                                                       decoration: const BoxDecoration(
                                                                                                         shape: BoxShape.circle,
                                                                                                         color: Colors.grey,
                                                                                                       ),
                                                                                                     child: Stack(alignment: Alignment.center,
                                                                                                       children: [
                                                                                                         Container(
                                                                                                           width: _media.size.width*0.08,
                                                                                                           height: _media.size.width*0.08,
                                                                                                           decoration: BoxDecoration(
                                                                                                             shape: BoxShape.circle,
                                                                                                             color: item.selectedColor,
                                                                                                           ),
                                                                                                          
                                                                                                         ),
                                                                                                       ],
                                                                                                     ),
                                                                                                   ),]),
                                                           ),
                                                    SizedBox(height: _media.size.width*.02),
                                                    Padding(
                                                      padding:  EdgeInsets.only(right:_media.size.width*0.02, ),
                                                      child: Row(
                                                        children: [
                                                                                  CircleAvatar(backgroundColor: Colors.red,
                                                                                    child: IconButton(color: Colors.white,
                                                                      icon: const Icon(Icons.delete),
                                                                      onPressed: () {
                                                                        // Find the index of the item in the cart
                                                                        final existingCartItemIndex = cartProvider.cartItems.indexWhere(
                                                                      (cartItem) =>
                                                                                    cartItem.product.id == item.product.id &&
                                                                                    cartItem.selectedColor == item.selectedColor,
                                                                        );
                                                                    
                                                                        if (existingCartItemIndex != -1) {
                                                                      // If the item with the same color exists in the cart, remove it
                                                                      cartProvider.cartItems.removeAt(existingCartItemIndex);
                                                                      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                                                                      cartProvider.notifyListeners(); // Notify listeners to update the UI
                                                                        }
                                                                      },
                                                                    ),
                                                                                  ),
                                                                       
                                                                       
                                                           Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.white),margin: EdgeInsets.only(right: _media.size.width*0.04),
                                                             child: Row(children:[
                                                           
                                                                           IconButton(
                                                             icon: const Icon(Icons.remove),
                                                             onPressed: () {
                                                               // Find the index of the item in the cart
                                                               final existingCartItemIndex = cartProvider.cartItems.indexWhere(
                                                                 (cartItem) =>
                                                                     cartItem.product.id == item.product.id &&
                                                                     cartItem.selectedColor == item.selectedColor,
                                                               );
                                                                       
                                                               if (existingCartItemIndex != -1) {
                                                                 // If the item with the same color exists in the cart
                                                                 if (cartProvider.cartItems[existingCartItemIndex].quantity > 1) {
                                                                   // If the quantity is greater than 1, decrease it
                                                                   cartProvider.cartItems[existingCartItemIndex].quantity--;
                                                                   // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                                                                   cartProvider.notifyListeners(); // Notify listeners to update the UI
                                                                 }
                                                                 // else, do nothing or show a message indicating that the quantity cannot be decreased further
                                                               }
                                                             },
                                                                       ),
                                                                              
                                                                                                         Text(
                                                              item.quantity.toString(),
                                                              style: const TextStyle(fontSize: 18),
                                                                                                         ),
                                                                                                         IconButton(
                                                                                icon: const Icon(Icons.add),
                                                                                onPressed: () {
                                                                                  // Find the index of the item in the cart
                                                                                  final existingCartItemIndex = cartProvider.cartItems.indexWhere(
                                                                                (cartItem) =>
                                                                                    cartItem.product.id == item.product.id &&
                                                                                    cartItem.selectedColor == item.selectedColor,
                                                                                  );
                                                                              
                                                                                  if (existingCartItemIndex != -1) {
                                                                                // If the item with the same color exists in the cart, update its quantity
                                                                                cartProvider.cartItems[existingCartItemIndex].quantity++;
                                                                                // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                                                                                cartProvider.notifyListeners(); // Notify listeners to update the UI
                                                                                  } else {
                                                                                // If the item with the selected color does not exist, add it to the cart
                                                                                cartProvider.addToCart(item.product);
                                                                                  }
                                                                                },
                                                                              ),
                                                                                                 ]),
                                                           )          
                                                        ],
                                                      ),
                                                    ),
                                                 
                                                
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
           
                                                ],
                                ),
                      ),
                    ],
                  ),
                ],
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
}
class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  // Key for storing cart data in shared preferences
  static const String cartKey = 'cart_key';

  CartProvider() {
    // Load cart data from shared preferences when the provider is instantiated
    _loadCartFromPreferences();
  }

  void _loadCartFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartData = prefs.getString(cartKey) ?? '[]';

    List<dynamic> decodedCart = jsonDecode(cartData);
    _cartItems = decodedCart.map((item) => CartItem.fromJson(item)).toList();
    notifyListeners();
  }

  void _saveCartToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartData = jsonEncode(_cartItems);
    prefs.setString(cartKey, cartData);
  }

  void addToCart(Product product) {
    final existingCartItemIndex = _cartItems.indexWhere(
      (cartItem) =>
          cartItem.product.id == product.id &&
          cartItem.selectedColor == product.selectedColor,
    );

    if (existingCartItemIndex != -1) {
      _cartItems[existingCartItemIndex].quantity++;
    } else {
      final cartItem = CartItem(
        product: product,
        quantity: 1,
        selectedColor: product.selectedColor,
      );
      _cartItems.add(cartItem);
    }

    _saveCartToPreferences();
    notifyListeners();
  }

  void removeFromCart(Product product) {
    final existingProductIndex =
        _cartItems.indexWhere((item) => item.product.id == product.id && item.selectedColor == product.selectedColor);

    if (existingProductIndex != -1) {
      final existingProduct = _cartItems[existingProductIndex];

      if (existingProduct.quantity > 1) {
        // If the quantity is greater than 1, decrease it
        existingProduct.quantity--;
      } else {
        // If the quantity is 1, remove the product from the cart
        _cartItems.removeAt(existingProductIndex);
      }
      _saveCartToPreferences();
      notifyListeners();
    }
  }

  void updateProductColor(Product product, Color newColor) {
    removeFromCart(product);

    final updatedProduct = Product(
      id: product.id,
      title: product.title,
      image: product.image,
      images: product.images,
      price: product.price,
      subtiltle: product.subtiltle,
      selectedColor: newColor,
    );

    addToCart(updatedProduct);
  }

  void clearCart() {
    _cartItems.clear();
    _saveCartToPreferences();
    notifyListeners();
  }
}


class CartItem {
  final Product product;
  final Color selectedColor;
  int quantity;

  CartItem({
    required this.product,
    required this.selectedColor,
    this.quantity = 1,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Product.fromJson(json['product']),
      selectedColor: Color(json['selectedColor']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'selectedColor': selectedColor.value,
      'quantity': quantity,
    };
  }
}

class CircularCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CircularCheckBox({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Combine border and fill colors for a more cohesive look (optional)
    final Color fillColor = value ? Colors.black : Colors.transparent;
    final Color borderColor = value ? Colors.black : Colors.grey;

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fillColor, // Use fillColor for background
          border: Border.all(
            width: 2.0,
            color: borderColor,
          ),
        ),
        child: Center(
          child: value
              ? const Icon(
                  Icons.check,
                  size: 18.0,
                  color: Colors.white,
                )
              : null,
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
