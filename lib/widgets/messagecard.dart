import 'package:ai_assistant/constraints/constants.dart';
import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const r=Radius.circular(15);
    return message.msgType==MessageType.bot?
    // for bot reply left
     Row(
      children: [
        const SizedBox(width: 6,),
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: Image.asset('assets/images/logo.png',width: 25,),
        ),
        Container(
           constraints: BoxConstraints(maxWidth: mq.width *.6),
          margin: EdgeInsets.only(bottom: mq.height *.02,left: mq.width *.02),
          padding: EdgeInsets.symmetric(vertical: mq.height*0.01,horizontal: mq.width *.02),
          decoration: BoxDecoration(border: Border.all(color: Theme.of(context).lightTextColor),borderRadius: BorderRadius.only(topLeft:r,topRight: r,bottomRight: r )),
         
          // animated text
          child:message.msg.isEmpty? AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Please wait...',                      
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
          repeatForever: true,
  
):Text(message.msg),
        )
      ],
    ):
    // for user asking right
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [      
        Container(
          constraints: BoxConstraints(maxWidth: mq.width *.6),
          margin: EdgeInsets.only(bottom: mq.height *.02,right: mq.width *.02),
          padding: EdgeInsets.symmetric(vertical: mq.height*0.01,horizontal: mq.width *.02),
          decoration: BoxDecoration(border: Border.all(color: Theme.of(context).lightTextColor),
          borderRadius: BorderRadius.only(topLeft:r,topRight: r,bottomLeft: r )),
          child: Text(message.msg),
        ),
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: Icon(Icons.person_2_sharp,color: Colors.blue,)
        ),
      ],
    );
  }
}