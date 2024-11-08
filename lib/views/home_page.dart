import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bwispot/controllers/wisata_controller.dart';
import 'package:bwispot/views/detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WisataController controller = Get.put(WisataController());
  TextEditingController searchController = TextEditingController();
  List<dynamic> filteredWisata = [];
  String? selectedTipe;

  @override
  void initState() {
    super.initState();
    filteredWisata = controller.daftarWisata;
    searchController.addListener(_filterWisata);
  }

  void _filterWisata() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredWisata = controller.daftarWisata
          .where((wisata) => wisata.nama.toLowerCase().contains(query))
          .toList();
      if (selectedTipe != null) {
        filteredWisata = filteredWisata
            .where((wisata) => wisata.tipe.toLowerCase() == selectedTipe!.toLowerCase())
            .toList();
      }
    });
  }

  void _onTipeSelected(String? tipe) {
    setState(() {
      selectedTipe = tipe;
      _filterWisata();
    });
  }

void _showSortDialog() {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Pilih Tipe Wisata"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: getIconForTipe('Pantai'),
              title: Text("Pantai"),
              onTap: () {
                _onTipeSelected('Pantai');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: getIconForTipe('Gunung'),
              title: Text("Gunung"),
              onTap: () {
                _onTipeSelected('Gunung');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: getIconForTipe('Hutan'),
              title: Text("Hutan"),
              onTap: () {
                _onTipeSelected('Hutan');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: getIconForTipe('Semua'),
              title: Text("Semua"),
              onTap: () {
                _onTipeSelected(null);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}


  Icon getIconForTipe(String tipe) {
    switch (tipe.toLowerCase()) {
      case 'pantai':
        return Icon(Icons.beach_access, color: Colors.blue);
      case 'gunung':
        return Icon(Icons.terrain, color: Colors.brown);
      case 'hutan':
        return Icon(Icons.forest, color: Colors.green);
      default:
        return Icon(Icons.place, color: Colors.grey);
    }
  }

  @override
  void dispose() {
    searchController.removeListener(_filterWisata);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisata Banyuwangi'),
        actions: [],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: 'Cari Wisata...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.sort),
                  onPressed: _showSortDialog,
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.daftarWisata.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemCount: filteredWisata.length,
                  itemBuilder: (context, index) {
                    var wisata = filteredWisata[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => DetailPage(wisata: wisata));
                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  '${wisata.gambar}',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      wisata.nama,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
