import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class admin extends StatefulWidget {
  @override
  State<admin> createState() => _adminState();
}
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

class _adminState extends State<admin> {


    void _showDeleteDialog(BuildContext context) {
   AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.info,
            body: CustomMediaQuery(
              child: const Center(child: Text(
                      'هل انت متأكد من حذف طلبك ',
                      style: TextStyle(fontFamily: 'Cairo'),
                    ),),
            ),
          //  btnOkOnPress: _deleteOrder,
            btnCancelOnPress: () {
            
            },
            ).show();
  }

  //  void _deleteOrder() {
    // Perform the deletion logic here
    // You can use _auth.currentUser?.uid to get the user's UID
    // _firestore.collection('orders').doc(_auth.currentUser?.uid).delete();
  //}

 
  @override
  Widget build(BuildContext context) {
        var _media = MediaQuery.of(context);
   
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Center(child: CustomMediaQuery(child: Text('طلباتنا',style: TextStyle(fontFamily: 'Cairo'),))),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: _firestore.collection('orders').snapshots(),
          builder: (context, snapshot) {
           
            var orderData = snapshot.data!.docs;
            var orderDetails = orderData[0].data()['orderDetails'];
             if (orderDetails == null || (orderDetails is List && orderDetails.isEmpty)) {
        return Column(mainAxisAlignment: MainAxisAlignment.center,  
               children: [
                Center(child: Container(child: Icon(Icons.event_note,size: _media.size.width *0.4,)))
                ,SizedBox(height: _media.size.width *0.08,)
                ,Text('لا يوجد لدينا طلبات ',style: TextStyle(fontFamily: 'Cairo',fontSize: _media.size.width *0.07),)
                ,SizedBox(height: _media.size.width *0.35,)
              ],);
      }
            
            // Now you can work with the order details array
            // For example, let's print product names, prices, and images
          
            return ListView.builder(
              itemCount: orderDetails.length,
              itemBuilder: (context, index) {

               var product = orderDetails[index];
               var productName = product['productName'] ?? 'Unknown Product';
               var price = product['totalPrice'] ?? 'N/A';
               var imageUrl = product['image'] ?? 'https://example.com/default-image.jpg';
               var quantity = product['quantity'] ?? '2';
               var orderState = product['orderstate'] ?? 'gfgf';
               var email = product['email'] ?? 'sy';
               var name = product['name']?? 'name';
               var phone = product['phone']?? 'null';
               var location = product ['location']?? 'null';
               var selectedCity = product['selectedCity']?? 'null';
               var paymentOption = product['paymentOption']?? 'null';
               var userId = product['userId']?? 'null';
               return SingleChildScrollView(
                 child: Column(
                  children: [
                    Container(height: _media.size.width *0.95,width: _media.size.width *0.9,margin: EdgeInsets.only(top: _media.size.width *0.06),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5),spreadRadius: 10, blurRadius: 7, offset: Offset(0, 3),), ],),
                      child: Stack(children:[ 
                        Container(height: _media.size.width *0.8,width: _media.size.width *0.5,child: ClipRRect( borderRadius:BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)), 
                        child: Stack(
                            children: [
                              if (snapshot.connectionState == ConnectionState.waiting)
                            Center(
                              child: LoadingAnimationWidget.flickr(
                                leftDotColor: Colors.blue,
                                rightDotColor: Colors.purpleAccent,
                                size: 50,
                              ),
                            ),
                              if (snapshot.connectionState != ConnectionState.waiting && snapshot.hasData && imageUrl != null)
                            Image.network(imageUrl),
                            ],
                            ),),),
                          Positioned(top: _media.size.width*0.02,left: _media.size.width *0.15,
                          child: CustomMediaQuery(child: Text(productName,style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.065)))),
                          Positioned(top: _media.size.width*0.25,left: _media.size.width *0.18,
                          child: CustomMediaQuery(child: Text('السعر: $price',style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.045))))
                         , Positioned(top: _media.size.width*0.18,left: _media.size.width *0.18,
                          child: CustomMediaQuery(child: Text('الكمية : $quantity',style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.045)))), 
                          Positioned(top: _media.size.width*0.4,left: _media.size.width *0.03,
                          child: CustomMediaQuery(child: Text('الحالة: $orderState',style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.04)))),     
                          Positioned(top: _media.size.width*0.57,left: _media.size.width *0.04,
                          child: CustomMediaQuery(child: Text('email: $email',style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.045)))), 
                          Positioned(top: _media.size.width*0.5,left: _media.size.width *0.04,
                          child: CustomMediaQuery(child: Text('name: $name',style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.045)))), 
                           Positioned(top: _media.size.width*0.64,left: _media.size.width *0.04,
                          child: CustomMediaQuery(child: Text('phone: $phone',style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.045)))), 
                           Positioned(top: _media.size.width*0.71,left: _media.size.width *0.04,
                          child: CustomMediaQuery(child: Text('الموقع: $location',style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.045)))), 
                           Positioned(top: _media.size.width*0.78,left: _media.size.width *0.04,
                          child: CustomMediaQuery(child: Text('المدينة: $selectedCity',style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.045)))), 
                           Positioned(top: _media.size.width*0.78,left: _media.size.width *0.35,
                          child: CustomMediaQuery(child: Text('الدفع: $paymentOption',style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.045)))), 
                            Positioned(top: _media.size.width*0.86,left: _media.size.width *0.03,
                          child: CustomMediaQuery(child: Text('userid: $userId',style: TextStyle(fontFamily: 'cairo',fontSize: _media.size.width *0.043)))), 
                          ]))
                         
                  ],
                 ),
               );
              },
            );
    
          },
         
        ),
      ),
        //  floatingActionButton: DraggableFab(
          //  child: FloatingActionButton(
            //      onPressed: () {
           // _showDeleteDialog(context);
          //        },
               //  child: Icon(Icons.delete),
             //   ),
         // ),
           );
  }
   void _updateOrderState(String orderId, String newOrderState) {
    _firestore.collection('orders').doc(orderId).update({
      'orderstate': newOrderState,
    }).then((_) {
      print('Order state updated successfully');
    }).catchError((error) {
      print('Error updating order state: $error');
    });}
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
