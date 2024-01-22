import 'package:ai_assistant/constraints/constants.dart';
import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/model/onboard.dart';
import 'package:ai_assistant/screens/home_screen.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c=PageController();
    final list=[
      Onboard(title: "Ask me Anything",
       subtitle: "I can be your best friend & you can ask me anything & I'll help you!",
        animation: "ai_ask_me"),
        Onboard(title: "Imagination to Reality",
       subtitle: "Just Imagine anything & let me know,I'll create something wonderful for you! ",
        animation: "ai_play"),
    ];

    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount:list.length ,
        itemBuilder: (context,index){
          final isLast=index==list.length-1;
        return Column(
        children: [
          // Lottie animation
          Lottie.asset('assets/Animations/${list[index].animation}.json',
          height: mq.height *.6 ,width:isLast? mq.width *.7:null),
          Text(list[index].title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,letterSpacing: 0.5),),
          SizedBox(height: mq.height *.01,),
          SizedBox(
            width: mq.width *.7,
            child: Text(list[index].subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(letterSpacing: .5,color:  Theme.of(context).lightTextColor),
            ),
          ),
          // dots
          Spacer(),
          Wrap(
            spacing: 10,
            children:    
              List.generate(list.length, (i) => Container(
                width:i==index?15:10,height: 8,
                decoration: BoxDecoration(
                  color:i==index?Colors.blue:Colors.grey,
                  borderRadius: BorderRadius.circular(10)),
                  )),
            ),
          // button
          Spacer(),
          // custom button
          CustomBtn(onTap: (){
            if(isLast){
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>HomeScreen()));
                  Get.off(()=>HomeScreen());
                }
                else{
                  c.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                }
          }, 
          txt: isLast?"Finish":"Next"), 
            Spacer(flex: 2,),
        ]);
      })
    );
  }
}