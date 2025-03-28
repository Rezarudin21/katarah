import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katarahv2/app/routes/app_pages.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.HOME);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Agar konten Column rata kiri
          children: [
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [Text('Judul'), Text('Lokasi')],
              ),
            ),
            // Container untuk detail produk
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16), // Beri jarak di kiri & kanan
              child: DottedBorder(
                color: Colors.black,
                strokeWidth: 1.5,
                dashPattern: [6, 4],
                borderType: BorderType.RRect,
                radius: Radius.circular(8),
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ini adalah deskripsi singkat tentang produk yang sedang ditampilkan.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Video')),
                  ElevatedButton(
                    onPressed: () {
                      // Ganti halaman tanpa menumpuk navigator
                    },
                    child: Text('Selengkapnya'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
