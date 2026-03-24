import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:harir/other/bottom.dart';
import 'package:harir/shalat/details.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
class check_oreder extends StatefulWidget {
  @override
  State<check_oreder> createState() => _check_orederState();
}
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late Timer _timer;
class _check_orederState extends State<check_oreder> {

    @override
  void initState() {
    super.initState();
      
  _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 5), () async {
      // Check for internet connectivity
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        // Internet is available, show the snackbar
       
      } else {
        // Internet is not available, restart the timer
         showSnackbar();
      }
    });
  }
   Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  void showSnackbar() {
    final snackBar = SnackBar(
      content: Text(
        'تحقق من اتصالك بالإنترنت',
        style: TextStyle(fontFamily: 'Cairo'),
      ),
      backgroundColor: Colors.red,
    );

    // Find the Scaffold in the widget tree and use it to show a SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

    void _showDeleteDialog(BuildContext context) {

    final _media = MediaQuery.of(context);
  AwesomeDialog(
    context: context,
    animType: AnimType.rightSlide,
    dialogType: DialogType.info,
    body: CustomMediaQuery(
      child: Container(
        height: _media.size.width*0.3,
        child: Column(
          children: [
          Center(
              child: Text(
                'هل انت متأكد من حذف طلبك ؟',
                style: TextStyle(fontFamily: 'Cairo',fontSize: _media.size.width*0.04),
              ),
            ),
            SizedBox(height: _media.size.width*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                   _deleteOrder();
                   Navigator.pop(context);
                  },
                  child: Text(
                    'موافق',
                    style: TextStyle(fontFamily: 'Cairo', color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(hexToColor('#9C0945'),),
                  ),
                ),
                SizedBox(width: _media.size.width*0.05,), // Adjust spacing between buttons
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
  ).show();
  }

    void _deleteOrder() {
    // Perform the deletion logic here
    // You can use _auth.currentUser?.uid to get the user's UID
     _firestore.collection('orders').doc(_auth.currentUser?.uid).delete();
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
 
  @override
  Widget build(BuildContext context) {
        var _media = MediaQuery.of(context);

    return WillPopScope(
           onWillPop: () async {
        // Handle back navigation here
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavigationBarWidget()), // Navigate back to the profile page
        );
        return false; // Prevent default back navigation
      },
      child: Scaffold(
      backgroundColor: hexToColor('#9C0945'),
        body: CustomMediaQuery(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                        Padding(
                        padding: EdgeInsets.only(
                           top: _media.size.width *0.1, ),
                        child: Center(
                          child: Text(
                            'تتبع حالة الطلب ',
                            style: TextStyle(
                                  color:hexToColor('#ffffff'),
                              fontSize: _media.size.width * 0.09,
                              fontFamily: 'ReemKufi',
                            ),
                          ),
                        ),
                      ),
                 
                      
                        Container(decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25)),
                        ),
                        margin: EdgeInsets.only(top: _media.size.width * 0.3),
                        width: _media.size.width*1,
                      height: _media.size.width*2,
                          child: StreamBuilder(
                            stream: _firestore.collection('orders').doc(_auth.currentUser?.uid).snapshots(),
                            builder: (context, snapshot) {
                                   if (!snapshot.hasData) {
                                // If there is no data yet, you can show a loading indicator
                                return CircularProgressIndicator();
                          }
                              var orderData = snapshot.data!.data();
                              var orderDetails = orderData?['orderDetails'];
                                if (orderDetails == null || orderDetails.isEmpty) {
                          return Column(mainAxisAlignment: MainAxisAlignment.center,  
                                 children: [
                                  Center(child: Container(child: Icon(Icons.event_note,size: _media.size.width *0.4,)))
                                  ,SizedBox(height: _media.size.width *0.08,)
                                  ,CustomMediaQuery(child: Text('ليس هنالك أي طلب ',style: TextStyle(fontFamily: 'Cairo',fontSize: _media.size.width *0.07),))
                                  ,SizedBox(height: _media.size.width *0.35,)
                                ],);
                                }
                              
                              // Now you can work with the order details array
                              // For example, let's print product names, prices, and images
                              
                              return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                padding: EdgeInsets.only(top: _media.size.width*0.05 ,bottom: _media.size
                                .width*0.08),
                                itemCount: orderDetails.length,
                                itemBuilder: (context, index) {
                                 var product = orderDetails[index];
                                 var productName = product['productName'] ?? 'Unknown Product';
                                 var price = product['totalPrice'] ?? 'N/A';
                                 var imageUrl = product['image'] ?? 'https://example.com/default-image.jpg';
                                 var quantity = product['quantity'] ?? '2';
                                 var orderState = product['orderstate'] ?? 'gfgf';
                                 return 
                                  
                                   Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: _media.size.width*0.04),
                                        child: Container(height: _media.size.width *0.56,width: _media.size.width *0.9,margin: EdgeInsets.only(bottom: _media.size.width *0.03,),
                                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5),spreadRadius: 10, blurRadius: 7, offset: Offset(0, 3),), ],),
                                          child: Stack(children:[ 
                                            Container(height: _media.size.width *0.8,width: _media.size.width *0.5,child: ClipRRect( borderRadius:BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)), 
                                            child: Stack(
                                                children: [
                                             //  snapshot.connectionState != ConnectionState.waiting && snapshot.hasData && imageUrl != null
                                         //       Center(child:  LoadingAnimationWidget.staggeredDotsWave(color: hexToColor('#9C0945'),size: _media.size.width*.15)),
                                                
                                                Container( height: _media.size.width*1,width: _media.size.width*0.5,  child: CachedNetworkImage(fit: BoxFit.cover,
                                                             imageUrl: imageUrl,
                                                             placeholder: (context, url) => Center(child:  LoadingAnimationWidget.staggeredDotsWave(color: hexToColor('#9C0945'),size: _media.size.width*.15)),
                                                             errorWidget: (context, url, error) => Icon(Icons.error),
                                                             cacheKey: imageUrl, // Unique key for each image
                                                             cacheManager: DefaultCacheManager(), // Use default cache manager
                                                             // Optional customizations:
                                                             // - fadeOutDuration: Duration(milliseconds: 500), // Fade-out animation
                                                             // - fadeInDuration: Duration(milliseconds: 300), // Fade-in animation
                                                             // - fit: BoxFit.cover, // Adjust image fit within container
                                                           ),
                                                ),
                                                ],
                                                ),),),
                                            Container(margin: EdgeInsets.only(right: _media.size.width*0.5,top: _media.size.width*0.02),width: _media.size.width*0.4,height: _media.size.width*0.15,
                                              child: CustomMediaQuery(child: Center(child: FittedBox(fit: BoxFit.fitWidth,
                                                child: Text(productName,style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.05)))))),
                                              Container(width:_media.size.width*0.3,height: _media.size.width*0.2,margin: EdgeInsets.only(top: _media.size.width*0.245,right: _media.size.width*0.54),
                                                child: CustomMediaQuery(child: Text('السعر: $price',style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.045))))
                                             , Container(width:_media.size.width*0.3,height: _media.size.width*0.2,margin: EdgeInsets.only(top: _media.size.width*0.17,right: _media.size.width*0.54),
                                              child: CustomMediaQuery(child: Text('الكمية : $quantity',style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.045)))), 
                                              Container(margin: EdgeInsets.only(right: _media.size.width*0.52,top: _media.size.width*0.33),width: _media.size.width*0.4,height: _media.size.width*0.15,
                                              child: CustomMediaQuery(child: Text('الحالة :',style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.045)))), 
                                   
                                             Container(height: _media.size.width*0.1,margin: EdgeInsets.only(top: _media.size.width*0.42,right: _media.size.width*0.5),
                                               child: CustomMediaQuery(child: Container(width: _media.size.width*0.40,decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(3))),
                                                 child: Center(child: Text(' $orderState',style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.045))))),
                                             )
                                              
                                              
                                    
                                              ])),
                                      ),
                                    
                                    ],
                                
                                 );
                                },
                              );
                          
                            },
                           
                          ),
                        ),
                      
                    ],
                
                  ),
                 
                                   ],
              ),
            ),
          ),
        ),
      
      
            floatingActionButton: DraggableFab(
              child: FloatingActionButton(
                backgroundColor: hexToColor('#9C0945'),
                    onPressed: () async{  Future<bool> isConnected = checkConnectivity(); 

         if(await isConnected == true){
              _showDeleteDialog(context);}
              else{
               showDisconnectedMessage();
              }
                    },
                    child: const Icon(Icons.delete),
                  ),
            ),
             
      
      ),
    );

  }
    @override
  void dispose() {
    // Dispose the timer to avoid memory leaks
    _timer.cancel();
    super.dispose();
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
