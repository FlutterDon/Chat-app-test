import 'package:chattingapp/firebase_options.dart';
import 'package:chattingapp/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Splash(),
      ),
    );
  }
}
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  void getdata()async{
    await(Future.delayed(Duration(seconds: 3)));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signin()));
  }
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Container(width: screenWidth, height: screenHeight);
    return Scaffold(
      body: Stack(
          children: [
            Container(
              child: Container(
                width: 400,
                height: 300,
                 child: Image.asset("assets/logo.png"),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              color: Colors.white,    ),
            // InkWell(
            //   onTap: (){
            //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>secondpage()));
            //   },
            // )
          ]
      ),
    );
  }
}
