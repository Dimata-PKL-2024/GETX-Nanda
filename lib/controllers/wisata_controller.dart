import 'package:get/get.dart';
import 'package:bwispot/models/wisata_model.dart';
import 'package:bwispot/services/wisata_service.dart';

class WisataController extends GetxController {
  var daftarWisata = <Wisata>[].obs;

  @override
  void onInit() {
    super.onInit();
    daftarWisata.addAll(WisataService.getWisataList());
  }

  void toggleFavorite(Wisata wisata) {
    wisata.isFavorite = !wisata.isFavorite;
    daftarWisata.refresh();
  }
}
