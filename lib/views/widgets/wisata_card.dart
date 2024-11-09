import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bwispot/models/wisata_model.dart';
import 'package:bwispot/controllers/wisata_controller.dart';
import 'package:bwispot/views/detail_page.dart';

class WisataCard extends StatelessWidget {
  final Wisata wisata;
  final WisataController controller = Get.find();

  WisataCard({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailPage(wisata: wisata));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      wisata.gambar,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    wisata.nama,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Icon(
                  wisata.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: wisata.isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  controller.toggleFavorite(wisata);
                },
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
