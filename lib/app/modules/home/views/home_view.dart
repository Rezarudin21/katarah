import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:katarahv2/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Image(image: AssetImage('assets/logo.jpg')),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.SETTINGS);
                },
                icon: Icon(Icons.settings))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// **Carousel**
              CarouselSlider.builder(
                itemCount: controller.images.length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (context, index, realIdx) {
                  return Center(
                    child: Image.asset(
                      controller.images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),

              SizedBox(height: 20), // Jarak antara carousel dan cards

              /// **Grid Cards**
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: 10, // Jarak horizontal antar Card
                  runSpacing: 40, // Jarak vertikal antar Card
                  alignment: WrapAlignment.center, // Posisikan Card ke tengah
                  children: controller.cards.map((card) {
                    return SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) -
                          25, // 2 card per baris
                      child: Card(
                        color: Colors.white,
                        elevation: 0,
                        child: Column(
                          children: [
                            /// **Gambar dalam Card**
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(30, 0, 0, 0),
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  card["image"]!,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                            SizedBox(height: 20),

                            /// **Tombol Lihat**
                            ElevatedButton(
                              onPressed: () {
                                Get.toNamed(Routes.DETAILS);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan,
                                fixedSize: Size(150, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              child: Text(
                                'Lihat',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            SizedBox(height: 20),

                            /// **Judul**
                            Text(
                              card["title"]!,
                              style:
                                  TextStyle(fontSize: 17, color: Colors.cyan),
                              textAlign: TextAlign.center,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
