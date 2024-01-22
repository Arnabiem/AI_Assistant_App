import 'package:ai_assistant/constraints/constants.dart';
import 'package:ai_assistant/controller/chatcontroller.dart';
import 'package:ai_assistant/main.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:ai_assistant/widgets/messagecard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  final _c=ChatController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Chat with AI Assistant'),),

      // obx widget for ui update
      body: Obx(        
        ()=> ListView(
          physics: BouncingScrollPhysics(),   
          controller: _c.scrollC,       
          padding: EdgeInsets.only(bottom: mq.height *.1,top: mq.height *.02),
          children: _c.list.map((e) => MessageCard(message:e)).toList(),          
        ),
      ),

      
      // textfield
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal:8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _c.textC,
              onTapOutside:(e)=> FocusScope.of(context).unfocus(),
              textAlign: TextAlign.center,
              decoration:  InputDecoration(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                filled: true,                
                isDense: true,
                hintText: "Ask me anything you want....",
                hintStyle: const TextStyle(fontSize: 15),
                border: const OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(50))
                ),
              ),
            )),
            const SizedBox(width: 10,),
            // button
            CircleAvatar(
              backgroundColor: Theme.of(context).buttonColor,
              radius: 25,
              child: IconButton
              (icon: const Icon(Icons.rocket_launch_rounded,
              color: Colors.white,size: 28,), 
              onPressed: _c.askQuestion),
            )
        ]),
      ),
      
    );
  }
}