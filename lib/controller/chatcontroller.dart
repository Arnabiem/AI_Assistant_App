import 'package:ai_assistant/api/Api.dart';
import 'package:ai_assistant/constraints/dialog_box.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Getxcontroller is a class which helps to maintain the state of the Ui,no need to use 
//setstate 
class ChatController extends GetxController{
  final textC=TextEditingController();
  final scrollC=ScrollController();
  // obs-> for new msg ui will get updated automatically
  final list=<Message>[
    Message(msg: "Hello,How can I assist you?", msgType: MessageType.bot)
  ].obs;
  Future<void> askQuestion() async {
    if(textC.text.trim().isNotEmpty){
      // user
      list.add(Message(msg: textC.text, msgType: MessageType.user));
     
      // ai bot
      list.add(Message(msg: '', msgType: MessageType.bot));
       _scrollDown();
      final res=await APIs.getanswer(textC.text);
      list.removeLast();
      list.add(Message(msg: res, msgType: MessageType.bot));
       _scrollDown();
      // clear text
      textC.text='';
    }else{
      MyDialog.info('Please Ask Something!🙂');
    }
  }
  // to show the last chat of the screen
  void _scrollDown(){
    scrollC.animateTo(scrollC.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}