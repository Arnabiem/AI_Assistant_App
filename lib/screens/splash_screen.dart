// import 'package:ai_assistant/screens/home_screen.dart';
import 'package:ai_assistant/constraints/pref.dart';
import 'package:ai_assistant/screens/home_screen.dart';
import 'package:ai_assistant/screens/onboarding_screen.dart';
import 'package:ai_assistant/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constraints/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
 
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (_)=>pref.showOnboarding?const OnboardingScreen():const HomeScreen()));
  // off->pushplacement(replace the old screen with new one)
  // to->push(put the new screen over the old one)
      Get.off(()=>pref.showOnboarding?const OnboardingScreen():const HomeScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    mq=MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2,),
            Card(
              // color: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding:  EdgeInsets.all(mq.width *.04),
                child: Image.asset('assets/images/logo.png',
                width: mq.width *.4),
              )
              ),
              const Spacer(),
              // lottie animation loading
              const CustomLoading(),
              const Spacer(),
          ],
        ),
      ),
    );
  }
}