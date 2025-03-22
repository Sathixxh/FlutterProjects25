import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase App',
        theme: ThemeData.light(),
        home: AuthWrapper(),
      ),
    );
  }
}

// Check if user is logged in
class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, auth, child) {
        return auth.user != null ? HomeScreen() : LoginScreen();
      },
    );
  }
}




class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  User? get user => _user;

  AuthService() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  // Sign Up
  Future<String?> signUp(String email, String password, String name) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;

      await FirebaseFirestore.instance.collection("users").doc(_user!.uid).set({
        'name': name,
        'email': email,
        'createdAt': DateTime.now(),
      });

      notifyListeners();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Login
  Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Logout
  void signOut() async {
    await _auth.signOut();
    notifyListeners();
  }
}




class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                String? error = await Provider.of<AuthService>(context, listen: false)
                    .signIn(emailController.text, passwordController.text);
                if (error != null) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
              },
              child: Text("Login"),
            ),
            TextButton(
  onPressed: () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => ForgotPasswordScreen()),
  ),
  child: Text("Forgot Password?"),
),

            TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen())), child: Text("Don't have an account? Sign Up"))
          ],
        ),
      ),
    );
  }
}





class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String? error = await Provider.of<AuthService>(context, listen: false)
                    .signUp(emailController.text, passwordController.text, nameController.text);
                if (error != null) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
              },
              child: Text("Sign Up"),
            ),
            TextButton(
  onPressed: () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => ForgotPasswordScreen()),
  ),
  child: Text("Forgot Password?"),
),

          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome, ${auth.user?.email ?? 'Guest'}"),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => auth.signOut(), child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}


class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter your email to reset your password"),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text.trim();
                if (email.isNotEmpty) {
                  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Password reset link sent to your email")),
                  );
                  Navigator.pop(context); // Go back to login screen
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter a valid email")),
                  );
                }
              },
              child: Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SignInScreen(),
//     );
//   }
// }



// class PhoneAuthScreen extends StatefulWidget {
//   @override
//   _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
// }

// class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _otpController = TextEditingController();
//   String verificationId = '';

//   void sendOTP() async {
//     await _auth.verifyPhoneNumber(
//       phoneNumber: _phoneController.text,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await _auth.signInWithCredential(credential);
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         print("Verification Failed: ${e.message}");
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         setState(() {
//           this.verificationId = verificationId;
//         });
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }

//   void verifyOTP() async {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: verificationId,
//       smsCode: _otpController.text,
//     );

//     await _auth.signInWithCredential(credential);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Phone Authentication")),
//       body: Column(
//         children: [
//           TextField(controller: _phoneController, decoration: InputDecoration(labelText: "Phone Number")),
//           ElevatedButton(onPressed: sendOTP, child: Text("Send OTP")),
//           TextField(controller: _otpController, decoration: InputDecoration(labelText: "Enter OTP")),
//           ElevatedButton(onPressed: verifyOTP, child: Text("Verify OTP")),
//         ],
//       ),
//     );
//   }
// }




// class GoogleSignInScreen extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<UserCredential?> signInWithGoogle() async {
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     if (googleUser == null) return null;
    
//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//     final OAuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     return await _auth.signInWithCredential(credential);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Google Sign-In")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await signInWithGoogle();
//           },
//           child: Text("Sign in with Google"),
//         ),
//       ),
//     );
//   }
// }



// class SignInScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Sign In Options")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneAuthScreen()));
//             },
//             child: Text("Sign in with Phone Number"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleSignInScreen()));
//             },
//             child: Text("Sign in with Google"),
//           ),
//         ],
//       ),
//     );
//   }
// }
