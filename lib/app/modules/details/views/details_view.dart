import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katarahv2/app/routes/app_pages.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel Image
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CarouselSlider.builder(
                itemCount: controller.imageList.length,
                itemBuilder: (context, index, realIndex) {
                  return Image.asset(controller.imageList[index]);
                },
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  viewportFraction: 0.8,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Text('Judul'),
                  Text('Lokasi'),
                ],
              ),
            ),
            // Container for product details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                ),
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
            // Buttons
            Container(
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.VIDEOPLAYER);
                    },
                    child: Text('Video'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Ganti halaman tanpa menumpuk navigator
                    },
                    child: Text('Selengkapnya'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
