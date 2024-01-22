import 'package:ai_assistant/constraints/constants.dart';
import 'package:ai_assistant/controller/imagecontroller.dart';
import 'package:ai_assistant/controller/translatecontroller.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:ai_assistant/widgets/custom_loading.dart';
import 'package:ai_assistant/widgets/languagesheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  final _c=TranslateController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Multi Language Translator'),),
      body: ListView(
         physics: const BouncingScrollPhysics(),                       
          padding: EdgeInsets.only(
          bottom: mq.height *.1,
          top: mq.height *.02,
          // right: mq.width *.04,left: mq.width *.04
          ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // from language
            InkWell(
              onTap: ()=> Get.bottomSheet(LanguageSheet(c: _c,s: _c.from,)),
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 50,width: mq.width *.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue)),
                child:  Obx(()=> Text(_c.from.isEmpty?'Auto':_c.from.value)),
              ),
            ),
            // swapping of languages
            IconButton(onPressed: _c.swapLanguages, 
            icon: Obx(
              ()=> Icon(CupertinoIcons.repeat,
              color:_c.to.isNotEmpty && _c.from.isNotEmpty?Colors.blue:Colors.grey,),
            ) ),
          //  to language
            InkWell(
              onTap: ()=> Get.bottomSheet(LanguageSheet(c: _c,s: _c.to,)),
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 50,width: mq.width *.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue)),
                child:Obx(()=> Text(_c.to.isEmpty?'To':_c.to.value)),
              ),
            ),
          ],),
          // input box
          Padding(
            padding:  EdgeInsets.symmetric(vertical: mq.height *.04,horizontal: mq.width *.04),
            child: TextFormField(   
              controller: _c.textC,          
              minLines: 5,
              maxLines: null,
                onTapOutside:(e)=> FocusScope.of(context).unfocus(),
                textAlign: TextAlign.start,
                decoration: const InputDecoration(                
                  hintText: "Translate anything you want...😊",
                  hintStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                   borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                ),
              ),
          ),
          // output box
          Obx(() => _translateResult()),
          SizedBox(height: mq.height *.04,),
          CustomBtn(onTap: _c.translate, txt: 'Translate')
        ],
      ),
    );
  }
  Widget _translateResult() => switch (_c.status.value) {
        Status.none => const SizedBox(),
        Status.complete => Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
            child: TextFormField(
              controller: _c.resultC,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        Status.loading => const Align(child: CustomLoading())
      };
}