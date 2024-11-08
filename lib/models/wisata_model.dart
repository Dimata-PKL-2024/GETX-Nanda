class Wisata {
  String nama;
  String deskripsi;
  String gambar;
  String lokasi;
  String tipe;
  bool isFavorite;
  double rating;

  Wisata({
    required this.nama,
    required this.deskripsi,
    required this.gambar,
    required this.lokasi,
    required this.tipe,
    this.isFavorite = false,
    this.rating = 0.0,
  });
}
