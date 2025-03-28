import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class UploadImageController extends GetxController {
  var titleController = ''.obs;
  var subTitleController = ''.obs; // 🔹 Tambahkan sub judul (lokasi)
  var descriptionController = ''.obs;
  var image = Rx<File?>(null);
  var video = Rx<File?>(null);
  var pdf = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<void> pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      video.value = File(pickedFile.path);
    }
  }

  Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      pdf.value = File(result.files.single.path!);
    }
  }

  Future<void> uploadContent() async {
    if (titleController.value.isEmpty ||
        subTitleController.value.isEmpty ||
        descriptionController.value.isEmpty) {
      Get.snackbar(
          "Error", "Judul, Sub Judul, dan Deskripsi tidak boleh kosong");
      return;
    }

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://yourserver.com/upload'),
    );

    request.fields['title'] = titleController.value;
    request.fields['sub_title'] =
        subTitleController.value; // 🔹 Tambahkan sub judul ke request
    request.fields['description'] = descriptionController.value;

    if (image.value != null) {
      var mimeType = lookupMimeType(image.value!.path);
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        image.value!.path,
        contentType: mimeType != null
            ? MediaType.parse(mimeType)
            : MediaType('image', 'jpeg'),
      ));
    }

    if (video.value != null) {
      var mimeType = lookupMimeType(video.value!.path);
      request.files.add(await http.MultipartFile.fromPath(
        'video',
        video.value!.path,
        contentType: mimeType != null
            ? MediaType.parse(mimeType)
            : MediaType('video', 'mp4'),
      ));
    }

    if (pdf.value != null) {
      var mimeType = lookupMimeType(pdf.value!.path);
      request.files.add(await http.MultipartFile.fromPath(
        'pdf',
        pdf.value!.path,
        contentType: mimeType != null
            ? MediaType.parse(mimeType)
            : MediaType('application', 'pdf'),
      ));
    }

    var response = await request.send();
    if (response.statusCode == 200) {
      Get.snackbar("Success", "Upload berhasil!");
    } else {
      Get.snackbar("Error", "Upload gagal!");
    }
  }
}
