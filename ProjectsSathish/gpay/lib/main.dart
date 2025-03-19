// // import 'package:flutter/material.dart';
// // import 'package:url_launcher/url_launcher.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'UPI Payment',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: const PaymentScreen(),
// //     );
// //   }
// // }

// // class PaymentScreen extends StatefulWidget {
// //   const PaymentScreen({super.key});

// //   @override
// //   State<PaymentScreen> createState() => _PaymentScreenState();
// // }

// // class _PaymentScreenState extends State<PaymentScreen> {
// //   String _upiId = "jayasurya9483@okaxis"; // Replace with your actual UPI ID
// //   String _merchantName = "Jp Art";
// //   double _amount = 1.0;

// //   Future<void> _launchUPIPayment(String upiUrl) async {
// //     Uri uri = Uri.parse(upiUrl);
// //     if (!await launchUrl(uri)) {
// //       throw Exception('Could not launch $uri');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     String gpayUrl =
// //         "upi://pay?pa=$_upiId&pn=$_merchantName&mc=1234&tid=123456789&tr=123456789&tn=Test Payment&am=$_amount&cu=INR";
// //     String phonePeUrl =
// //         "phonepe://pay?pa=$_upiId&pn=$_merchantName&mc=1234&tid=123456789&tr=123456789&tn=Test Payment&am=$_amount&cu=INR";

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("UPI Payment"),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             ElevatedButton(
// //               onPressed: () => _launchUPIPayment(gpayUrl),
// //               child: const Text("Pay with Google Pay"),
// //             ),
// //             const SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () => _launchUPIPayment(phonePeUrl),
// //               child: const Text("Pay with PhonePe"),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'UPI Payment',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const PaymentScreen(),
//     );
//   }
// }

// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({super.key});

//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   String _upiId = "jay9483@okaxis"; // Replace with your actual UPI ID
//   String _merchantName = "Jp Art";
//   double _amount = 1.0;

//   Future<void> _launchUPIPayment(String upiUrl) async {
//     Uri uri = Uri.parse(upiUrl);
//     if (!await launchUrl(uri)) {
//       throw Exception('Could not launch $uri');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     String gpayUrl =
//         "upi://pay?pa=$_upiId&pn=$_merchantName&mc=1234&tid=123456789&tr=123456789&tn=Test Payment&am=$_amount&cu=INR";
//     String phonePeUrl =
//         "phonepe://pay?pa=$_upiId&pn=$_merchantName&mc=1234&tid=123456789&tr=123456789&tn=Test Payment&am=$_amount&cu=INR";

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("UPI Payment"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () => _launchUPIPayment(gpayUrl),
//               child: const Text("Pay with Google Pay"),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _launchUPIPayment(phonePeUrl),
//               child: const Text("Pay with PhonePe"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// // your money has not been debited  
// // youve exceeded the bank limit for this payment Rety witha smaller amount  
// // check UPI limit per bank 

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'UPI Payment',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const PaymentScreen(),
//     );
//   }
// }

// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({super.key});

//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   String _upiId = "satheeshmari2711-1@okhdfcbank"; // Replace with your actual UPI ID
//   String _merchantName = "Sathish";
//   double _amount = 1.0;

//   Future<void> _launchUPIPayment(String upiUrl) async {
//     Uri uri = Uri.parse(upiUrl);
//     if (!await launchUrl(uri)) {
//       throw Exception('Could not launch $uri');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     String gpayUrl =
//         "upi://pay?pa=$_upiId&pn=$_merchantName&mc=1234&tid=123456789&tr=123456789&tn= Payment&am=$_amount&cu=INR";
//     String phonePeUrl =
//         "phonepe://pay?pa=$_upiId&pn=$_merchantName&mc=1234&tid=123456789&tr=123456789&tn= Payment&am=$_amount&cu=INR";

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("UPI Payment"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () => _launchUPIPayment(gpayUrl),
//               child: const Text("Pay with Google Pay"),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _launchUPIPayment(phonePeUrl),
//               child: const Text("Pay with PhonePe"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPI Payment',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final String _upiId = "satheeshmari2711-1@okhdfcbank"; // Replace with actual UPI ID
  final String _merchantName = "Sathish";
  final String _transactionNote = "Payment for Order";
  final String _currency = "INR";
  final String _amount = "10.00"; // Try a smaller amount

  Future<void> _launchUPIPayment(String upiUrl) async {
    Uri uri = Uri.parse(upiUrl);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
 String gpayUrl =
    "upi://pay?pa=$_upiId&pn=$_merchantName&tn=$_transactionNote&am=$_amount&cu=INR&mode=04&purpose=00";

    String phonePeUrl =
        "phonepe://pay?pa=$_upiId&pn=$_merchantName&tn=$_transactionNote&am=$_amount&cu=$_currency";

    return Scaffold(
      appBar: AppBar(title: const Text("UPI Payment")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _launchUPIPayment(gpayUrl),
              child: const Text("Pay with Google Pay"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _launchUPIPayment(phonePeUrl),
              child: const Text("Pay with PhonePe"),
            ),
          ],
        ),
      ),
    );
  }
}
