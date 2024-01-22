import 'package:ai_assistant/api/Api.dart';
import 'package:ai_assistant/constraints/pref.dart';
import 'package:ai_assistant/widgets/home_card.dart';
import 'package:ai_assistant/widgets/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constraints/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _isDarkMode = Get.isDarkMode.obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    pref.showOnboarding=false;
  }
  @override
  Widget build(BuildContext context) {
    mq=MediaQuery.sizeOf(context);
    // APIs.getanswer("hii");
    return Scaffold(
      appBar: AppBar(title: const Text(appName),
      
      actions: [
        IconButton(onPressed: (){
          Get.changeThemeMode(_isDarkMode.value?ThemeMode.light:ThemeMode.dark);
          _isDarkMode.value = !_isDarkMode.value;
          pref.isDarkMode = _isDarkMode.value;
        },
      padding: const EdgeInsets.only(right: 15),
       icon: Obx(()=> Icon(_isDarkMode.value?Icons.brightness_2_rounded
                      : Icons.brightness_4,size: 26,)),
       )
       ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: mq.width *.04,vertical: mq.height *.015),
    
      children: HomeType.values.map((e) => HomeCard(homeType: e,)).toList(),
      )
    );
  }
}