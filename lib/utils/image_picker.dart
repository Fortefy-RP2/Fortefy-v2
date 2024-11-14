import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  static final ImagePicker _picker = ImagePicker();

  /// Função para selecionar uma imagem da galeria do dispositivo
  static Future<File?> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  /// Função para capturar uma imagem usando a câmera do dispositivo
  static Future<File?> pickImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}