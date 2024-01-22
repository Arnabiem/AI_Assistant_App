import 'package:ai_assistant/constraints/constants.dart';
import 'package:ai_assistant/widgets/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload=true;
    return Card(
      elevation: 0,
      color: Colors.blue.withOpacity(.2),
      margin: EdgeInsets.only(bottom: mq.height *.02),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        onTap: homeType.onTap,
        child:homeType.leftalign? 
      Row(
        children: [
        Container(
          width:mq.width *.4 ,
          padding: homeType.size,
          child: Lottie.asset('assets/Animations/${homeType.animation}',),
        ),
        Spacer(),
        Text(homeType.title,
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1),),
        Spacer(flex: 2,)
      ]):
      Row(
        children: [        
        Spacer(flex: 2,),
        Text(homeType.title,
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1),),
        
        Spacer(),
        Container(
          width:mq.width *.4 ,
          padding: homeType.size,
          child: Lottie.asset('assets/Animations/${homeType.animation}',),
        ),
      ])
      ),
      
    ).animate().fade(duration: NumDurationExtensions(1).seconds,curve: Curves.easeIn);
  }
}