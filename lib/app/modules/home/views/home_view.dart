import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Import carousel slider package
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accessing the controller
    final HomeController controller = Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Image(image: AssetImage('assets/download.jpeg')),
          actions: [
            IconButton(
              onPressed: () {
                // Ganti dengan aksi yang sesuai jika diperlukan
                Get.toNamed(Routes.SETTINGS);
              },
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Carousel Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Obx(() {
                  // Using Obx to listen for changes to the images list
                  return CarouselSlider.builder(
                    itemCount: controller.images.length,
                    itemBuilder: (context, index, realIndex) {
                      return Image.asset(
                        controller.images[
                            index], // Accessing images from the controller
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context)
                            .size
                            .width, // Full width for carousel
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      viewportFraction:
                          1.0, // Makes the images take the whole width
                    ),
                  );
                }),
              ),

              SizedBox(height: 20), // Jarak antara carousel dan card

              // Card Section
              SizedBox(
                width: 200,
                child: Card(
                  shadowColor: Colors.transparent,
                  color: Colors.transparent,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(143, 0, 0, 0),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'assets/download.jpeg', // Gambar dalam card
                            width: 200,
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.DETAILS);
                          },
                          child: Text('Lihat')),
                      SizedBox(
                        height: 20,
                      ),
                      // Title for Card
                      Text(
                        'Card Title',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.cyan,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
