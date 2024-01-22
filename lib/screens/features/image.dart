import 'package:ai_assistant/constraints/constants.dart';
import 'package:ai_assistant/controller/imagecontroller.dart';
import 'package:ai_assistant/widgets/custom_button.dart';
import 'package:ai_assistant/widgets/custom_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  final _c=ImageController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('AI Image Creator'),
      // share button
      actions: [
        Obx(
          ()=>_c.status.value==Status.complete? IconButton(
            onPressed: (){
              _c.shareImage();
            },
          padding: const EdgeInsets.only(right: 6),
          color: Colors.blue,
           icon: const Icon(Icons.share)):SizedBox(),
        )
      ],
      ),
      body: ListView(
         physics: const BouncingScrollPhysics(),                       
          padding: EdgeInsets.only(bottom: mq.height *.1,top: mq.height *.02,
          right: mq.width *.04,left: mq.width *.04),
        children: [
          TextFormField(   
            controller: _c.textC,          
            minLines: 2,
            maxLines: null,
              onTapOutside:(e)=> FocusScope.of(context).unfocus(),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(                
                hintText: "Imagine something wonderful & innovative\nType here & I'll create for you 😊 ",
                hintStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
            ),
            // ai image
            Container(
              height: mq.height *.5,
              alignment: Alignment.center,
              child: Obx (()=> _aiImage())
              ),
              // create button
              CustomBtn(onTap:_c.createImage, txt: 'Create',), 
        ],
      ),
      // download image
      floatingActionButton: Obx(()=>_c.status.value==Status.complete?
      FloatingActionButton(
        onPressed: (){
          _c.downloadImage();
        },
      backgroundColor: Colors.blue,
      child: const Icon(Icons.download,color: Colors.white,),
      ):const SizedBox())
    );
  }
  Widget _aiImage() =>ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    child: switch(_c.status.value){    
      Status.none => Lottie.asset('assets/Animations/ai_play.json',height: mq.height *.35),
      Status.complete => CachedNetworkImage(
          imageUrl: _c.url,
          placeholder: (context, url) => const CustomLoading(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
       ),
         Status.loading => const CustomLoading(),
    },
  );
}