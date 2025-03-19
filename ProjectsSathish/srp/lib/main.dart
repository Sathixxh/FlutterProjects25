// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData.light(useMaterial3: true),
//       darkTheme: ThemeData.dark(useMaterial3: true),
//       home: const HomePage(),
//     );
//   }
// }



// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final screenCaptureProtected = ValueNotifier(false);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Prevent Screen Capture"),
//       ),
//       body: Center(
//         child: ValueListenableBuilder<bool>(
//           valueListenable: screenCaptureProtected,
//           builder: (context, value, child) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   value ? Icons.lock : Icons.lock_open,
//                   size: 50,
//                   color: value ? Colors.red : null,
//                 ),
//                 Text(
//                   'Screen capture protection is ${value ? 'ON' : 'OFF'}',
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _handleScreenCaptureTogglePressed,
//         child: const Icon(Icons.key),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }

//   void _handleScreenCaptureTogglePressed() async {
//     final nextValue = !screenCaptureProtected.value;
//     await PlatformUtil.preventScreenCapture(enable: nextValue);
//     screenCaptureProtected.value = nextValue;
//   }
// }




// class PlatformUtil {
//   static const methodChannelName = 'io.alexmelnyk.utils';
//   static const  methodChannel = MethodChannel(methodChannelName);

//   static Future<void> preventScreenCapture({bool enable = false}) {
//     return methodChannel.invokeMethod<void>('preventScreenCapture', {
//       'enable': enable,
//     });
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const platform = MethodChannel('screen_mirror');
  bool isMirroring = false;

  Future<void> checkForScreenMirror() async {
    try {
      final bool result = await platform.invokeMethod('checkScreenMirror');
      setState(() {
        isMirroring = result;
      });
    } on PlatformException catch (e) {
      print("Failed to check screen mirroring: '${e.message}'.");
    }
  }

  @override
  void initState() {
    super.initState();
    checkForScreenMirror();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen Mirroring Detection')),
      body: Center(
        child: isMirroring
            ? const Text(
                "Screen Mirroring Detected!\nFeature Disabled!",
                style: TextStyle(color: Colors.red, fontSize: 20),
                textAlign: TextAlign.center,
              )
            : const Text(
                "No Screen Mirroring\nApp is fully functional",
                style: TextStyle(color: Colors.green, fontSize: 20),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
