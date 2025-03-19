// // main.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
  
//   // set the publishable key for Stripe - this is mandatory
//   Stripe.publishableKey = "pk_test_51QkeKwKx1AlJ2GZMvc8UETXykkrAdCRWy6XduJjjXWc2TlYWVkvfPzMPZusDSPG91mWC2MrAj9Jkt3fk3yfr26jP00ORZNgvuD";
//   runApp(App());
// }
// class App extends StatefulWidget {
//   const App({super.key});

//   @override
//   State<App> createState() => _AppState();
// }

// class _AppState extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: PaymentScreen(),);
//   }
// }
// // payment_screen.dart
// class PaymentScreen extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(16),
//         child: CardField(
//           onCardChanged: (card) {
//             print(card);
//           },
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51QkeKwKx1AlJ2GZMvc8UETXykkrAdCRWy6XduJjjXWc2TlYWVkvfPzMPZusDSPG91mWC2MrAj9Jkt3fk3yfr26jP00ORZNgvuD';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: StripePaymentScreen(),
    );
  }
}

class StripePaymentScreen extends StatefulWidget {
  const StripePaymentScreen({super.key});

  @override
  State<StripePaymentScreen> createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Make Payment'),
          onPressed: () async {
            await makePayment();
          },
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      // Create payment intent data
      paymentIntent = await createPaymentIntent('50', 'INR');
      // initialise the payment sheet setup
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Client secret key from payment data
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          googlePay: const PaymentSheetGooglePay(
              // Currency and country code is accourding to India
              testEnv: true,
              currencyCode: "INR",
              merchantCountryCode: "IN"),
          // Merchant Name
          merchantDisplayName: 'Flutterwings',
          // return URl if you want to add
          // returnURL: 'flutterstripe://redirect',
        ),
      );
      // Display payment sheet
      displayPaymentSheet();
    } catch (e) {
      print("exception $e");

      if (e is StripeConfigException) {
        print("Stripe exception ${e.message}");
      } else {
        print("exception $e");
      }
    }
  }

  displayPaymentSheet() async {
    try {
      // "Display payment sheet";
      await Stripe.instance.presentPaymentSheet();
      // Show when payment is done
      // Displaying snackbar for it
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Paid successfully")),
      );
      paymentIntent = null;
    } on StripeException catch (e) {
      // If any error comes during payment 
      // so payment will be cancelled
      print('Error: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(" Payment Cancelled")),
      );
    } catch (e) {
      print("Error in displaying");
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': ((int.parse(amount)) * 100).toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var secretKey =
          "sk_test_51QkeKwKx1AlJ2GZMU7Lj8pqimeUC2j0NDvi0SLOFGbisRA4WmKg1iIVmioB3f9glHmtcDS2OKdy73xTMjb4vOd3k00uJcN9RZc";
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      print('Payment Intent Body: ${response.body.toString()}');
      return jsonDecode(response.body.toString());
    } catch (err) {
      print('Error charging user: ${err.toString()}');
    }
  }
}
