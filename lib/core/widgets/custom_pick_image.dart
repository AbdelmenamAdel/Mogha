import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImage(ImageSource source) async {
  final XFile? image = await ImagePicker().pickImage(source: source);
  if (image != null) {
    return image;
  } else {
    return null;
  }
}
