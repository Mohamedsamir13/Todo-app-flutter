import 'package:flutter/material.dart';
import 'package:todoapp/Screens/layout_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  skipSplash() {
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      return Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LayoutScreen(),
          ),
              (route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    skipSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextStyle(
                  style: const TextStyle(
                  fontSize: 40.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AnimatedTextKit({required List animatedTexts, required bool isRepeatingAnimation, required Null Function() onTap}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          height: 200,
          color: Colors.white,
          child: const Center(child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("To Do List",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.blue),),
          )),
        ),
      ),
    );
  }
}

class WavyAnimatedText {
}
