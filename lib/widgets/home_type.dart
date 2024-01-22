// Enum is a container which contains predefined items
import 'package:ai_assistant/screens/features/chatbot.dart';
import 'package:ai_assistant/screens/features/image.dart';
import 'package:ai_assistant/screens/features/translator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum HomeType{aiChatBot,aiImage,aiTranslator}
extension MyhomeType on HomeType{
  String get title => switch(this){      
    HomeType.aiChatBot => 'AI ChatBot',   
    HomeType.aiImage => 'AI Image Creator', 
    HomeType.aiTranslator => 'Language Translator',
  };
  String get animation => switch(this){      
    HomeType.aiChatBot => 'ai_hand_waving.json',   
    HomeType.aiImage => 'ai_play.json', 
    HomeType.aiTranslator => 'ai_ask_me.json',
  };
  bool get leftalign => switch(this){      
    HomeType.aiChatBot => true,   
    HomeType.aiImage => false, 
    HomeType.aiTranslator =>true , 
     };
     EdgeInsets get size => switch(this){      
    HomeType.aiChatBot => EdgeInsets.zero,   
    HomeType.aiImage => EdgeInsets.all(20), 
    HomeType.aiTranslator =>EdgeInsets.zero , 
     };
     VoidCallback get onTap => switch(this){      
    HomeType.aiChatBot =>()=> Get.to(()=>ChatBotFeature()),   
    HomeType.aiImage =>()=> Get.to(()=>ImageFeature()), 
    HomeType.aiTranslator =>()=> Get.to(()=>TranslatorFeature()), 
     };
}