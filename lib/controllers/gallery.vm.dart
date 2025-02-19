import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_template/controllers/base.vm.dart';
import 'package:flutter_template/resources/events.dart';
import 'package:flutter_template/utils/snack_message.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:path/path.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class GalleryViewModel extends BaseViewModel {

  void getFromGallery(BuildContext ctx, String fireEvent) async {

    XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxWidth: 500, imageQuality: 100);

    if (pickedFile != null) {

      source = pickedFile.path;
      final croppedFile = await cropImage(source!, ctx);
      imageFile = File(pickedFile.path);

      if (croppedFile != null) {
        if (Platform.isAndroid) {
          var filename = p.basenameWithoutExtension(source!);
          var extension = p.extension(source!);
          final directory = await getApplicationDocumentsDirectory();
          imageFile = File(croppedFile.path);
          var newFile = await imageFile!.copy(
              "${directory.path}${Platform.pathSeparator}${filename}_cropped$extension");
          source = newFile.path;
        } else {
          source = croppedFile.path;
        }
      }
      //navigationService.goBack();
      userService.cache.setStringPreference('photo', source!);
      userService.cache.eventBus!
          .fire(ApplicationEvent("", fireEvent, data: {'image': source!}));
      showCustomToast("Image selected", toastType: ToastType.success);
    }
    // await addAvatar(source!);
  }

  void getFromCamera(BuildContext ctx, String fireEvent) async {

    XFile? pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 500, imageQuality: 80);
        
    if (pickedFile != null) {
      source = pickedFile.path;
      final croppedFile = await cropImage(source!, ctx);
      imageFile = File(pickedFile.path);
      if (croppedFile != null) {
        if (Platform.isAndroid) {
          var filename = p.basenameWithoutExtension(source!);
          var extension = p.extension(source!);
          final directory = await getApplicationDocumentsDirectory();
          imageFile = File(croppedFile.path);
          var newFile = await imageFile!.copy(
              "${directory.path}${Platform.pathSeparator}${filename}_cropped$extension");
          source = newFile.path;
        } else {
          source = croppedFile.path;
        }
      }
      //navigationService.goBack();
      userService.cache.setStringPreference('photo', source!);
      userService.cache.eventBus!
          .fire(ApplicationEvent("", fireEvent, data: {'image': source!}));
      showCustomToast("Image selected", toastType: ToastType.success);
    }
    // await addAvatar(source!);
  }

  Future<CroppedFile?> cropImage(String source, BuildContext context) async {
    return await ImageCropper().cropImage(
      sourcePath: source,
      compressFormat: ImageCompressFormat.jpg,
      maxWidth: 600,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(),
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(), // IMPORTANT: iOS supports only one custom aspect ratio in preset list
          ],
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
  }
}

class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
  @override
  (int, int)? get data => (2, 3);

  @override
  String get name => '2x3 (customized)';
}
