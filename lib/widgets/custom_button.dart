import 'package:ai_assistant/constraints/constants.dart';
import 'package:ai_assistant/main.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String txt;
  const CustomBtn({super.key, required this.onTap, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
              onPressed: onTap,            
              style: ElevatedButton.styleFrom(
                // backgroundColor: Colors.blueAccent,
                backgroundColor: Theme.of(context).buttonColor,
                shape: const StadiumBorder(),
                elevation: 0,
                textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),
                minimumSize: Size(mq.width *.4, 55)
              ),
              child: Text(txt,style: const TextStyle(color: Colors.white),
              ),
      ),
    );
            
  }
}