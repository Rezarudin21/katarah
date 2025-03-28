import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:katarahv2/app/modules/upload/controllers/upload_controller.dart';
import 'package:katarahv2/app/routes/app_pages.dart';

class UploadImagePage extends StatelessWidget {
  final UploadImageController controller = Get.put(UploadImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Konten'),
        leading: IconButton(
            onPressed: () {
              Get.toNamed(Routes.HOME);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Input Judul
              TextField(
                decoration: InputDecoration(labelText: "Judul"),
                onChanged: (value) => controller.titleController.value = value,
              ),
              SizedBox(height: 10),

              // 🔹 Input Sub Judul (Keterangan Lokasi)
              TextField(
                decoration:
                    InputDecoration(labelText: "Sub Judul (Keterangan Lokasi)"),
                onChanged: (value) =>
                    controller.subTitleController.value = value,
              ),
              SizedBox(height: 10),

              // 🔹 Input Deskripsi Singkat
              TextField(
                decoration: InputDecoration(labelText: "Deskripsi Singkat"),
                onChanged: (value) =>
                    controller.descriptionController.value = value,
              ),
              SizedBox(height: 20),

              // 🔹 Unggah Gambar
              Text("Gambar"),
              Obx(() => controller.image.value != null
                  ? Image.file(controller.image.value!, height: 150)
                  : Text("Belum ada gambar")),
              Row(
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.image),
                    label: Text('Galeri'),
                    onPressed: () => controller.pickImage(ImageSource.gallery),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    icon: Icon(Icons.camera),
                    label: Text('Kamera'),
                    onPressed: () => controller.pickImage(ImageSource.camera),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // 🔹 Unggah Video
              Text("Video"),
              Obx(() => controller.video.value != null
                  ? Text(
                      "Video dipilih: ${controller.video.value!.path.split('/').last}")
                  : Text("Belum ada video")),
              ElevatedButton.icon(
                icon: Icon(Icons.video_library),
                label: Text('Pilih Video'),
                onPressed: controller.pickVideo,
              ),
              SizedBox(height: 20),

              // 🔹 Unggah PDF
              Text("PDF"),
              Obx(() => controller.pdf.value != null
                  ? Text(
                      "PDF dipilih: ${controller.pdf.value!.path.split('/').last}")
                  : Text("Belum ada PDF")),
              ElevatedButton.icon(
                icon: Icon(Icons.picture_as_pdf),
                label: Text('Pilih PDF'),
                onPressed: controller.pickPDF,
              ),
              SizedBox(height: 30),

              // 🔹 Tombol Upload
              Center(
                child: ElevatedButton(
                  onPressed: controller.uploadContent,
                  child: Text('Upload Konten'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
