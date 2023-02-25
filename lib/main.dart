
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/utils/color_themes.dart';
import 'layout/screen_layout.dart';

//import 'package:flutter/rendering.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCgNPKhQoXMYW3iwGsXPDorOJ__m8NBuPw",
            authDomain: "csr-project-7b103.firebaseapp.com",
            projectId: "csr-project-7b103",
            storageBucket: "csr-project-7b103.appspot.com",
            messagingSenderId: "400837615256",
            appId: "1:400837615256:web:297226e1f3fcbebf613aed"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Amazon Clone",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> user) {
            if (user.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
           // } else if (user.hasData) {
             // return const ScreenLayout();
            } else {
              return const ScreenLayout();
            }
          }),
    );
  }
}
