
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harir/hijab/hijabdetails.dart';
import 'package:harir/mkmlat/mkmlatdetails.dart';

import 'package:harir/other/cart.dart';
import 'package:harir/shalat/details.dart';
import 'package:harir/shalat/product.dart';

import 'package:provider/provider.dart';




class mkmlatviewer extends StatefulWidget {
  
  const mkmlatviewer({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<mkmlatviewer> createState() => _mkmlatviewerState();
}

class _mkmlatviewerState extends State<mkmlatviewer> {

void showSuccessDialog(BuildContext context) {
AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.success,
            body: CustomMediaQuery(
              child: const Center(child: Text(
                      'لقد قمت بإضافة المنتج إلى السلة بنجاح',
                      style: TextStyle(fontFamily: 'Cairo'),
                    ),),
            ),
            btnOkOnPress: () {},
            ).show();}

void showerrorDialog(BuildContext context) {
  
    final _media = MediaQuery.of(context);
  AwesomeDialog(
    context: context,
    animType: AnimType.rightSlide,
    dialogType: DialogType.error,
    body: CustomMediaQuery(
      child: Container(
        height: _media.size.width*0.3,
        child: Column(
          children: [
          Center(
              child: Text(
                'لم تقم بتسجيل الدخول هل تريد ذلك ؟ ',
                style: TextStyle(fontFamily: 'Cairo',fontSize: _media.size.width*0.04),
              ),
            ),
            SizedBox(height: _media.size.width*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'Signupscreen');
                  },
                  child: Text(
                    'موافق',
                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(hexToColor('#9C0945'),),
                  ),
                ),
                SizedBox(width: 25,), // Adjust spacing between buttons
                TextButton(
                  onPressed: () {Navigator.pop(context);},
                  child: Text(
                    'إلغاء',
                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white),
                  ),
                  style: ButtonStyle(
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

Future<bool> isColorArrayEmpty() async {
  try {
    DocumentSnapshot productDoc = await FirebaseFirestore.instance.collection('product').doc('1RyrfdWPCEGgqOxXj9VC').get();

    // Check if the document exists and the 'colors' array is present
    if (productDoc.exists && productDoc.data() != null) {
      // Explicitly cast to Map<String, dynamic>
      Map<String, dynamic>? data = productDoc.data() as Map<String, dynamic>?;

      // Check if the 'colors' array is present and empty
      return data?['color'] is List && (data?['color'] as List).isEmpty;
    } else {
      // Document or 'colors' array is not present
      return true;
    }
  } catch (e) {
    // Handle any errors that may occur during the Firestore operation
    print("Error: $e");
    return true;
  }
}



void showerrorDialog1(BuildContext context) {
  
    final _media = MediaQuery.of(context);
  AwesomeDialog(
    context: context,
    animType: AnimType.rightSlide,
    dialogType: DialogType.error,
    body: CustomMediaQuery(
      child: Container(
        height: _media.size.width*0.3,
        child: Column(
          children: [
          Center(
              child: Text(
                'للأسف هذا المنتج لم يعد متوفر ',
                style: TextStyle(fontFamily: 'Cairo',fontSize: _media.size.width*0.04),
              ),
            ),
            SizedBox(height: _media.size.width*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'firstone');
                  },
                  child: Text(
                    'موافق',
                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
                  ),
                ),
                SizedBox(width: 25,), // Adjust spacing between buttons
                TextButton(
                  onPressed: () {Navigator.pop(context);},
                  child: Text(
                    'إلغاء',
                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
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

  @override
  Widget build(BuildContext context) {

    final _media = MediaQuery.of(context);
    return CustomMediaQuery(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                      if(widget.product.id == 18)
        dottnora(product: widget.product, // Pass the correct product
         onColorChanged: (newColor) { widget.product.updateSelectedColor( newColor);}),

            


                      if(widget.product.id == 20)
        dotkapa_kamis(product: widget.product, // Pass the correct product
         onColorChanged: (newColor) { widget.product.updateSelectedColor(newColor);}),

                      if(widget.product.id == 21)
        dotkapa_hinec(product: widget.product, // Pass the correct product
         onColorChanged: (newColor) { widget.product.updateSelectedColor(newColor);}),

                    if(widget.product.id == 22)
        dotmo3sam(product: widget.product, // Pass the correct product
         onColorChanged: (newColor) { widget.product.updateSelectedColor(newColor);}),

          if(widget.product.id == 23)
        dotmo3sam_zm(product: widget.product, // Pass the correct product
         onColorChanged: (newColor) { widget.product.updateSelectedColor(newColor);}),
                      if(widget.product.id == 19)
                    dotninja(product: widget.product, // Pass the correct product
         onColorChanged: (newColor) { widget.product.updateSelectedColor(newColor);}),
                      if(widget.product.id == 24)
        dothijab_tabake(product: widget.product, // Pass the correct product
         onColorChanged: (newColor) { widget.product.updateSelectedColor(newColor);}),



          Stack(children: [   
             Container(
               height: _media.size.width * 0.85,
               decoration: const BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(topLeft:Radius.circular(40),
                 topRight: Radius.circular(40),
                )
               ),
                  child: Stack(
                   children: [
            
             
                  Container(height: _media.size.width*0.1,width: _media.size.width*1,
                    margin: EdgeInsets.only(top: _media.size.width*0.02),
                    child: Center(
                      child: Text(' الإسم :${widget.product.title}',
                      style: TextStyle(
                      fontFamily: 'Cario',
                      fontSize: _media.size.width*0.063,
                    
                      color: Colors.black,
                      ),
                      ),
                    ),
                  ),
              
            Container(margin: EdgeInsets.only(top: _media.size.width*0.11,right: _media.size.width*0.02),
              child: Text('وصف المنتج :',
               style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: _media.size.width*0.055,
              color: Colors.black,
              

               ),
               ),
            ),
              
              
             
               Container(margin: EdgeInsets.only(top: _media.size.width*0.22,right: _media.size.width*0.02,left: _media.size.width*0.01),
                 child: Text( widget.product.subtiltle,
                                style: TextStyle(
                 fontFamily: 'Cairo',
                 fontSize: _media.size.width*0.045,
                 color: Colors.black,
                 
                             
                 ),),
               ),
              
                        Container(margin: EdgeInsets.only(top: _media.size.width*0.63,right: _media.size.width*0.05),
                          child: Text(
                              'السعر : JD ${widget.product.price.toStringAsFixed(2)}', // Format the double as a string with 2 decimal places
                              style: TextStyle(
                              color: const Color.fromARGB(255, 171, 102, 0),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                              fontSize: _media.size.width*0.05
                              ),
                            ),
                        ),
              
               
             
              
                   
                 ],
               )
              ),
              
               
             
              
             
                            
    
                // Add to Cart Button
                Container(margin: EdgeInsets.only(top: _media.size.width*0.6,right: _media.size.width*0.4),
                  child: Center(
                   
                child :ElevatedButton(
                onPressed: () async {
                  final cartProvider = context.read<CartProvider>();
                final user = FirebaseAuth.instance.currentUser;
                
            
              if (user != null && !user.isAnonymous) {
                cartProvider.addToCart(widget.product);
                                   

                showSuccessDialog(context);
              } else {
                showerrorDialog(context);
              }
            
          },
                   style: ButtonStyle( fixedSize: MaterialStateProperty.all<Size>( Size(_media.size.width *0.45, _media.size.width *0.15, ) ), backgroundColor: MaterialStateProperty.all<Color>(hexToColor('#9C0945'),),),
                  child:  Center(child: Text('اضف إلى السلة ',style: TextStyle(fontSize: _media.size.width*0.04,fontWeight: FontWeight.bold),)),
                )
                  ),
                ),
              ],
            ),
       ]   ),
        ),
      )
     ),
    ); }
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

