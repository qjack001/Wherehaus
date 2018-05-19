import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class TakePhoto 
{
  Future<File> imageFile;

  TakePhoto()
  {
    imageFile = this.imageFile;
  }

  void onTakePhoto() 
  {
      imageFile = ImagePicker.pickImage(source: ImageSource.camera);
  }

}