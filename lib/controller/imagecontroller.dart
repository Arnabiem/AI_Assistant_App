import 'dart:developer';
import 'dart:io';
import 'package:ai_assistant/constraints/constants.dart';
import 'package:ai_assistant/constraints/dialog_box.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver_updated/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
enum Status{none,loading,complete}
// Getxcontroller is a class which helps to maintain the state of the Ui,no need to use 
//setstate 

class ImageController extends GetxController{
  final textC=TextEditingController();
   String url='';
  final status=Status.none.obs;

  Future<void> createImage() async {     
      if(textC.text.trim().isNotEmpty){   
        OpenAI.apiKey =apikey;     
        status.value=Status.loading;
          OpenAIImageModel image = await OpenAI.instance.image.create(
            prompt: textC.text,
            n: 1,
            size: OpenAIImageSize.size512,
            responseFormat: OpenAIImageResponseFormat.url,
          );
          url=image.data[0].url.toString();          
          status.value=Status.complete;
          
          textC.text='';
          }else{
             MyDialog.info('Provide some beautiful image description!😊');
          }
}
// download image
void downloadImage() async {
    try {
      //To show loading
      MyDialog.showLoadingDialog();
       log('url: $url');

      final bytes = (await get(Uri.parse(url))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      log('filePath: ${file.path}');
      //save image to gallery
      await GallerySaver.saveImage(url, albumName: appName).then((success) {
        //hide loading
        Get.back();
        MyDialog.success('Successfully downloaded to Gallery!');
      });
    } catch (e) {
      //hide loading
      Get.back();
      MyDialog.error('Something Went Wrong!');
      log('downloadImageE: $e');
    }
  }
  // sharing of images
  void shareImage() async {
    try {
      //To show loading
      MyDialog.showLoadingDialog();

      log('url: $url');

      final bytes = (await get(Uri.parse(url))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      log('filePath: ${file.path}');

      //hide loading
      Get.back();

      await Share.shareXFiles([XFile(file.path)],
          text:
              'Check out this Amazing Image created by Ai Assistant App😍');
    } catch (e) {
      //hide loading
      Get.back();
      MyDialog.error('Something Went Wrong (Try again in sometime)!');
      log('downloadImageE: $e');
    }
  }
 
 
}