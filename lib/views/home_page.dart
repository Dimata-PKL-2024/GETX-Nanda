import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bwispot/controllers/wisata_controller.dart';
import 'package:bwispot/views/widgets/wisata_card.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
          title: const Text("Pilih Tipe Wisata"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: getIconForTipe('Pantai'),
                title: const Text("Pantai"),
                onTap: () {
                  _onTipeSelected('Pantai');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: getIconForTipe('Gunung'),
                title: const Text("Gunung"),
                onTap: () {
                  _onTipeSelected('Gunung');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: getIconForTipe('Hutan'),
                title: const Text("Hutan"),
                onTap: () {
                  _onTipeSelected('Hutan');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: getIconForTipe('Air Terjun'),
                title: const Text("Air Terjun"),
                onTap: () {
                  _onTipeSelected('Air Terjun');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: getIconForTipe('Semua'),
                title: const Text("Semua"),
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
        return const Icon(Icons.beach_access, color: Colors.blue);
      case 'gunung':
        return const Icon(Icons.terrain, color: Colors.brown);
      case 'hutan':
        return const Icon(Icons.forest, color: Colors.green);
      case 'air terjun':
        return const Icon(Icons.water_drop, color: Colors.blueAccent);
      default:
        return const Icon(Icons.place, color: Colors.grey);
    }
  }

  Future<void> _launchContact() async {
    final Uri contactUrl = Uri.parse("https://wa.me/628123456789"); // Nomer untuk menghubungi agensi travel (masih dummy)
    if (await canLaunchUrl(contactUrl)) {
      await launchUrl(contactUrl);
    } else {
      throw "Tidak dapat membuka kontak";
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
        title: const Text('Wisata Banyuwangi'),
        actions: const [],
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
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.sort),
                  onPressed: _showSortDialog,
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.daftarWisata.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemCount: filteredWisata.length,
                  itemBuilder: (context, index) {
                    var wisata = filteredWisata[index];
                    return WisataCard(wisata: wisata);
                  },
                );
              }
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchContact,
        backgroundColor: const Color.fromARGB(255, 121, 221, 129),
        child: const Icon(Icons.contact_phone),
      ),
    );
  }
}
