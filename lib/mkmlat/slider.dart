import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:harir/shalat/details.dart';
import 'package:harir/shalat/slider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class newslidertnora extends StatefulWidget {
  const newslidertnora
  ({Key? key}) : super(key: key);

  @override
  State<newslidertnora> createState() => _newslidertnoraState();
}
class _newslidertnoraState extends State<newslidertnora> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/tnora%2F2024_03_18_22_16_IMG_8173.JPG?alt=media&token=a2a97ea9-79f8-4dd6-925b-d01e242c5ee8';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/tnora%2F2024_03_18_22_16_IMG_8173.JPG?alt=media&token=a2a97ea9-79f8-4dd6-925b-d01e242c5ee8',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}




class newslidertnora1 extends StatefulWidget {
  const newslidertnora1
  ({Key? key}) : super(key: key);

  @override
  State<newslidertnora1> createState() => _newslidertnora1State();
}
class _newslidertnora1State extends State<newslidertnora1> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/tnora%2F2024_03_18_22_27_IMG_8179.JPG?alt=media&token=3be28754-dda0-4e01-b95e-966cd77d9e72';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/tnora%2F2024_03_18_22_27_IMG_8179.JPG?alt=media&token=3be28754-dda0-4e01-b95e-966cd77d9e72',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}
 
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 class newsliderninja extends StatefulWidget {
  const newsliderninja
  ({Key? key}) : super(key: key);

  @override
  State<newsliderninja> createState() => _newsliderninjaState();
}
class _newsliderninjaState extends State<newsliderninja> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/ninja%2F2024_03_18_23_31_IMG_8201.JPG?alt=media&token=dea3d084-f164-420e-a971-901791faf9fd';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/ninja%2F2024_03_18_23_31_IMG_8201.JPG?alt=media&token=dea3d084-f164-420e-a971-901791faf9fd',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}


 class newsliderninja1 extends StatefulWidget {
  const newsliderninja1
  ({Key? key}) : super(key: key);

  @override
  State<newsliderninja1> createState() => _newsliderninja1State();
}
class _newsliderninja1State extends State<newsliderninja1> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/ninja%2F2024_03_18_23_41_IMG_8202.JPG?alt=media&token=f7677152-1c01-48fd-8bde-26240fbc003d';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/ninja%2F2024_03_18_23_41_IMG_8202.JPG?alt=media&token=f7677152-1c01-48fd-8bde-26240fbc003d',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}
////////////////////////////////////////////////////////////////////////////////////////


 class newsliderkapa_kamis extends StatefulWidget {
  const newsliderkapa_kamis
  ({Key? key}) : super(key: key);

  @override
  State<newsliderkapa_kamis> createState() => _newsliderkapa_kamisState();
}
class _newsliderkapa_kamisState extends State<newsliderkapa_kamis> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kapa%20kamis%2F2024_03_18_22_53_IMG_8187.JPG?alt=media&token=814c9db4-ac8d-4c33-b9a8-ac3255b5370c';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kapa%20kamis%2F2024_03_18_22_53_IMG_8187.JPG?alt=media&token=814c9db4-ac8d-4c33-b9a8-ac3255b5370c',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}



 class newsliderkapa_kamis1 extends StatefulWidget {
  const newsliderkapa_kamis1
  ({Key? key}) : super(key: key);

  @override
  State<newsliderkapa_kamis1> createState() => _newsliderkapa_kamis1State();
}
class _newsliderkapa_kamis1State extends State<newsliderkapa_kamis1> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kapa%20kamis%2F2024_03_18_23_12_IMG_8195.JPG?alt=media&token=dc2b42c2-07c7-4a67-b82d-5db5ba63fb5f';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kapa%20kamis%2F2024_03_18_23_12_IMG_8195.JPG?alt=media&token=dc2b42c2-07c7-4a67-b82d-5db5ba63fb5f',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

 class newsliderkapa_hinec extends StatefulWidget {
  const newsliderkapa_hinec
  ({Key? key}) : super(key: key);

  @override
  State<newsliderkapa_hinec> createState() => _newsliderkapa_hinecState();
}
class _newsliderkapa_hinecState extends State<newsliderkapa_hinec> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kapa_hinek%2F2024_03_18_22_33_IMG_8183.JPG?alt=media&token=5663e74e-f94e-440b-a0a6-d28f8d076adb';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kapa_hinek%2F2024_03_18_22_33_IMG_8183.JPG?alt=media&token=5663e74e-f94e-440b-a0a6-d28f8d076adb',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}

 class newsliderkapa_hinec1 extends StatefulWidget {
  const newsliderkapa_hinec1
  ({Key? key}) : super(key: key);

  @override
  State<newsliderkapa_hinec1> createState() => _newsliderkapa_hinec1State();
}
class _newsliderkapa_hinec1State extends State<newsliderkapa_hinec1> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kapa_hinek%2F2024_03_18_22_44_IMG_8186.JPG?alt=media&token=5b8e5492-3ee2-4dc7-a923-9661cab97a2e';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kapa_hinek%2F2024_03_18_22_44_IMG_8186.JPG?alt=media&token=5b8e5492-3ee2-4dc7-a923-9661cab97a2e',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}

//////////////////////////////////////////////////////////////////////////////////

 class newslidermo3sam extends StatefulWidget {
  const newslidermo3sam
  ({Key? key}) : super(key: key);

  @override
  State<newslidermo3sam> createState() => _newslidermo3samState();
}
class _newslidermo3samState extends State<newslidermo3sam> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mo3sam%20zrar%2F2024_03_18_21_46_IMG_8156.JPG?alt=media&token=370e67bb-b9b5-405a-9e76-8d24a03379b9';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mo3sam%20zrar%2F2024_03_18_21_46_IMG_8156.JPG?alt=media&token=370e67bb-b9b5-405a-9e76-8d24a03379b9',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}



 class newslidermo3sam1 extends StatefulWidget {
  const newslidermo3sam1
  ({Key? key}) : super(key: key);

  @override
  State<newslidermo3sam1> createState() => _newslidermo3sam1State();
}
class _newslidermo3sam1State extends State<newslidermo3sam1> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mo3sam%20zrar%2F2024_03_18_21_40_IMG_8154.JPG?alt=media&token=a6b4a278-782f-4ff3-a300-c7380fbcb492';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mo3sam%20zrar%2F2024_03_18_21_40_IMG_8154.JPG?alt=media&token=a6b4a278-782f-4ff3-a300-c7380fbcb492',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}

////////////////////////////////////////////////////////////////////////////////////////

class newslidermo3sam_zm extends StatefulWidget {
  const newslidermo3sam_zm
  ({Key? key}) : super(key: key);

  @override
  State<newslidermo3sam_zm> createState() => _newslidermo3sam_zmState();
}
class _newslidermo3sam_zmState extends State<newslidermo3sam_zm> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mo3sam_zm%2F2024_03_18_22_03_IMG_8171.JPG?alt=media&token=694944ca-ef09-4b41-b13b-1ed90622e7dd';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mo3sam_zm%2F2024_03_18_22_03_IMG_8171.JPG?alt=media&token=694944ca-ef09-4b41-b13b-1ed90622e7dd',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}


class newslidermo3sam_zm1 extends StatefulWidget {
  const newslidermo3sam_zm1
  ({Key? key}) : super(key: key);

  @override
  State<newslidermo3sam_zm1> createState() => _newslidermo3sam_zm1State();
}
class _newslidermo3sam_zm1State extends State<newslidermo3sam_zm1> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mo3sam_zm%2F2024_03_18_22_00_IMG_8169.JPG?alt=media&token=e4b708c1-cf8c-4cee-b778-b95de2b4866b';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mo3sam_zm%2F2024_03_18_22_00_IMG_8169.JPG?alt=media&token=e4b708c1-cf8c-4cee-b778-b95de2b4866b',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}

//////////////////////////////////////////////////////////////////////////////////////////

class newsliderhijab_tabake extends StatefulWidget {
  const newsliderhijab_tabake
  ({Key? key}) : super(key: key);

  @override
  State<newsliderhijab_tabake> createState() => _newsliderhijab_tabakeState();
}
class _newsliderhijab_tabakeState extends State<newsliderhijab_tabake> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/hijab_tabaqi%2F2024_03_17_22_33_IMG_8132.JPG?alt=media&token=1a4d9b81-61f0-4e73-8116-5209665fc417';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/hijab_tabaqi%2F2024_03_17_22_33_IMG_8132.JPG?alt=media&token=1a4d9b81-61f0-4e73-8116-5209665fc417',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}


class newsliderhijab_tabake1 extends StatefulWidget {
  const newsliderhijab_tabake1
  ({Key? key}) : super(key: key);

  @override
  State<newsliderhijab_tabake1> createState() => _newsliderhijab_tabake1State();
}
class _newsliderhijab_tabake1State extends State<newsliderhijab_tabake1> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/hijab_tabaqi%2F2024_03_17_22_39_IMG_8135.JPG?alt=media&token=4556faf9-f89f-4f2e-ba68-231025db56ac';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/hijab_tabaqi%2F2024_03_17_22_39_IMG_8135.JPG?alt=media&token=4556faf9-f89f-4f2e-ba68-231025db56ac',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}

class newsliderhijab_tabake2 extends StatefulWidget {
  const newsliderhijab_tabake2
  ({Key? key}) : super(key: key);

  @override
  State<newsliderhijab_tabake2> createState() => _newsliderhijab_tabake2State();
}
class _newsliderhijab_tabake2State extends State<newsliderhijab_tabake2> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/hijab_tabaqi%2F2024_03_17_22_42_IMG_8136.JPG?alt=media&token=b2a32a67-e034-4691-8492-be0d5a8e122d';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/hijab_tabaqi%2F2024_03_17_22_42_IMG_8136.JPG?alt=media&token=b2a32a67-e034-4691-8492-be0d5a8e122d',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}

class newsliderhijab_tabake3 extends StatefulWidget {
  const newsliderhijab_tabake3
  ({Key? key}) : super(key: key);

  @override
  State<newsliderhijab_tabake3> createState() => _newsliderhijab_tabake3State();
}
class _newsliderhijab_tabake3State extends State<newsliderhijab_tabake3> {
  late Future<Image> _imageFuture;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageFuture = loadImage();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 12), () {
      if (mounted) {
        setState(() {
          // Timer has expired, set isLoading to false to display error icon
          _imageFuture = Future.error('Image loading timed out');
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تحقق من اتصالك بالإنترنت وحاول مرة أخرى.'),
          ),
        );
      }
    });
  }

   Future<Image> loadImage() async {
    final url =
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/hijab_tabaqi%2F2024_03_17_22_47_IMG_8138.JPG?alt=media&token=22a7a957-d3e6-4aae-aeb6-2373149ef45d';

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final image = Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      return Image.asset('assets/error_image.png'); // Placeholder for error
    }
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context);
    return SafeArea(
      child: FutureBuilder(
        future: _imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the Future is still running, show a loading indicator
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: hexToColor('#9C0945'),
                    size: _media.size.width * .15),
              ),
            );
          } else {
            // If the Future is complete, display the image or error
            _timer.cancel(); // Cancel the timer when the image is loaded
            if (snapshot.hasError) {
              return Container(
                height: _media.size.width * 1.2,
                width: _media.size.width * 1.1,
                child: Center(
                  child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/hijab_tabaqi%2F2024_03_17_22_47_IMG_8138.JPG?alt=media&token=22a7a957-d3e6-4aae-aeb6-2373149ef45d',
                      ),
                    ),
                  );
                },
                child: Container(
                  height: _media.size.width * 1.2,
                  width: _media.size.width * 1.1,
                  child: snapshot.data,
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Dispose the timer when the widget is removed from the tree.
    super.dispose();
  }
}