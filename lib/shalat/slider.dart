import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:harir/shalat/details.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_00_IMG_8033.JPG?alt=media&token=0ae7f133-4e23-42c0-b14c-675aa6d075b0

class newslidershifon extends StatefulWidget {
  const newslidershifon
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon> createState() => _newslidershifonState();
}
class _newslidershifonState extends State<newslidershifon> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_00_IMG_8033.JPG?alt=media&token=0ae7f133-4e23-42c0-b14c-675aa6d075b0';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_00_IMG_8033.JPG?alt=media&token=0ae7f133-4e23-42c0-b14c-675aa6d075b0',
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



//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_04_IMG_8035.JPG?alt=media&token=d16d1599-832e-4514-9ea5-c3db941dc18d

class newslidershifon1 extends StatefulWidget {
  const newslidershifon1
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon1> createState() => _newslidershifon1State();
}
class _newslidershifon1State extends State<newslidershifon1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_04_IMG_8035.JPG?alt=media&token=d16d1599-832e-4514-9ea5-c3db941dc18d';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_04_IMG_8035.JPG?alt=media&token=d16d1599-832e-4514-9ea5-c3db941dc18d',
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


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_08_IMG_8036.JPG?alt=media&token=eaff3c98-da26-4aef-bba6-9d938c7fdba2

  class newslidershifon2 extends StatefulWidget {
  const newslidershifon2
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon2> createState() => _newslidershifon2State();
}
class _newslidershifon2State extends State<newslidershifon2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_08_IMG_8036.JPG?alt=media&token=eaff3c98-da26-4aef-bba6-9d938c7fdba2';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_04_IMG_8035.JPG?alt=media&token=d16d1599-832e-4514-9ea5-c3db941dc18d',
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


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_12_IMG_8037.JPG?alt=media&token=29b7ff7b-b23a-44ad-bb9e-550862ef7a8d

class newslidershifon3 extends StatefulWidget {
  const newslidershifon3
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon3> createState() => _newslidershifon3State();
}
class _newslidershifon3State extends State<newslidershifon3> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_12_IMG_8037.JPG?alt=media&token=29b7ff7b-b23a-44ad-bb9e-550862ef7a8d';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_12_IMG_8037.JPG?alt=media&token=29b7ff7b-b23a-44ad-bb9e-550862ef7a8d',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_16_IMG_8038.JPG?alt=media&token=33c080f4-8977-4939-bffe-6314621f13be';


class newslidershifon4 extends StatefulWidget {
  const newslidershifon4
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon4> createState() => _newslidershifon4State();
}
class _newslidershifon4State extends State<newslidershifon4> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_16_IMG_8038.JPG?alt=media&token=33c080f4-8977-4939-bffe-6314621f13be';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_16_IMG_8038.JPG?alt=media&token=33c080f4-8977-4939-bffe-6314621f13be',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_19_IMG_8039.JPG?alt=media&token=6efd9924-8a71-4f30-976d-307d71edf971

class newslidershifon5 extends StatefulWidget {
  const newslidershifon5
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon5> createState() => _newslidershifon5State();
}
class _newslidershifon5State extends State<newslidershifon5> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_19_IMG_8039.JPG?alt=media&token=6efd9924-8a71-4f30-976d-307d71edf971';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_19_IMG_8039.JPG?alt=media&token=6efd9924-8a71-4f30-976d-307d71edf971',
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




class newslidershifon6 extends StatefulWidget {
  const newslidershifon6
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon6> createState() => _newslidershifon6State();
}
class _newslidershifon6State extends State<newslidershifon6> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_23_IMG_8040.JPG?alt=media&token=dfd4be86-62da-43dd-8b89-28462576c43e';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_23_IMG_8040.JPG?alt=media&token=dfd4be86-62da-43dd-8b89-28462576c43e',
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



class newslidershifon7 extends StatefulWidget {
  const newslidershifon7
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon7> createState() => _newslidershifon7State();
}
class _newslidershifon7State extends State<newslidershifon7> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_26_IMG_8041.JPG?alt=media&token=3b99a7c1-2590-4dc3-8345-15c0e50319c3';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_26_IMG_8041.JPG?alt=media&token=3b99a7c1-2590-4dc3-8345-15c0e50319c3',
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


class newslidershifon8 extends StatefulWidget {
  const newslidershifon8
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon8> createState() => _newslidershifon8State();
}
class _newslidershifon8State extends State<newslidershifon8> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_35_IMG_8042.JPG?alt=media&token=71fef8e8-ebcb-49e4-8198-9b12c0c42e22';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_35_IMG_8042.JPG?alt=media&token=71fef8e8-ebcb-49e4-8198-9b12c0c42e22',
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



class newslidershifon9 extends StatefulWidget {
  const newslidershifon9
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon9> createState() => _newslidershifon9State();
}
class _newslidershifon9State extends State<newslidershifon9> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_40_IMG_8043.JPG?alt=media&token=74dfddf6-060f-4e28-8a0c-811accfd22e4';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_40_IMG_8043.JPG?alt=media&token=74dfddf6-060f-4e28-8a0c-811accfd22e4',
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


class newslidershifon10 extends StatefulWidget {
  const newslidershifon10
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon10> createState() => _newslidershifon10State();
}
class _newslidershifon10State extends State<newslidershifon10> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_45_IMG_8044.JPG?alt=media&token=706ff6c0-6eae-4a01-9f8f-7f37e12b9301';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_21_45_IMG_8044.JPG?alt=media&token=706ff6c0-6eae-4a01-9f8f-7f37e12b9301',
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


class newslidershifon11 extends StatefulWidget {
  const newslidershifon11
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon11> createState() => _newslidershifon11State();
}
class _newslidershifon11State extends State<newslidershifon11> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_04_IMG_8045.JPG?alt=media&token=f441a68f-06f0-4beb-8f7e-6848b5996848';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_04_IMG_8045.JPG?alt=media&token=f441a68f-06f0-4beb-8f7e-6848b5996848',
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



class newslidershifon12 extends StatefulWidget {
  const newslidershifon12
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon12> createState() => _newslidershifon12State();
}
class _newslidershifon12State extends State<newslidershifon12> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_07_IMG_8046.JPG?alt=media&token=8710735d-e966-406a-b09e-585679cb3335';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_07_IMG_8046.JPG?alt=media&token=8710735d-e966-406a-b09e-585679cb3335',
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


class newslidershifon13 extends StatefulWidget {
  const newslidershifon13
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon13> createState() => _newslidershifon13State();
}
class _newslidershifon13State extends State<newslidershifon13> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_09_IMG_8047.JPG?alt=media&token=63978b08-b5cc-4d59-8564-48d967c6118e';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_09_IMG_8047.JPG?alt=media&token=63978b08-b5cc-4d59-8564-48d967c6118e',
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


class newslidershifon14 extends StatefulWidget {
  const newslidershifon14
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon14> createState() => _newslidershifon14State();
}
class _newslidershifon14State extends State<newslidershifon14> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_13_IMG_8048.JPG?alt=media&token=b8c7b0fa-75e4-4683-a252-7b45c9c07cd0';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_13_IMG_8048.JPG?alt=media&token=b8c7b0fa-75e4-4683-a252-7b45c9c07cd0',
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


class newslidershifon15 extends StatefulWidget {
  const newslidershifon15
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon15> createState() => _newslidershifon15State();
}
class _newslidershifon15State extends State<newslidershifon15> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_17_IMG_8049.JPG?alt=media&token=9c919572-b473-4e87-a855-1f653825879f';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_17_IMG_8049.JPG?alt=media&token=9c919572-b473-4e87-a855-1f653825879f',
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



class newslidershifon16 extends StatefulWidget {
  const newslidershifon16
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon16> createState() => _newslidershifon16State();
}
class _newslidershifon16State extends State<newslidershifon16> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_24_IMG_8050.JPG?alt=media&token=68db8c63-fa1f-4486-8a91-f2c17b824751';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_24_IMG_8050.JPG?alt=media&token=68db8c63-fa1f-4486-8a91-f2c17b824751',
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


class newslidershifon17 extends StatefulWidget {
  const newslidershifon17
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon17> createState() => _newslidershifon17State();
}
class _newslidershifon17State extends State<newslidershifon17> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_28_IMG_8051.JPG?alt=media&token=eb63352a-579d-4992-ab94-e80362df2e34';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_28_IMG_8051.JPG?alt=media&token=eb63352a-579d-4992-ab94-e80362df2e34',
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

class newslidershifon18 extends StatefulWidget {
  const newslidershifon18
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon18> createState() => _newslidershifon18State();
}
class _newslidershifon18State extends State<newslidershifon18> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_31_IMG_8052.JPG?alt=media&token=a04f09ec-292e-48d6-b561-3a0eb0eff586';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_31_IMG_8052.JPG?alt=media&token=a04f09ec-292e-48d6-b561-3a0eb0eff586',
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

class newslidershifon19 extends StatefulWidget {
  const newslidershifon19
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon19> createState() => _newslidershifon19State();
}
class _newslidershifon19State extends State<newslidershifon19> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_36_IMG_8054.JPG?alt=media&token=a101e3c1-15a0-4141-a6e1-056d59183cf7';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_36_IMG_8054.JPG?alt=media&token=a101e3c1-15a0-4141-a6e1-056d59183cf7',
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

class newslidershifon20 extends StatefulWidget {
  const newslidershifon20
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon20> createState() => _newslidershifon20State();
}
class _newslidershifon20State extends State<newslidershifon20> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_40_IMG_8056.JPG?alt=media&token=5b17f1ba-9581-4d3b-9a05-72c491be8e0a';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon%2F2024_03_15_22_40_IMG_8056.JPG?alt=media&token=5b17f1ba-9581-4d3b-9a05-72c491be8e0a',
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



   // //////////////////////////////////////////////////////////////////////////////////////جورجيت

   


class newslidergorget extends StatefulWidget {
  const newslidergorget({Key? key}) : super(key: key);

  @override
  State<newslidergorget> createState() => _newslidergorgetState();
}
class _newslidergorgetState extends State<newslidergorget> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fbrown.jpg?alt=media&token=259a6f81-50cd-4b2e-8136-350371ebcffa'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fbrown.jpg?alt=media&token=259a6f81-50cd-4b2e-8136-350371ebcffa',
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



   
// ignore: camel_case_types

class newslidergorget1 extends StatefulWidget {
  const newslidergorget1({Key? key}) : super(key: key);

  @override
  State<newslidergorget1> createState() => _newslidergorget1State();
}
class _newslidergorget1State extends State<newslidergorget1> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fdarkblue.jpg?alt=media&token=db4c3d08-469e-4152-8e92-9cfc39fe6872'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fdarkblue.jpg?alt=media&token=db4c3d08-469e-4152-8e92-9cfc39fe6872',
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


 // 

// ignore: camel_case_types
class newslidergorget2 extends StatefulWidget {
  const newslidergorget2({Key? key}) : super(key: key);

  @override
  State<newslidergorget2> createState() => _newslidergorget2State();
}
class _newslidergorget2State extends State<newslidergorget2> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fbani.jpg?alt=media&token=6920c245-5a7c-494b-816f-548b3184695b'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fbani.jpg?alt=media&token=6920c245-5a7c-494b-816f-548b3184695b',
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


//  


class newslidergorget3 extends StatefulWidget {
  const newslidergorget3({Key? key}) : super(key: key);

  @override
  State<newslidergorget3> createState() => _newslidergorget3State();
}
class _newslidergorget3State extends State<newslidergorget3> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fbink.jpg?alt=media&token=5e2bc7c7-43b6-47c0-8b89-f6b5bb290751'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fbink.jpg?alt=media&token=5e2bc7c7-43b6-47c0-8b89-f6b5bb290751',
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


////////////////////////////////////////////////


class newslidergorget4 extends StatefulWidget {
  const newslidergorget4({Key? key}) : super(key: key);

  @override
  State<newslidergorget4> createState() => _newslidergorget4State();
}
class _newslidergorget4State extends State<newslidergorget4> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Framadefateh.jpg?alt=media&token=564f71c6-fe86-4b05-b914-7d20a4f4c058'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Framadefateh.jpg?alt=media&token=564f71c6-fe86-4b05-b914-7d20a4f4c058',
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




/////////////////////////////////


class newslidergorget5 extends StatefulWidget {
  const newslidergorget5({Key? key}) : super(key: key);

  @override
  State<newslidergorget5> createState() => _newslidergorget5State();
}
class _newslidergorget5State extends State<newslidergorget5> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Framde3amek.jpg?alt=media&token=35bb3de2-4d72-4a2e-ad5d-6cd5d9a380c1'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Framde3amek.jpg?alt=media&token=35bb3de2-4d72-4a2e-ad5d-6cd5d9a380c1',
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

////////////////////////////////////

 
class newslidergorget6 extends StatefulWidget {
  const newslidergorget6({Key? key}) : super(key: key);

  @override
  State<newslidergorget6> createState() => _newslidergorget6State();
}
class _newslidergorget6State extends State<newslidergorget6> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fred.jpg?alt=media&token=9d12b473-aac0-4739-89d2-818c8bc4960b'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fred.jpg?alt=media&token=9d12b473-aac0-4739-89d2-818c8bc4960b',
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
////////////////////////////////////

class newslidergorget7 extends StatefulWidget {
  const newslidergorget7({Key? key}) : super(key: key);

  @override
  State<newslidergorget7> createState() => _newslidergorget7State();
}
class _newslidergorget7State extends State<newslidergorget7> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fgraeeeennnn.jpg?alt=media&token=b63fddaf-9a55-4486-bee4-f04a25cc0c63'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fgraeeeennnn.jpg?alt=media&token=b63fddaf-9a55-4486-bee4-f04a25cc0c63',
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
///////////////////////////////////////////////////

    
       
class newslidergorget8 extends StatefulWidget {
  const newslidergorget8({Key? key}) : super(key: key);

  @override
  State<newslidergorget8> createState() => _newslidergorget8State();
}
class _newslidergorget8State extends State<newslidergorget8> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2F3saled.jpg?alt=media&token=9abdf81b-2753-4557-9f4a-f124095c7919'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2F3saled.jpg?alt=media&token=9abdf81b-2753-4557-9f4a-f124095c7919',
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
///////////////////////////////////////////////////


class newslidergorget9 extends StatefulWidget {
  const newslidergorget9({Key? key}) : super(key: key);

  @override
  State<newslidergorget9> createState() => _newslidergorget9State();
}
class _newslidergorget9State extends State<newslidergorget9> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fbluee.jpg?alt=media&token=afdeec47-8fec-47b1-a2a4-d0b8832002c6'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fbluee.jpg?alt=media&token=afdeec47-8fec-47b1-a2a4-d0b8832002c6',
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
////////////////////////////////////

class newslidergorget10 extends StatefulWidget {
  const newslidergorget10({Key? key}) : super(key: key);

  @override
  State<newslidergorget10> createState() => _newslidergorget10State();
}
class _newslidergorget10State extends State<newslidergorget10> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fcapik.jpg?alt=media&token=fc8f8db4-a510-43bf-8990-6087cc0a8b38'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fcapik.jpg?alt=media&token=fc8f8db4-a510-43bf-8990-6087cc0a8b38',
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


/////////////////////////////////////////////////


class newslidergorget11 extends StatefulWidget {
  const newslidergorget11({Key? key}) : super(key: key);

  @override
  State<newslidergorget11> createState() => _newslidergorget11State();
}
class _newslidergorget11State extends State<newslidergorget11> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fdarkgraen.jpg?alt=media&token=732d8b98-7a49-421d-b82f-2672fd77ec0d'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fdarkgraen.jpg?alt=media&token=732d8b98-7a49-421d-b82f-2672fd77ec0d',
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

//////////////////////////////
class newslidergorget12 extends StatefulWidget {
  const newslidergorget12({Key? key}) : super(key: key);

  @override
  State<newslidergorget12> createState() => _newslidergorget12State();
}
class _newslidergorget12State extends State<newslidergorget12> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fgraengggg.jpg?alt=media&token=012b8e68-56c7-4833-b6f2-a59c152c992b'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fgraengggg.jpg?alt=media&token=012b8e68-56c7-4833-b6f2-a59c152c992b',
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
/////////////////////////////


  class newslidergorget13 extends StatefulWidget {
  const newslidergorget13({Key? key}) : super(key: key);

  @override
  State<newslidergorget13> createState() => _newslidergorget13State();
}
class _newslidergorget13State extends State<newslidergorget13> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fnile.jpg?alt=media&token=123ff07d-8e16-4cdc-8dfd-7870b08b42c5'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fnile.jpg?alt=media&token=123ff07d-8e16-4cdc-8dfd-7870b08b42c5',
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
/////////////////////////////


    class newslidergorget14 extends StatefulWidget {
  const newslidergorget14({Key? key}) : super(key: key);

  @override
  State<newslidergorget14> createState() => _newslidergorget14State();
}
class _newslidergorget14State extends State<newslidergorget14> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fnood.jpg?alt=media&token=b6cf089a-6d53-418c-aa67-1dffec48114c'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fnood.jpg?alt=media&token=b6cf089a-6d53-418c-aa67-1dffec48114c',
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
/////////////////////////////


 class newslidergorget15 extends StatefulWidget {
  const newslidergorget15({Key? key}) : super(key: key);

  @override
  State<newslidergorget15> createState() => _newslidergorget15State();
}
class _newslidergorget15State extends State<newslidergorget15> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fbraonjjj.jpg?alt=media&token=945deb64-e0d0-447a-9c82-7297adf80c4d'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fbraonjjj.jpg?alt=media&token=945deb64-e0d0-447a-9c82-7297adf80c4d',
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
/////////////////////////////////////////

 class newslidergorget16 extends StatefulWidget {
  const newslidergorget16({Key? key}) : super(key: key);

  @override
  State<newslidergorget16> createState() => _newslidergorget16State();
}
class _newslidergorget16State extends State<newslidergorget16> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fnoodd.jpg?alt=media&token=dad29469-dabc-45d9-8560-26653c72bd36'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fnoodd.jpg?alt=media&token=dad29469-dabc-45d9-8560-26653c72bd36',
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
////////////////////////////////

   class newslidergorget17 extends StatefulWidget {
  const newslidergorget17({Key? key}) : super(key: key);

  @override
  State<newslidergorget17> createState() => _newslidergorget17State();
}
class _newslidergorget17State extends State<newslidergorget17> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fpigj.jpg?alt=media&token=7643e3dc-4644-42d0-b84c-08a71a673e32'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fpigj.jpg?alt=media&token=7643e3dc-4644-42d0-b84c-08a71a673e32',
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

////////////////////////////////

    class newslidergorget18 extends StatefulWidget {
  const newslidergorget18({Key? key}) : super(key: key);

  @override
  State<newslidergorget18> createState() => _newslidergorget18State();
}
class _newslidergorget18State extends State<newslidergorget18> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2F5amre.jpg?alt=media&token=aa6a87da-c74f-4598-a8b8-3a449f43669f'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2F5amre.jpg?alt=media&token=aa6a87da-c74f-4598-a8b8-3a449f43669f',
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
///////////////////////////////////////////////////



     class newslidergorget19 extends StatefulWidget {
  const newslidergorget19({Key? key}) : super(key: key);

  @override
  State<newslidergorget19> createState() => _newslidergorget19State();
}
class _newslidergorget19State extends State<newslidergorget19> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fblack.jpeg?alt=media&token=4e688233-4961-43d5-9f3c-748baa691fd6'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fblack.jpeg?alt=media&token=4e688233-4961-43d5-9f3c-748baa691fd6',
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
/////////////////////////////////////////////////////////////https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fgorget.white.png?alt=media&token=84cf5a0f-8047-41ed-bcf4-f638e2f8b5fd

     class newslidergorget20 extends StatefulWidget {
  const newslidergorget20({Key? key}) : super(key: key);

  @override
  State<newslidergorget20> createState() => _newslidergorget20State();
}
class _newslidergorget20State extends State<newslidergorget20> {
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
    Completer<Image> completer = Completer();
    try {
      final response = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fgorget.white.png?alt=media&token=84cf5a0f-8047-41ed-bcf4-f638e2f8b5fd'));
      final image = Image.memory(
        Uint8List.fromList(response.bodyBytes),
        fit: BoxFit.cover,
      );
      completer.complete(image);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
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
          } else if (snapshot.hasError) {
            // If there was an error loading the image or timer expired, display an error icon
            return Container(
              height: _media.size.width * 1.2,
              width: _media.size.width * 1.1,
              child: Center(
                child: Icon(Icons.wifi_off, size: 50, color: Colors.black),
              ),
            );
          } else {
            // If the Future is complete and there is no error, display the loaded image
            _timer.cancel(); // Cancel the timer when the image is loaded
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/gorget%2Fgorget.white.png?alt=media&token=84cf5a0f-8047-41ed-bcf4-f638e2f8b5fd',
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
/////////////////////////////////////////////////////////////


////////////////////////////////////
///
///
///
///
///
///
///
///
///
///

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_30_IMG_7236.JPG?alt=media&token=a01ee3dd-9815-4ef2-bf8e-dd0eb4e5e108

class newslidercotenkwait extends StatefulWidget {
  const newslidercotenkwait({Key? key}) : super(key: key);

  @override
  State<newslidercotenkwait> createState() => _newslidercotenkwaitState();
}
class _newslidercotenkwaitState extends State<newslidercotenkwait> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_30_IMG_7236.JPG?alt=media&token=a01ee3dd-9815-4ef2-bf8e-dd0eb4e5e108';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_30_IMG_7236.JPG?alt=media&token=a01ee3dd-9815-4ef2-bf8e-dd0eb4e5e108',
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


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_33_IMG_7237.JPG?alt=media&token=f43f7683-d86e-4317-a58c-f55724ecb844


 class newslidercotenkwait1 extends StatefulWidget {
  const newslidercotenkwait1({Key? key}) : super(key: key);

  @override
  State<newslidercotenkwait1> createState() => _newslidercotenkwait1State();
}
class _newslidercotenkwait1State extends State<newslidercotenkwait1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_33_IMG_7237.JPG?alt=media&token=f43f7683-d86e-4317-a58c-f55724ecb844';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_33_IMG_7237.JPG?alt=media&token=f43f7683-d86e-4317-a58c-f55724ecb844',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_37_IMG_7238.JPG?alt=media&token=973a8574-3d18-4f57-8d92-3f2afb160c6d

  class newslidercotenkwait2 extends StatefulWidget {
  const newslidercotenkwait2({Key? key}) : super(key: key);

  @override
  State<newslidercotenkwait2> createState() => _newslidercotenkwait2State();
}
class _newslidercotenkwait2State extends State<newslidercotenkwait2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_37_IMG_7238.JPG?alt=media&token=973a8574-3d18-4f57-8d92-3f2afb160c6d';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_37_IMG_7238.JPG?alt=media&token=973a8574-3d18-4f57-8d92-3f2afb160c6d',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_39_IMG_7240.JPG?alt=media&token=ea0fb372-1755-47ae-a352-a1288d7f8840

  class newslidercotenkwait3 extends StatefulWidget {
  const newslidercotenkwait3({Key? key}) : super(key: key);

  @override
  State<newslidercotenkwait3> createState() => _newslidercotenkwait3State();
}
class _newslidercotenkwait3State extends State<newslidercotenkwait3> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_39_IMG_7240.JPG?alt=media&token=ea0fb372-1755-47ae-a352-a1288d7f8840';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_39_IMG_7240.JPG?alt=media&token=ea0fb372-1755-47ae-a352-a1288d7f8840',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_41_IMG_7242.JPG?alt=media&token=8228ed0b-7620-4879-9cf5-9ea9e70c2355

  class newslidercotenkwait4 extends StatefulWidget {
  const newslidercotenkwait4({Key? key}) : super(key: key);

  @override
  State<newslidercotenkwait4> createState() => _newslidercotenkwait4State();
}
class _newslidercotenkwait4State extends State<newslidercotenkwait4> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_41_IMG_7242.JPG?alt=media&token=8228ed0b-7620-4879-9cf5-9ea9e70c2355';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_41_IMG_7242.JPG?alt=media&token=8228ed0b-7620-4879-9cf5-9ea9e70c2355',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_44_IMG_7245.JPG?alt=media&token=4fc33b35-d7c0-4263-94bd-dec18ef7d8a2

  class newslidercotenkwait5 extends StatefulWidget {
  const newslidercotenkwait5({Key? key}) : super(key: key);

  @override
  State<newslidercotenkwait5> createState() => _newslidercotenkwait5State();
}
class _newslidercotenkwait5State extends State<newslidercotenkwait5> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_44_IMG_7245.JPG?alt=media&token=4fc33b35-d7c0-4263-94bd-dec18ef7d8a2';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_44_IMG_7245.JPG?alt=media&token=4fc33b35-d7c0-4263-94bd-dec18ef7d8a2',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_46_IMG_7247.JPG?alt=media&token=dfe73a50-5f4a-493a-996d-ab884d3e56c2

   class newslidercotenkwait6 extends StatefulWidget {
  const newslidercotenkwait6({Key? key}) : super(key: key);

  @override
  State<newslidercotenkwait6> createState() => _newslidercotenkwait6State();
}
class _newslidercotenkwait6State extends State<newslidercotenkwait6> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_46_IMG_7247.JPG?alt=media&token=dfe73a50-5f4a-493a-996d-ab884d3e56c2';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_46_IMG_7247.JPG?alt=media&token=dfe73a50-5f4a-493a-996d-ab884d3e56c2',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_48_IMG_7251.JPG?alt=media&token=2ccd3a7b-c6e5-417a-9625-3ee0d68fcdb9

   class newslidercotenkwait7 extends StatefulWidget {
  const newslidercotenkwait7({Key? key}) : super(key: key);

  @override
  State<newslidercotenkwait7> createState() => _newslidercotenkwait7State();
}
class _newslidercotenkwait7State extends State<newslidercotenkwait7> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_48_IMG_7251.JPG?alt=media&token=2ccd3a7b-c6e5-417a-9625-3ee0d68fcdb9';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_48_IMG_7251.JPG?alt=media&token=2ccd3a7b-c6e5-417a-9625-3ee0d68fcdb9',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_51_IMG_7255.JPG?alt=media&token=c4c8913a-4384-453f-983e-ec6240ef6502

   class newslidercotenkwait8 extends StatefulWidget {
  const newslidercotenkwait8({Key? key}) : super(key: key);

  @override
  State<newslidercotenkwait8> createState() => _newslidercotenkwait8State();
}
class _newslidercotenkwait8State extends State<newslidercotenkwait8> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_51_IMG_7255.JPG?alt=media&token=c4c8913a-4384-453f-983e-ec6240ef6502';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_51_IMG_7255.JPG?alt=media&token=c4c8913a-4384-453f-983e-ec6240ef6502',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_53_IMG_7257.JPG?alt=media&token=6f37fc19-228d-4385-9f24-f964521444eb

  class newslidercotenkwait9 extends StatefulWidget {
  const newslidercotenkwait9({Key? key}) : super(key: key);

  @override
  State<newslidercotenkwait9> createState() => _newslidercotenkwait9State();
}
class _newslidercotenkwait9State extends State<newslidercotenkwait9> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_53_IMG_7257.JPG?alt=media&token=6f37fc19-228d-4385-9f24-f964521444eb';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/coten%20kwait%2F2024_02_19_23_53_IMG_7257.JPG?alt=media&token=6f37fc19-228d-4385-9f24-f964521444eb',
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


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fbeg%20gamek.JPG?alt=media&token=af7d0b97-76ca-4101-a478-81ef83eaa609
 
  class newsliderglutter extends StatefulWidget {
  const newsliderglutter({Key? key}) : super(key: key);

  @override
  State<newsliderglutter> createState() => _newsliderglutterState();
}
class _newsliderglutterState extends State<newsliderglutter> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fbeg%20gamek.JPG?alt=media&token=af7d0b97-76ca-4101-a478-81ef83eaa609';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fbeg%20gamek.JPG?alt=media&token=af7d0b97-76ca-4101-a478-81ef83eaa609',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fbeg.JPG?alt=media&token=a8610e63-a93d-4a6f-87fc-d2da94d927f8


class newsliderglutter1 extends StatefulWidget {
  const newsliderglutter1({Key? key}) : super(key: key);

  @override
  State<newsliderglutter1> createState() => _newsliderglutter1State();
}
class _newsliderglutter1State extends State<newsliderglutter1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fbeg.JPG?alt=media&token=a8610e63-a93d-4a6f-87fc-d2da94d927f8';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fbeg.JPG?alt=media&token=a8610e63-a93d-4a6f-87fc-d2da94d927f8',
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


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fblack.JPG?alt=media&token=184cda3a-afda-44c5-b8e6-b4353e61fc12

class newsliderglutter2 extends StatefulWidget {
  const newsliderglutter2({Key? key}) : super(key: key);

  @override
  State<newsliderglutter2> createState() => _newsliderglutter2State();
}
class _newsliderglutter2State extends State<newsliderglutter2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fblack.JPG?alt=media&token=184cda3a-afda-44c5-b8e6-b4353e61fc12';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fblack.JPG?alt=media&token=184cda3a-afda-44c5-b8e6-b4353e61fc12',
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


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fnahdi.JPG?alt=media&token=dc061046-86c8-49d1-b922-c130b51d4ae8

class newsliderglutter3 extends StatefulWidget {
  const newsliderglutter3({Key? key}) : super(key: key);

  @override
  State<newsliderglutter3> createState() => _newsliderglutter3State();
}
class _newsliderglutter3State extends State<newsliderglutter3> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fnahdi.JPG?alt=media&token=dc061046-86c8-49d1-b922-c130b51d4ae8';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fnahdi.JPG?alt=media&token=dc061046-86c8-49d1-b922-c130b51d4ae8',
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


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fpink.JPG?alt=media&token=9df5e69b-f856-463b-9964-91ac987148eb

class newsliderglutter4 extends StatefulWidget {
  const newsliderglutter4({Key? key}) : super(key: key);

  @override
  State<newsliderglutter4> createState() => _newsliderglutter4State();
}
class _newsliderglutter4State extends State<newsliderglutter4> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fpink.JPG?alt=media&token=9df5e69b-f856-463b-9964-91ac987148eb';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fpink.JPG?alt=media&token=9df5e69b-f856-463b-9964-91ac987148eb',
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


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fwhite.JPG?alt=media&token=a1c45cd1-6921-4c88-8494-cfcf91d34d71

class newsliderglutter5 extends StatefulWidget {
  const newsliderglutter5({Key? key}) : super(key: key);

  @override
  State<newsliderglutter5> createState() => _newsliderglutter5State();
}
class _newsliderglutter5State extends State<newsliderglutter5> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fwhite.JPG?alt=media&token=a1c45cd1-6921-4c88-8494-cfcf91d34d71';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lam3a%20glatar%2Fwhite.JPG?alt=media&token=a1c45cd1-6921-4c88-8494-cfcf91d34d71',
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_35_IMG_7975.JPG?alt=media&token=7e31f06b-4ab0-4207-8545-06873629458b

class newslidercottonliner extends StatefulWidget {
  const newslidercottonliner({Key? key}) : super(key: key);

  @override
  State<newslidercottonliner> createState() => _newslidercottonlinerState();
}
class _newslidercottonlinerState extends State<newslidercottonliner> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_35_IMG_7975.JPG?alt=media&token=7e31f06b-4ab0-4207-8545-06873629458b';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_35_IMG_7975.JPG?alt=media&token=7e31f06b-4ab0-4207-8545-06873629458b',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_37_IMG_7976.JPG?alt=media&token=59743e44-17b8-4957-9ac7-3e8c1b5fef6a


class newslidercottonliner1 extends StatefulWidget {
  const newslidercottonliner1({Key? key}) : super(key: key);

  @override
  State<newslidercottonliner1> createState() => _newslidercottonliner1State();
}
class _newslidercottonliner1State extends State<newslidercottonliner1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_37_IMG_7976.JPG?alt=media&token=59743e44-17b8-4957-9ac7-3e8c1b5fef6a';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_37_IMG_7976.JPG?alt=media&token=59743e44-17b8-4957-9ac7-3e8c1b5fef6a',
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


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_41_IMG_7977.JPG?alt=media&token=8cc20d4a-6dd2-48d1-a05a-57d6b80b95dc


class newslidercottonliner2 extends StatefulWidget {
  const newslidercottonliner2({Key? key}) : super(key: key);

  @override
  State<newslidercottonliner2> createState() => _newslidercottonliner2State();
}
class _newslidercottonliner2State extends State<newslidercottonliner2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_41_IMG_7977.JPG?alt=media&token=8cc20d4a-6dd2-48d1-a05a-57d6b80b95dc';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_41_IMG_7977.JPG?alt=media&token=8cc20d4a-6dd2-48d1-a05a-57d6b80b95dc',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_44_IMG_7978.JPG?alt=media&token=0f8bfbb8-03e2-41c9-a789-d1ad012a7fc0

class newslidercottonliner3 extends StatefulWidget {
  const newslidercottonliner3({Key? key}) : super(key: key);

  @override
  State<newslidercottonliner3> createState() => _newslidercottonliner3State();
}
class _newslidercottonliner3State extends State<newslidercottonliner3> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_44_IMG_7978.JPG?alt=media&token=0f8bfbb8-03e2-41c9-a789-d1ad012a7fc0';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_44_IMG_7978.JPG?alt=media&token=0f8bfbb8-03e2-41c9-a789-d1ad012a7fc0',
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


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_47_IMG_7979.JPG?alt=media&token=8cbfc122-50fd-4f30-8076-3a56a8bb2861

class newslidercottonliner4 extends StatefulWidget {
  const newslidercottonliner4({Key? key}) : super(key: key);

  @override
  State<newslidercottonliner4> createState() => _newslidercottonliner4State();
}
class _newslidercottonliner4State extends State<newslidercottonliner4> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_47_IMG_7979.JPG?alt=media&token=8cbfc122-50fd-4f30-8076-3a56a8bb2861';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_47_IMG_7979.JPG?alt=media&token=8cbfc122-50fd-4f30-8076-3a56a8bb2861',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_51_IMG_7980.JPG?alt=media&token=8c8802da-2f30-4172-be5f-208b0c7da21f


class newslidercottonliner5 extends StatefulWidget {
  const newslidercottonliner5({Key? key}) : super(key: key);

  @override
  State<newslidercottonliner5> createState() => _newslidercottonliner5State();
}
class _newslidercottonliner5State extends State<newslidercottonliner5> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_51_IMG_7980.JPG?alt=media&token=8c8802da-2f30-4172-be5f-208b0c7da21f';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_51_IMG_7980.JPG?alt=media&token=8c8802da-2f30-4172-be5f-208b0c7da21f',
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


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_55_IMG_7982.JPG?alt=media&token=3b6538d5-9127-4c8c-88b8-fb7e1e4f09d2

class newslidercottonliner6 extends StatefulWidget {
  const newslidercottonliner6({Key? key}) : super(key: key);

  @override
  State<newslidercottonliner6> createState() => _newslidercottonliner6State();
}
class _newslidercottonliner6State extends State<newslidercottonliner6> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_55_IMG_7982.JPG?alt=media&token=3b6538d5-9127-4c8c-88b8-fb7e1e4f09d2';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_22_55_IMG_7982.JPG?alt=media&token=3b6538d5-9127-4c8c-88b8-fb7e1e4f09d2',
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


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_23_00_IMG_7984.JPG?alt=media&token=99225d51-79cc-46ef-99ca-25a03e3dec55

class newslidercottonliner7 extends StatefulWidget {
  const newslidercottonliner7({Key? key}) : super(key: key);

  @override
  State<newslidercottonliner7> createState() => _newslidercottonliner7State();
}
class _newslidercottonliner7State extends State<newslidercottonliner7> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_23_00_IMG_7984.JPG?alt=media&token=99225d51-79cc-46ef-99ca-25a03e3dec55';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_23_00_IMG_7984.JPG?alt=media&token=99225d51-79cc-46ef-99ca-25a03e3dec55',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_23_08_IMG_7986.JPG?alt=media&token=23b45f89-fca0-4733-8277-6b0ac36e3285

class newslidercottonliner8 extends StatefulWidget {
  const newslidercottonliner8({Key? key}) : super(key: key);

  @override
  State<newslidercottonliner8> createState() => _newslidercottonliner8State();
}
class _newslidercottonliner8State extends State<newslidercottonliner8> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_23_08_IMG_7986.JPG?alt=media&token=23b45f89-fca0-4733-8277-6b0ac36e3285';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2F2024_03_13_23_08_IMG_7986.JPG?alt=media&token=23b45f89-fca0-4733-8277-6b0ac36e3285',
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


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2Fliner%20coton%20pink.JPG?alt=media&token=617cff14-d1fa-454b-b874-09a2317b3b2a

class newslidercottonliner9 extends StatefulWidget {
  const newslidercottonliner9({Key? key}) : super(key: key);

  @override
  State<newslidercottonliner9> createState() => _newslidercottonliner9State();
}
class _newslidercottonliner9State extends State<newslidercottonliner9> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2Fliner%20coton%20pink.JPG?alt=media&token=617cff14-d1fa-454b-b874-09a2317b3b2a';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20liner%2Fliner%20coton%20pink.JPG?alt=media&token=617cff14-d1fa-454b-b874-09a2317b3b2a',
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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_30_IMG_7961.JPG?alt=media&token=6af7c59a-1553-4a12-97e4-943df26398ca

class newsliderstras extends StatefulWidget {
  const newsliderstras({Key? key}) : super(key: key);

  @override
  State<newsliderstras> createState() => _newsliderstrasState();
}
class _newsliderstrasState extends State<newsliderstras> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_30_IMG_7961.JPG?alt=media&token=6af7c59a-1553-4a12-97e4-943df26398ca';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_30_IMG_7961.JPG?alt=media&token=6af7c59a-1553-4a12-97e4-943df26398ca',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_34_IMG_7962.JPG?alt=media&token=92da722f-f891-438f-9529-9cd016b72d11

class newsliderstras1 extends StatefulWidget {
  const newsliderstras1({Key? key}) : super(key: key);

  @override
  State<newsliderstras1> createState() => _newsliderstras1State();
}
class _newsliderstras1State extends State<newsliderstras1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_34_IMG_7962.JPG?alt=media&token=92da722f-f891-438f-9529-9cd016b72d11';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_34_IMG_7962.JPG?alt=media&token=92da722f-f891-438f-9529-9cd016b72d11',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_40_IMG_7963.JPG?alt=media&token=f5bc6b2a-5aa2-45ec-9a57-41852836679c

class newsliderstras2 extends StatefulWidget {
  const newsliderstras2({Key? key}) : super(key: key);

  @override
  State<newsliderstras2> createState() => _newsliderstras2State();
}
class _newsliderstras2State extends State<newsliderstras2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_40_IMG_7963.JPG?alt=media&token=f5bc6b2a-5aa2-45ec-9a57-41852836679c';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_40_IMG_7963.JPG?alt=media&token=f5bc6b2a-5aa2-45ec-9a57-41852836679c',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_43_IMG_7965.JPG?alt=media&token=7c809c0f-13f7-4570-bd29-b81f4a88c820

class newsliderstras3 extends StatefulWidget {
  const newsliderstras3({Key? key}) : super(key: key);

  @override
  State<newsliderstras3> createState() => _newsliderstras3State();
}
class _newsliderstras3State extends State<newsliderstras3> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_43_IMG_7965.JPG?alt=media&token=7c809c0f-13f7-4570-bd29-b81f4a88c820';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_43_IMG_7965.JPG?alt=media&token=7c809c0f-13f7-4570-bd29-b81f4a88c820',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_47_IMG_7966.JPG?alt=media&token=bc786486-f9fc-428f-a17f-cd4399bcd7ab

class newsliderstras4 extends StatefulWidget {
  const newsliderstras4({Key? key}) : super(key: key);

  @override
  State<newsliderstras4> createState() => _newsliderstras4State();
}
class _newsliderstras4State extends State<newsliderstras4> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_47_IMG_7966.JPG?alt=media&token=bc786486-f9fc-428f-a17f-cd4399bcd7ab';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_47_IMG_7966.JPG?alt=media&token=bc786486-f9fc-428f-a17f-cd4399bcd7ab',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_59_IMG_7967.JPG?alt=media&token=445abc63-f02d-434c-ab6d-4e08ebedc076


class newsliderstras5 extends StatefulWidget {
  const newsliderstras5({Key? key}) : super(key: key);

  @override
  State<newsliderstras5> createState() => _newsliderstras5State();
}
class _newsliderstras5State extends State<newsliderstras5> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_59_IMG_7967.JPG?alt=media&token=445abc63-f02d-434c-ab6d-4e08ebedc076';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_21_59_IMG_7967.JPG?alt=media&token=445abc63-f02d-434c-ab6d-4e08ebedc076',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_22_03_IMG_7969.JPG?alt=media&token=a98caaa8-e226-49d9-967e-2a33c167c879


class newsliderstras6 extends StatefulWidget {
  const newsliderstras6({Key? key}) : super(key: key);

  @override
  State<newsliderstras6> createState() => _newsliderstras6State();
}
class _newsliderstras6State extends State<newsliderstras6> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_22_03_IMG_7969.JPG?alt=media&token=a98caaa8-e226-49d9-967e-2a33c167c879';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_22_03_IMG_7969.JPG?alt=media&token=a98caaa8-e226-49d9-967e-2a33c167c879',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_22_05_IMG_7970.JPG?alt=media&token=d2dba9f5-744d-4c47-ac1d-4d3ce7a6ef46


class newsliderstras7 extends StatefulWidget {
  const newsliderstras7({Key? key}) : super(key: key);

  @override
  State<newsliderstras7> createState() => _newsliderstras7State();
}
class _newsliderstras7State extends State<newsliderstras7> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_22_05_IMG_7970.JPG?alt=media&token=d2dba9f5-744d-4c47-ac1d-4d3ce7a6ef46';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/mons%20stras%2F2024_03_13_22_05_IMG_7970.JPG?alt=media&token=d2dba9f5-744d-4c47-ac1d-4d3ce7a6ef46',
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_14_IMG_7987.JPG?alt=media&token=f0f56383-dcf9-44fc-b13a-959b4593e337

class newsliderDOUBLE_STRICH extends StatefulWidget {
  const newsliderDOUBLE_STRICH
  ({Key? key}) : super(key: key);

  @override
  State<newsliderDOUBLE_STRICH> createState() => _newsliderDOUBLE_STRICHState();
}
class _newsliderDOUBLE_STRICHState extends State<newsliderDOUBLE_STRICH> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_14_IMG_7987.JPG?alt=media&token=f0f56383-dcf9-44fc-b13a-959b4593e337';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_14_IMG_7987.JPG?alt=media&token=f0f56383-dcf9-44fc-b13a-959b4593e337',
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

//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_16_IMG_7988.JPG?alt=media&token=fbd87002-a731-4406-9da4-46e4461bbf2d


class newsliderDOUBLE_STRICH1 extends StatefulWidget {
  const newsliderDOUBLE_STRICH1
  ({Key? key}) : super(key: key);

  @override
  State<newsliderDOUBLE_STRICH1> createState() => _newsliderDOUBLE_STRICH1State();
}
class _newsliderDOUBLE_STRICH1State extends State<newsliderDOUBLE_STRICH1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_16_IMG_7988.JPG?alt=media&token=fbd87002-a731-4406-9da4-46e4461bbf2d';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_16_IMG_7988.JPG?alt=media&token=fbd87002-a731-4406-9da4-46e4461bbf2d',
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


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_18_IMG_7989.JPG?alt=media&token=7018d4f2-b660-4f20-99b9-ce27b7ab1163

class newsliderDOUBLE_STRICH2 extends StatefulWidget {
  const newsliderDOUBLE_STRICH2
  ({Key? key}) : super(key: key);

  @override
  State<newsliderDOUBLE_STRICH2> createState() => _newsliderDOUBLE_STRICH2State();
}
class _newsliderDOUBLE_STRICH2State extends State<newsliderDOUBLE_STRICH2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_18_IMG_7989.JPG?alt=media&token=7018d4f2-b660-4f20-99b9-ce27b7ab1163';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_18_IMG_7989.JPG?alt=media&token=7018d4f2-b660-4f20-99b9-ce27b7ab1163',
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


//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_21_IMG_7992.JPG?alt=media&token=1b1d653e-d5fc-4512-9dab-ffb700c2f766

class newsliderDOUBLE_STRICH3 extends StatefulWidget {
  const newsliderDOUBLE_STRICH3
  ({Key? key}) : super(key: key);

  @override
  State<newsliderDOUBLE_STRICH3> createState() => _newsliderDOUBLE_STRICH3State();
}
class _newsliderDOUBLE_STRICH3State extends State<newsliderDOUBLE_STRICH3> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_21_IMG_7992.JPG?alt=media&token=1b1d653e-d5fc-4512-9dab-ffb700c2f766';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_21_IMG_7992.JPG?alt=media&token=1b1d653e-d5fc-4512-9dab-ffb700c2f766',
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



//https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_23_IMG_7993.JPG?alt=media&token=92afd321-32c1-48e8-baf5-33e0b4ecbb55


class newsliderDOUBLE_STRICH4 extends StatefulWidget {
  const newsliderDOUBLE_STRICH4
  ({Key? key}) : super(key: key);

  @override
  State<newsliderDOUBLE_STRICH4> createState() => _newsliderDOUBLE_STRICH4State();
}
class _newsliderDOUBLE_STRICH4State extends State<newsliderDOUBLE_STRICH4> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_23_IMG_7993.JPG?alt=media&token=92afd321-32c1-48e8-baf5-33e0b4ecbb55';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20doble%20strich%2F2024_03_13_23_23_IMG_7993.JPG?alt=media&token=92afd321-32c1-48e8-baf5-33e0b4ecbb55',
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

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class newslidersatan extends StatefulWidget {
  const newslidersatan
  ({Key? key}) : super(key: key);

  @override
  State<newslidersatan> createState() => _newslidersatanState();
}
class _newslidersatanState extends State<newslidersatan> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%2F2024_03_16_19_58_IMG_8092.JPG?alt=media&token=8ea85ba5-4547-4ae7-89f1-52afcb6f6167';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%2F2024_03_16_19_58_IMG_8092.JPG?alt=media&token=8ea85ba5-4547-4ae7-89f1-52afcb6f6167',
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




class newslidersatan1 extends StatefulWidget {
  const newslidersatan1
  ({Key? key}) : super(key: key);

  @override
  State<newslidersatan1> createState() => _newslidersatan1State();
}
class _newslidersatan1State extends State<newslidersatan1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%2F2024_03_16_20_02_IMG_8094.JPG?alt=media&token=709f7b3b-9420-48cb-8ac7-951db23fdbbe';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%2F2024_03_16_20_02_IMG_8094.JPG?alt=media&token=709f7b3b-9420-48cb-8ac7-951db23fdbbe',
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




class newslidersatan2 extends StatefulWidget {
  const newslidersatan2({Key? key}) : super(key: key);

  @override
  State<newslidersatan2> createState() => _newslidersatan2State();
}

class _newslidersatan2State extends State<newslidersatan2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%2F2024_03_16_20_04_IMG_8095.JPG?alt=media&token=481c2430-571f-483f-ac64-2154dc563931';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%2F2024_03_16_20_04_IMG_8095.JPG?alt=media&token=481c2430-571f-483f-ac64-2154dc563931',
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
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

class newsliderswarih extends StatefulWidget {
  const newsliderswarih
  ({Key? key}) : super(key: key);

  @override
  State<newsliderswarih> createState() => _newsliderswarihState();
}
class _newsliderswarihState extends State<newsliderswarih> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/swarih%2F2024_03_16_19_49_IMG_8087.JPG?alt=media&token=96e473a4-d98f-4f2b-8d4d-cb81ed2b5bba';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/swarih%2F2024_03_16_19_49_IMG_8087.JPG?alt=media&token=96e473a4-d98f-4f2b-8d4d-cb81ed2b5bba',
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


class newsliderswarih1 extends StatefulWidget {
  const newsliderswarih1
  ({Key? key}) : super(key: key);

  @override
  State<newsliderswarih1> createState() => _newsliderswarih1State();
}
class _newsliderswarih1State extends State<newsliderswarih1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/swarih%2F2024_03_16_19_52_IMG_8089.JPG?alt=media&token=2c568fad-1674-4993-abdf-ff638ff32498';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/swarih%2F2024_03_16_19_52_IMG_8089.JPG?alt=media&token=2c568fad-1674-4993-abdf-ff638ff32498',
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


class newsliderswarih2 extends StatefulWidget {
  const newsliderswarih2
  ({Key? key}) : super(key: key);

  @override
  State<newsliderswarih2> createState() => _newsliderswarih2State();
}
class _newsliderswarih2State extends State<newsliderswarih2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/swarih%2F2024_03_16_19_55_IMG_8091.JPG?alt=media&token=4e0bff75-4633-4d89-9335-bd3af55fb17d';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/swarih%2F2024_03_16_19_55_IMG_8091.JPG?alt=media&token=4e0bff75-4633-4d89-9335-bd3af55fb17d',
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class newslidershifon_motraz extends StatefulWidget {
  const newslidershifon_motraz
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon_motraz> createState() => _newslidershifon_motrazState();
}
class _newslidershifon_motrazState extends State<newslidershifon_motraz> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon_motaraz%2F2024_03_16_19_35_IMG_8083.JPG?alt=media&token=e1e2b244-95cf-4e7b-8aa3-e0698a577adc';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon_motaraz%2F2024_03_16_19_35_IMG_8083.JPG?alt=media&token=e1e2b244-95cf-4e7b-8aa3-e0698a577adc',
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





class newslidershifon_motraz1 extends StatefulWidget {
  const newslidershifon_motraz1
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon_motraz1> createState() => _newslidershifon_motraz1State();
}
class _newslidershifon_motraz1State extends State<newslidershifon_motraz1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon_motaraz%2F2024_03_16_19_39_IMG_8084.JPG?alt=media&token=ac2101d1-a18f-4944-bebf-e35da64b2eb4';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon_motaraz%2F2024_03_16_19_39_IMG_8084.JPG?alt=media&token=ac2101d1-a18f-4944-bebf-e35da64b2eb4',
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




class newslidershifon_motraz2 extends StatefulWidget {
  const newslidershifon_motraz2
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon_motraz2> createState() => _newslidershifon_motraz2State();
}
class _newslidershifon_motraz2State extends State<newslidershifon_motraz2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon_motaraz%2F2024_03_16_19_43_IMG_8085.JPG?alt=media&token=3f16c812-7c7d-4121-b32c-e170f2cd9015';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon_motaraz%2F2024_03_16_19_43_IMG_8085.JPG?alt=media&token=3f16c812-7c7d-4121-b32c-e170f2cd9015',
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



class newslidershifon_motraz3 extends StatefulWidget {
  const newslidershifon_motraz3
  ({Key? key}) : super(key: key);

  @override
  State<newslidershifon_motraz3> createState() => _newslidershifon_motraz3State();
}
class _newslidershifon_motraz3State extends State<newslidershifon_motraz3> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon_motaraz%2F2024_03_16_19_45_IMG_8086.JPG?alt=media&token=94225fbb-1061-4c52-b26f-1347d7d02bf8';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/shifon_motaraz%2F2024_03_16_19_45_IMG_8086.JPG?alt=media&token=94225fbb-1061-4c52-b26f-1347d7d02bf8',
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
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class newsliderkashmir extends StatefulWidget {
  const newsliderkashmir
  ({Key? key}) : super(key: key);

  @override
  State<newsliderkashmir> createState() => _newsliderkashmirState();
}
class _newsliderkashmirState extends State<newsliderkashmir> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kashmir%2F2024_03_08_21_00_IMG_7873.JPG?alt=media&token=8f725fa0-7523-42d3-9cdc-2bea93a151af';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kashmir%2F2024_03_08_21_00_IMG_7873.JPG?alt=media&token=8f725fa0-7523-42d3-9cdc-2bea93a151af',
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




class newsliderkashmir1 extends StatefulWidget {
  const newsliderkashmir1
  ({Key? key}) : super(key: key);

  @override
  State<newsliderkashmir1> createState() => _newsliderkashmir1State();
}
class _newsliderkashmir1State extends State<newsliderkashmir1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kashmir%2F2024_03_08_21_06_IMG_7875.JPG?alt=media&token=f73ef8ca-7164-4b55-ab21-f14339d496a7';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kashmir%2F2024_03_08_21_06_IMG_7875.JPG?alt=media&token=f73ef8ca-7164-4b55-ab21-f14339d496a7',
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




class newsliderkashmir2 extends StatefulWidget {
  const newsliderkashmir2
  ({Key? key}) : super(key: key);

  @override
  State<newsliderkashmir2> createState() => _newsliderkashmir2State();
}
class _newsliderkashmir2State extends State<newsliderkashmir2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kashmir%2F2024_03_08_21_18_IMG_7876.JPG?alt=media&token=4a727ad0-e3a3-4208-b58d-c70152eb7901';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kashmir%2F2024_03_08_21_18_IMG_7876.JPG?alt=media&token=4a727ad0-e3a3-4208-b58d-c70152eb7901',
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




class newsliderkashmir3 extends StatefulWidget {
  const newsliderkashmir3
  ({Key? key}) : super(key: key);

  @override
  State<newsliderkashmir3> createState() => _newsliderkashmir3State();
}
class _newsliderkashmir3State extends State<newsliderkashmir3> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kashmir%2F2024_03_08_21_23_IMG_7877.JPG?alt=media&token=318e5671-35e0-420d-b9c7-c6c0103d094e';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/kashmir%2F2024_03_08_21_23_IMG_7877.JPG?alt=media&token=318e5671-35e0-420d-b9c7-c6c0103d094e',
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class newsliderlikra_mojaker extends StatefulWidget {
  const newsliderlikra_mojaker
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mojaker> createState() => _newsliderlikra_mojakerState();
}
class _newsliderlikra_mojakerState extends State<newsliderlikra_mojaker> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_09_IMG_7544.JPG?alt=media&token=2e3b7a0b-3e6f-40bd-af09-629258e59c65';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_09_IMG_7544.JPG?alt=media&token=2e3b7a0b-3e6f-40bd-af09-629258e59c65',
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




class newsliderlikra_mojaker1 extends StatefulWidget {
  const newsliderlikra_mojaker1
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mojaker1> createState() => _newsliderlikra_mojaker1State();
}
class _newsliderlikra_mojaker1State extends State<newsliderlikra_mojaker1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_11_IMG_7545.JPG?alt=media&token=358e201f-1959-4c63-93c6-a189e8623ca4';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_11_IMG_7545.JPG?alt=media&token=358e201f-1959-4c63-93c6-a189e8623ca4',
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




class newsliderlikra_mojaker2 extends StatefulWidget {
  const newsliderlikra_mojaker2
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mojaker2> createState() => _newsliderlikra_mojaker2State();
}
class _newsliderlikra_mojaker2State extends State<newsliderlikra_mojaker2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_13_IMG_7546.JPG?alt=media&token=e06aad6f-d2ef-4bcc-954d-e34fc2c5b2ca';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_13_IMG_7546.JPG?alt=media&token=e06aad6f-d2ef-4bcc-954d-e34fc2c5b2ca',
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




class newsliderlikra_mojaker3 extends StatefulWidget {
  const newsliderlikra_mojaker3
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mojaker3> createState() => _newsliderlikra_mojaker3State();
}
class _newsliderlikra_mojaker3State extends State<newsliderlikra_mojaker3> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_16_IMG_7547.JPG?alt=media&token=88f52057-cf6d-4082-a887-93f62366d521';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_16_IMG_7547.JPG?alt=media&token=88f52057-cf6d-4082-a887-93f62366d521',
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




class newsliderlikra_mojaker4 extends StatefulWidget {
  const newsliderlikra_mojaker4
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mojaker4> createState() => _newsliderlikra_mojaker4State();
}
class _newsliderlikra_mojaker4State extends State<newsliderlikra_mojaker4> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_20_IMG_7548.JPG?alt=media&token=418d75b8-7bc3-445f-b388-0f2a30fa7383';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_20_IMG_7548.JPG?alt=media&token=418d75b8-7bc3-445f-b388-0f2a30fa7383',
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




class newsliderlikra_mojaker5 extends StatefulWidget {
  const newsliderlikra_mojaker5
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mojaker5> createState() => _newsliderlikra_mojaker5State();
}
class _newsliderlikra_mojaker5State extends State<newsliderlikra_mojaker5> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_24_IMG_7549.JPG?alt=media&token=cda6db84-c389-45c4-a348-1d78e56b434a';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_24_IMG_7549.JPG?alt=media&token=cda6db84-c389-45c4-a348-1d78e56b434a',
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




class newsliderlikra_mojaker6 extends StatefulWidget {
  const newsliderlikra_mojaker6
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mojaker6> createState() => _newsliderlikra_mojaker6State();
}
class _newsliderlikra_mojaker6State extends State<newsliderlikra_mojaker6> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_26_IMG_7550.JPG?alt=media&token=53b86aa5-52a1-4942-9d4d-91ee8189dd01';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_26_IMG_7550.JPG?alt=media&token=53b86aa5-52a1-4942-9d4d-91ee8189dd01',
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




class newsliderlikra_mojaker7 extends StatefulWidget {
  const newsliderlikra_mojaker7
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mojaker7> createState() => _newsliderlikra_mojaker7State();
}
class _newsliderlikra_mojaker7State extends State<newsliderlikra_mojaker7> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_30_IMG_7552.JPG?alt=media&token=c6654ac6-4954-4734-8c01-6c87e1677ac9';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_30_IMG_7552.JPG?alt=media&token=c6654ac6-4954-4734-8c01-6c87e1677ac9',
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




class newsliderlikra_mojaker8 extends StatefulWidget {
  const newsliderlikra_mojaker8
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mojaker8> createState() => _newsliderlikra_mojaker8State();
}
class _newsliderlikra_mojaker8State extends State<newsliderlikra_mojaker8> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_33_IMG_7553.JPG?alt=media&token=8be726be-774b-4de6-ba38-7e3babdb9940';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_33_IMG_7553.JPG?alt=media&token=8be726be-774b-4de6-ba38-7e3babdb9940',
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




class newsliderlikra_mojaker9 extends StatefulWidget {
  const newsliderlikra_mojaker9
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mojaker9> createState() => _newsliderlikra_mojaker9State();
}
class _newsliderlikra_mojaker9State extends State<newsliderlikra_mojaker9> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_35_IMG_7554.JPG?alt=media&token=039dc67e-6090-4873-9f86-6d2c67eadaf2';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_35_IMG_7554.JPG?alt=media&token=039dc67e-6090-4873-9f86-6d2c67eadaf2',
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




class newsliderlikra_mojaker10 extends StatefulWidget {
  const newsliderlikra_mojaker10
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mojaker10> createState() => _newsliderlikra_mojaker10State();
}
class _newsliderlikra_mojaker10State extends State<newsliderlikra_mojaker10> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_40_IMG_7555.JPG?alt=media&token=b7ad42ad-3b64-493a-a62d-629cbf74b6fd';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mjaker%2F2024_02_27_23_40_IMG_7555.JPG?alt=media&token=b7ad42ad-3b64-493a-a62d-629cbf74b6fd',
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class newsliderlonen extends StatefulWidget {
  const newsliderlonen
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlonen> createState() => _newsliderlonenState();
}
class _newsliderlonenState extends State<newsliderlonen> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_28_IMG_7455.JPG?alt=media&token=9b072cb0-7583-4204-9ccb-9b08bef30388';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_28_IMG_7455.JPG?alt=media&token=9b072cb0-7583-4204-9ccb-9b08bef30388',
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


class newsliderlonen1 extends StatefulWidget {
  const newsliderlonen1
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlonen1> createState() => _newsliderlonen1State();
}
class _newsliderlonen1State extends State<newsliderlonen1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_31_IMG_7456.JPG?alt=media&token=758fee9b-12c8-49bb-8480-2d05fa6a7485';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_31_IMG_7456.JPG?alt=media&token=758fee9b-12c8-49bb-8480-2d05fa6a7485',
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

class newsliderlonen2 extends StatefulWidget {
  const newsliderlonen2
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlonen2> createState() => _newsliderlonen2State();
}
class _newsliderlonen2State extends State<newsliderlonen2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_35_IMG_7463.JPG?alt=media&token=b5842877-e909-44b0-a63b-a35e7f2b0bc2';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_35_IMG_7463.JPG?alt=media&token=b5842877-e909-44b0-a63b-a35e7f2b0bc2',
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

class newsliderlonen3 extends StatefulWidget {
  const newsliderlonen3
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlonen3> createState() => _newsliderlonen3State();
}
class _newsliderlonen3State extends State<newsliderlonen3> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_52_IMG_7472.JPG?alt=media&token=5477e3bb-49dd-4702-8648-41f8dd0be56f';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_52_IMG_7472.JPG?alt=media&token=5477e3bb-49dd-4702-8648-41f8dd0be56f',
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

class newsliderlonen4 extends StatefulWidget {
  const newsliderlonen4
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlonen4> createState() => _newsliderlonen4State();
}
class _newsliderlonen4State extends State<newsliderlonen4> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_55_IMG_7473.JPG?alt=media&token=c8bbb67a-3c98-498d-8640-e6f786aa315b';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_55_IMG_7473.JPG?alt=media&token=c8bbb67a-3c98-498d-8640-e6f786aa315b',
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

class newsliderlonen5 extends StatefulWidget {
  const newsliderlonen5
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlonen5> createState() => _newsliderlonen5State();
}
class _newsliderlonen5State extends State<newsliderlonen5> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_59_IMG_7476.JPG?alt=media&token=3f85aeea-0359-4cbf-98c3-63f7e08ac671';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_22_59_IMG_7476.JPG?alt=media&token=3f85aeea-0359-4cbf-98c3-63f7e08ac671',
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

class newsliderlonen6 extends StatefulWidget {
  const newsliderlonen6
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlonen6> createState() => _newsliderlonen6State();
}
class _newsliderlonen6State extends State<newsliderlonen6> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_23_00_IMG_7478.JPG?alt=media&token=802d2d60-ba09-4879-b17b-70aa89d3f78b';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_23_00_IMG_7478.JPG?alt=media&token=802d2d60-ba09-4879-b17b-70aa89d3f78b',
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

class newsliderlonen7 extends StatefulWidget {
  const newsliderlonen7
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlonen7> createState() => _newsliderlonen7State();
}
class _newsliderlonen7State extends State<newsliderlonen7> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_23_05_IMG_7480.JPG?alt=media&token=7dccd1b8-3473-4623-927d-97bfb3eb8a9c';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_23_05_IMG_7480.JPG?alt=media&token=7dccd1b8-3473-4623-927d-97bfb3eb8a9c',
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

class newsliderlonen8 extends StatefulWidget {
  const newsliderlonen8
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlonen8> createState() => _newsliderlonen8State();
}
class _newsliderlonen8State extends State<newsliderlonen8> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_23_07_IMG_7481.JPG?alt=media&token=1d6a906e-f19c-4f50-8a49-aaa75d1427b1';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_23_07_IMG_7481.JPG?alt=media&token=1d6a906e-f19c-4f50-8a49-aaa75d1427b1',
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

class newsliderlonen9 extends StatefulWidget {
  const newsliderlonen9
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlonen9> createState() => _newsliderlonen9State();
}
class _newsliderlonen9State extends State<newsliderlonen9> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_23_10_IMG_7482.JPG?alt=media&token=0aeb8da2-a537-40e3-a067-98033b939735';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_23_10_IMG_7482.JPG?alt=media&token=0aeb8da2-a537-40e3-a067-98033b939735',
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

class newsliderlonen10 extends StatefulWidget {
  const newsliderlonen10
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlonen10> createState() => _newsliderlonen10State();
}
class _newsliderlonen10State extends State<newsliderlonen10> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_23_14_IMG_7483.JPG?alt=media&token=f9526587-b20a-4539-9b83-7ffe0f6f2d1c';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lonen%2F2024_02_26_23_14_IMG_7483.JPG?alt=media&token=f9526587-b20a-4539-9b83-7ffe0f6f2d1c',
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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class newslidergorgetsatan extends StatefulWidget {
  const newslidergorgetsatan
  ({Key? key}) : super(key: key);

  @override
  State<newslidergorgetsatan> createState() => _newslidergorgetsatanState();
}
class _newslidergorgetsatanState extends State<newslidergorgetsatan> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_19_IMG_7310.JPG?alt=media&token=904bda66-7849-4e54-a0a1-64ef4c2e6636';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_19_IMG_7310.JPG?alt=media&token=904bda66-7849-4e54-a0a1-64ef4c2e6636',
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




class newslidergorgetsatan1 extends StatefulWidget {
  const newslidergorgetsatan1
  ({Key? key}) : super(key: key);

  @override
  State<newslidergorgetsatan1> createState() => _newslidergorgetsatan1State();
}
class _newslidergorgetsatan1State extends State<newslidergorgetsatan1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_24_IMG_7319.JPG?alt=media&token=55709def-2263-4a84-9c43-6bb8ce56e981';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_24_IMG_7319.JPG?alt=media&token=55709def-2263-4a84-9c43-6bb8ce56e981',
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


class newslidergorgetsatan2 extends StatefulWidget {
  const newslidergorgetsatan2
  ({Key? key}) : super(key: key);

  @override
  State<newslidergorgetsatan2> createState() => _newslidergorgetsatan2State();
}
class _newslidergorgetsatan2State extends State<newslidergorgetsatan2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_26_IMG_7322.JPG?alt=media&token=130a5322-cdc5-46e4-82d5-445c236c3cfb';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_26_IMG_7322.JPG?alt=media&token=130a5322-cdc5-46e4-82d5-445c236c3cfb',
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


class newslidergorgetsatan3 extends StatefulWidget {
  const newslidergorgetsatan3
  ({Key? key}) : super(key: key);

  @override
  State<newslidergorgetsatan3> createState() => _newslidergorgetsatan3State();
}
class _newslidergorgetsatan3State extends State<newslidergorgetsatan3> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_28_IMG_7324.JPG?alt=media&token=7e4bd035-2f5d-4e25-b0da-c21792f6a60f';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_28_IMG_7324.JPG?alt=media&token=7e4bd035-2f5d-4e25-b0da-c21792f6a60f',
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


class newslidergorgetsatan4 extends StatefulWidget {
  const newslidergorgetsatan4
  ({Key? key}) : super(key: key);

  @override
  State<newslidergorgetsatan4> createState() => _newslidergorgetsatan4State();
}
class _newslidergorgetsatan4State extends State<newslidergorgetsatan4> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_30_IMG_7325.JPG?alt=media&token=8c946947-17b3-4873-b557-7ea48feddeee';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_30_IMG_7325.JPG?alt=media&token=8c946947-17b3-4873-b557-7ea48feddeee',
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


class newslidergorgetsatan5 extends StatefulWidget {
  const newslidergorgetsatan5
  ({Key? key}) : super(key: key);

  @override
  State<newslidergorgetsatan5> createState() => _newslidergorgetsatan5State();
}
class _newslidergorgetsatan5State extends State<newslidergorgetsatan5> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_32_IMG_7330.JPG?alt=media&token=c3913826-29f1-4441-9396-41f6ea5bce18';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_32_IMG_7330.JPG?alt=media&token=c3913826-29f1-4441-9396-41f6ea5bce18',
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


class newslidergorgetsatan6 extends StatefulWidget {
  const newslidergorgetsatan6
  ({Key? key}) : super(key: key);

  @override
  State<newslidergorgetsatan6> createState() => _newslidergorgetsatan6State();
}
class _newslidergorgetsatan6State extends State<newslidergorgetsatan6> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_35_IMG_7331.JPG?alt=media&token=409acee1-db9e-4b42-9a49-a745001af7ec';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_35_IMG_7331.JPG?alt=media&token=409acee1-db9e-4b42-9a49-a745001af7ec',
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


class newslidergorgetsatan7 extends StatefulWidget {
  const newslidergorgetsatan7
  ({Key? key}) : super(key: key);

  @override
  State<newslidergorgetsatan7> createState() => _newslidergorgetsatan7State();
}
class _newslidergorgetsatan7State extends State<newslidergorgetsatan7> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_36_IMG_7333.JPG?alt=media&token=dbb22f76-fe35-4746-88cc-85af47da934a';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_36_IMG_7333.JPG?alt=media&token=dbb22f76-fe35-4746-88cc-85af47da934a',
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


class newslidergorgetsatan8 extends StatefulWidget {
  const newslidergorgetsatan8
  ({Key? key}) : super(key: key);

  @override
  State<newslidergorgetsatan8> createState() => _newslidergorgetsatan8State();
}
class _newslidergorgetsatan8State extends State<newslidergorgetsatan8> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_40_IMG_7337.JPG?alt=media&token=5c3811e4-db10-4bb3-8ff3-5d0c0f8f9d5e';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_40_IMG_7337.JPG?alt=media&token=5c3811e4-db10-4bb3-8ff3-5d0c0f8f9d5e',
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


class newslidergorgetsatan9 extends StatefulWidget {
  const newslidergorgetsatan9
  ({Key? key}) : super(key: key);

  @override
  State<newslidergorgetsatan9> createState() => _newslidergorgetsatan9State();
}
class _newslidergorgetsatan9State extends State<newslidergorgetsatan9> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_41_IMG_7338.JPG?alt=media&token=77814fc9-c273-402f-8483-98df738a57e4';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_41_IMG_7338.JPG?alt=media&token=77814fc9-c273-402f-8483-98df738a57e4',
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


class newslidergorgetsatan10 extends StatefulWidget {
  const newslidergorgetsatan10
  ({Key? key}) : super(key: key);

  @override
  State<newslidergorgetsatan10> createState() => _newslidergorgetsatan10State();
}
class _newslidergorgetsatan10State extends State<newslidergorgetsatan10> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_44_IMG_7342.JPG?alt=media&token=f017cbf8-4b8d-49cd-8371-6e3e8f78543f';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/satan%20%2B%20gorget%2F2024_02_20_00_44_IMG_7342.JPG?alt=media&token=f017cbf8-4b8d-49cd-8371-6e3e8f78543f',
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class newslidercottomskar1 extends StatefulWidget {
  const newslidercottomskar1
  ({Key? key}) : super(key: key);

  @override
  State<newslidercottomskar1> createState() => _newslidercottomskar1State();
}
class _newslidercottomskar1State extends State<newslidercottomskar1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_31_IMG_8111.JPG?alt=media&token=7870b5ac-7f9b-400f-ba07-a7fa57b53e6c';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_31_IMG_8111.JPG?alt=media&token=7870b5ac-7f9b-400f-ba07-a7fa57b53e6c',
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


class newslidercottomskar2 extends StatefulWidget {
  const newslidercottomskar2
  ({Key? key}) : super(key: key);

  @override
  State<newslidercottomskar2> createState() => _newslidercottomskar2State();
}
class _newslidercottomskar2State extends State<newslidercottomskar2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_33_IMG_8112.JPG?alt=media&token=2f1745ea-d4f3-497a-8112-07ea511ac469';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_33_IMG_8112.JPG?alt=media&token=2f1745ea-d4f3-497a-8112-07ea511ac469',
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


class newslidercottomskar3 extends StatefulWidget {
  const newslidercottomskar3
  ({Key? key}) : super(key: key);

  @override
  State<newslidercottomskar3> createState() => _newslidercottomskar3State();
}
class _newslidercottomskar3State extends State<newslidercottomskar3> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_36_IMG_8113.JPG?alt=media&token=bec7c9ef-641d-47c4-b372-8486e5b09a4e';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_36_IMG_8113.JPG?alt=media&token=bec7c9ef-641d-47c4-b372-8486e5b09a4e',
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


class newslidercottomskar4 extends StatefulWidget {
  const newslidercottomskar4
  ({Key? key}) : super(key: key);

  @override
  State<newslidercottomskar4> createState() => _newslidercottomskar4State();
}
class _newslidercottomskar4State extends State<newslidercottomskar4> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_40_IMG_8114.JPG?alt=media&token=2ec81cfd-9c61-4ba7-9063-6b498f385de2';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_40_IMG_8114.JPG?alt=media&token=2ec81cfd-9c61-4ba7-9063-6b498f385de2',
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


class newslidercottomskar5 extends StatefulWidget {
  const newslidercottomskar5
  ({Key? key}) : super(key: key);

  @override
  State<newslidercottomskar5> createState() => _newslidercottomskar5State();
}
class _newslidercottomskar5State extends State<newslidercottomskar5> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_47_IMG_8118.JPG?alt=media&token=5843580b-d7cc-489c-aea2-2914fb07b83c';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_47_IMG_8118.JPG?alt=media&token=5843580b-d7cc-489c-aea2-2914fb07b83c',
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


class newslidercottomskar6 extends StatefulWidget {
  const newslidercottomskar6
  ({Key? key}) : super(key: key);

  @override
  State<newslidercottomskar6> createState() => _newslidercottomskar6State();
}
class _newslidercottomskar6State extends State<newslidercottomskar6> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_53_IMG_8123.JPG?alt=media&token=049585fa-a224-440b-8378-dea1f7780ecc';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_21_53_IMG_8123.JPG?alt=media&token=049585fa-a224-440b-8378-dea1f7780ecc',
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


class newslidercottomskar7 extends StatefulWidget {
  const newslidercottomskar7
  ({Key? key}) : super(key: key);

  @override
  State<newslidercottomskar7> createState() => _newslidercottomskar7State();
}
class _newslidercottomskar7State extends State<newslidercottomskar7> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_22_00_IMG_8124.JPG?alt=media&token=3773e0f0-9be5-4109-9f46-6d4cf6cadc42';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/cotton%20mosakar%2F2024_03_17_22_00_IMG_8124.JPG?alt=media&token=3773e0f0-9be5-4109-9f46-6d4cf6cadc42',
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
///////////////////////////////////////////////////////////////////////////////////////////
class newsliderlikra_mksar extends StatefulWidget {
  const newsliderlikra_mksar
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mksar> createState() => _newsliderlikra_mksarState();
}
class _newsliderlikra_mksarState extends State<newsliderlikra_mksar> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_26_IMG_7878.JPG?alt=media&token=efd922c1-de7e-4cc9-8f14-83bd76d9f1be';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_26_IMG_7878.JPG?alt=media&token=efd922c1-de7e-4cc9-8f14-83bd76d9f1be',
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

class newsliderlikra_mksar1 extends StatefulWidget {
  const newsliderlikra_mksar1
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mksar1> createState() => _newsliderlikra_mksar1State();
}
class _newsliderlikra_mksar1State extends State<newsliderlikra_mksar1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_31_IMG_7880.JPG?alt=media&token=47d37a2f-7a34-4584-afdf-0e0d0be4bc47';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_31_IMG_7880.JPG?alt=media&token=47d37a2f-7a34-4584-afdf-0e0d0be4bc47',
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


class newsliderlikra_mksar2 extends StatefulWidget {
  const newsliderlikra_mksar2
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mksar2> createState() => _newsliderlikra_mksar2State();
}
class _newsliderlikra_mksar2State extends State<newsliderlikra_mksar2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_34_IMG_7881.JPG?alt=media&token=a2db1514-25de-4695-8216-e6d2e7c18d59';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_34_IMG_7881.JPG?alt=media&token=a2db1514-25de-4695-8216-e6d2e7c18d59',
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


class newsliderlikra_mksar3 extends StatefulWidget {
  const newsliderlikra_mksar3
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mksar3> createState() => _newsliderlikra_mksar3State();
}
class _newsliderlikra_mksar3State extends State<newsliderlikra_mksar3> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_39_IMG_7882.JPG?alt=media&token=f034b92f-2d2c-426f-8468-b7c970668a8d';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_39_IMG_7882.JPG?alt=media&token=f034b92f-2d2c-426f-8468-b7c970668a8d',
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


class newsliderlikra_mksar4 extends StatefulWidget {
  const newsliderlikra_mksar4
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mksar4> createState() => _newsliderlikra_mksar4State();
}
class _newsliderlikra_mksar4State extends State<newsliderlikra_mksar4> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_42_IMG_7883.JPG?alt=media&token=6ef7ce29-6fa8-4843-8d26-1c60626d6d4e';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_42_IMG_7883.JPG?alt=media&token=6ef7ce29-6fa8-4843-8d26-1c60626d6d4e',
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

class newsliderlikra_mksar5 extends StatefulWidget {
  const newsliderlikra_mksar5
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mksar5> createState() => _newsliderlikra_mksar5State();
}
class _newsliderlikra_mksar5State extends State<newsliderlikra_mksar5> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_49_IMG_7886.JPG?alt=media&token=dee09d12-71b0-48d9-9b46-f25f95ae10aa';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_49_IMG_7886.JPG?alt=media&token=dee09d12-71b0-48d9-9b46-f25f95ae10aa',
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

class newsliderlikra_mksar6 extends StatefulWidget {
  const newsliderlikra_mksar6
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mksar6> createState() => _newsliderlikra_mksar6State();
}
class _newsliderlikra_mksar6State extends State<newsliderlikra_mksar6> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_52_IMG_7887.JPG?alt=media&token=6e43a836-36c6-480c-b92c-105573711862';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_52_IMG_7887.JPG?alt=media&token=6e43a836-36c6-480c-b92c-105573711862',
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

class newsliderlikra_mksar7 extends StatefulWidget {
  const newsliderlikra_mksar7
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mksar7> createState() => _newsliderlikra_mksar7State();
}
class _newsliderlikra_mksar7State extends State<newsliderlikra_mksar7> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_55_IMG_7890.JPG?alt=media&token=8ef86d5b-aded-4e47-bae6-3c86d7c73aa5';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_55_IMG_7890.JPG?alt=media&token=8ef86d5b-aded-4e47-bae6-3c86d7c73aa5',
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

class newsliderlikra_mksar8 extends StatefulWidget {
  const newsliderlikra_mksar8
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlikra_mksar8> createState() => _newsliderlikra_mksar8State();
}
class _newsliderlikra_mksar8State extends State<newsliderlikra_mksar8> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_58_IMG_7891.JPG?alt=media&token=d7257f97-4894-48bc-9e3b-05bf8a204d3a';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/likra%20mksar%2F2024_03_08_21_58_IMG_7891.JPG?alt=media&token=d7257f97-4894-48bc-9e3b-05bf8a204d3a',
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class newsliderlyorah_glutter extends StatefulWidget {
  const newsliderlyorah_glutter
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlyorah_glutter> createState() => _newsliderlyorah_glutterState();
}
class _newsliderlyorah_glutterState extends State<newsliderlyorah_glutter> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lyorah%20glutter%2F2024_03_16_20_07_IMG_8096.JPG?alt=media&token=751a1ce5-518f-4fbc-b0a2-6bf61549c753';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lyorah%20glutter%2F2024_03_16_20_07_IMG_8096.JPG?alt=media&token=751a1ce5-518f-4fbc-b0a2-6bf61549c753',
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


class newsliderlyorah_glutter1 extends StatefulWidget {
  const newsliderlyorah_glutter1
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlyorah_glutter1> createState() => _newsliderlyorah_glutter1State();
}
class _newsliderlyorah_glutter1State extends State<newsliderlyorah_glutter1> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lyorah%20glutter%2F2024_03_16_20_11_IMG_8097.JPG?alt=media&token=d9f9267f-b67e-49e7-979a-09a9794115a9';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lyorah%20glutter%2F2024_03_16_20_11_IMG_8097.JPG?alt=media&token=d9f9267f-b67e-49e7-979a-09a9794115a9',
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


class newsliderlyorah_glutter2 extends StatefulWidget {
  const newsliderlyorah_glutter2
  ({Key? key}) : super(key: key);

  @override
  State<newsliderlyorah_glutter2> createState() => _newsliderlyorah_glutter2State();
}
class _newsliderlyorah_glutter2State extends State<newsliderlyorah_glutter2> {
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
        'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lyorah%20glutter%2F2024_03_16_20_54_IMG_8098.JPG?alt=media&token=73ff55c9-cb46-470b-ad95-5b5cac1bcb20';

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
                            'https://firebasestorage.googleapis.com/v0/b/gorget-store-last-one.appspot.com/o/lyorah%20glutter%2F2024_03_16_20_54_IMG_8098.JPG?alt=media&token=73ff55c9-cb46-470b-ad95-5b5cac1bcb20',
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




////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  FullScreenImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Close the fullscreen image when tapped
          Navigator.pop(context);
        },
        child: Center(
          child: PhotoView(
            imageProvider: NetworkImage(imageUrl),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          ),
        ),
      ),
    );
  }
}













    //////////////////////////////////////////////////////////////
    ///






