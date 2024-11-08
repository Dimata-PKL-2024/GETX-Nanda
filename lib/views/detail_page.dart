import 'package:flutter/material.dart';
import 'package:bwispot/models/wisata_model.dart';

class DetailPage extends StatelessWidget {
  final Wisata wisata;

  const DetailPage({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran lebar layar
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.05; 

    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.nama),
        leading: IconButton(
          icon: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding), // Padding dinamis
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  wisata.gambar,
                  width: double.infinity,
                  height: screenWidth * 0.5, // Tinggi gambar responsif
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                wisata.nama,
                style: TextStyle(
                  fontSize: screenWidth * 0.06, // Font responsif
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Kotak transparan
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]!, width: 1),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.transparent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bagian lokasi
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.redAccent,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            wisata.lokasi,
                            style: TextStyle(
                              fontSize: screenWidth * 0.045, // Font responsif
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Bagian rating
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Rating: ${wisata.rating}',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  wisata.deskripsi,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045, // Font responsif
                    height: 1.5,
                    color: Colors.black87,
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
