import 'package:image_picker/image_picker.dart';

Future<XFile?> pickVideo(ImageSource source) async {
  final XFile? video = await ImagePicker().pickVideo(source: source);
  return video;
}
