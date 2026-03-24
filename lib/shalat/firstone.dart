import 'package:flutter/material.dart';
import 'package:harir/shalat/details.dart';
import 'package:harir/shalat/shalatviewer.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'product.dart';

class firstone extends StatefulWidget {
  const firstone({Key? key, required this.press}) : super(key: key);

  final VoidCallback press;

  @override
  State<firstone> createState() => _firstoneState();
}

class _firstoneState extends State<firstone> {
  late Future<void> _dataLoading; // Use Future to simulate data loading

  @override
  void initState() {
    super.initState();
    _dataLoading = fetchData(); // Simulate loading data
  }

  Future<void> fetchData() async {
    // Simulate loading delay
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
     final _media = MediaQuery.of(context);
    return CustomMediaQuery(
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
                       top: _media.size.width *0.06, ),
                    child: Center(
                      child: Text(
                        'الشالات ',
                        style: TextStyle(
                           color: Colors.white,
                          fontSize: _media.size.width * 0.1,
                          fontFamily: 'ReemKufi',
                        ),
                      ),
                    ),
                  ),
            
                      Container(
                                              decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12)),
                    ),
                      margin: EdgeInsets.only(top: _media.size.width*0.25),
                    width: _media.size.width*1,
            
            
            
                        child: Column(
                          children: [
                            FutureBuilder<void>(
                              future: _dataLoading,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return   Container(height: _media.size.width*2,width: _media.size.width*1,
                                    child: Center(child: LoadingAnimationWidget.staggeredDotsWave(color: hexToColor('#9C0945'),size: _media.size.width*.15)));
                                } else {
                                  return Padding(
                                    padding: EdgeInsets.only(top: _media.size.width*0.03),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: _media.size.width*0.025,
                                        crossAxisSpacing: _media.size.width*.015,
                                        crossAxisCount: 2,
                                      ),
                                      itemCount: 17,
                                      itemBuilder: (context, index) {
                                        final product = shalatProducts[index];
                                        return almontg(
                                          itemIndex: index,
                                          product: product,
                                          press: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    shalatviewer(product: product),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  );
                                }
                              },
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

class almontg extends StatelessWidget {
  const almontg({
    Key? key,
    required this.itemIndex,
    required this.product,
    required this.press,
  }) : super(key: key);

  final int itemIndex;
  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
      var _media = MediaQuery.of(context);
    return InkWell(
      onTap: press,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(product.image),
                fit: BoxFit.cover,
              ),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 15),
                  blurRadius: 35,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Container( margin: EdgeInsets.only(top: _media.size.width*0.31),
          height: _media.size.width*0.25,width: _media.size.width*1,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding:  EdgeInsets.only(right: _media.size.width*0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style:  TextStyle(
                      color: Colors.white,
                      fontFamily: 'Cairo',
                      fontSize: _media.size.width*0.045,
                      
                    ),
                  ),
                Text(
              'السعر : JD ${product.price.toStringAsFixed(2)}', // Format the double as a string with 2 decimal places
              style: TextStyle(
                color: Colors.white,
             
                fontFamily: 'Cairo',
                fontSize: _media.size.width*0.038
              ),
            )
            
            
            
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


