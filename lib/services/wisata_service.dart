import 'package:bwispot/models/wisata_model.dart';

class WisataService {
  static List<Wisata> getWisataList() {
    return [
      Wisata(
        nama: 'Kawah Ijen',
        deskripsi:
            'Kawah Ijen adalah sebuah kawah yang terletak di Gunung Ijen, yang berada di perbatasan Kabupaten Banyuwangi dan Bondowoso, Jawa Timur. Kawah ini terkenal dengan Danau Kawah Ijen yang berwarna biru kehijauan dan merupakan salah satu danau asam terbesar di dunia.',
        gambar: 'assets/images/kawahijen.jpg',
        lokasi: 'Licin, Banyuwangi, Jawa Timur',
        tipe: 'Gunung',
        rating: 4.9,
      ),
      Wisata(
        nama: 'Pulau Merah',
        deskripsi:
            'Pulau Merah adalah sebuah pulau kecil yang terletak di pesisir selatan Banyuwangi, Jawa Timur. Pulau ini terkenal dengan pantainya yang indah dan pasir putihnya yang bersih, serta ombak yang cocok untuk berselancar.',
        gambar: 'assets/images/pulaumerah.png',
        lokasi: 'Sumber Agung, Banyuwangi, Jawa Timur',
        tipe: 'Pantai',
        rating: 4.7,
      ),
      Wisata(
        nama: 'DJawatan',
        deskripsi:
            'Djawatan adalah sebuah kawasan hutan yang terletak di Banyuwangi, Jawa Timur, yang dikenal dengan nama Hutan Djawatan Benculuk. Hutan ini terkenal karena memiliki pohon-pohon besar dan rindang, terutama pohon-pohon yang memiliki bentuk unik dan besar, seperti pohon trembesi yang terkenal dengan batangnya yang lebar.',
        gambar: 'assets/images/djawatan.jpg',
        lokasi: 'Cluring, Banyuwangi, Jawa Timur',
        tipe: 'Hutan',
        rating: 4.2,
      ),
      Wisata(
        nama: 'Baluran National Park',
        deskripsi:
            'Baluran adalah sebuah taman nasional yang terletak di bagian utara Kabupaten Banyuwangi, Jawa Timur. Taman Nasional Baluran terkenal dengan savana yang luas, hutan mangrove, serta kehidupan liar yang beragam, termasuk satwa-satwa seperti banteng, rusa, dan berbagai jenis burung. Dikenal juga sebagai "Africa van Java".',
        gambar: 'assets/images/baluran.jpg',
        lokasi: 'Banyuputih, Banyuwangi, Jawa Timur',
        tipe: 'Hutan',
        rating: 4.6,
      ),
      Wisata(
        nama: 'Alas Purwo',
        deskripsi:
            'Alas Purwo adalah sebuah taman nasional yang terletak di ujung tenggara Pulau Jawa, tepatnya di Kabupaten Banyuwangi, Provinsi Jawa Timur. Taman nasional ini memiliki luas sekitar 43.000 hektar dan dikenal dengan keanekaragaman hayati serta keindahan alamnya, yang mencakup hutan hujan tropis, pantai, dan padang rumput. Alas Purwo juga merupakan habitat bagi berbagai spesies satwa, seperti banteng, harimau, dan berbagai jenis burung langka',
        gambar: 'assets/images/alaspurwo.jpg',
        lokasi: 'Tegaldlimo, Banyuwangi, Jawa Timur',
        tipe: 'Hutan',
        rating: 4.8,
      ),
      Wisata(
        nama: 'Pantai Teluk Hijau',
        deskripsi:
            'Teluk Hijau adalah pantai eksotis dengan pasir putih dan air laut berwarna hijau zamrud. Untuk mencapai pantai ini, pengunjung harus trekking atau naik perahu dari Pantai Rajegwesi. Tempat ini sangat cocok bagi mereka yang mencari ketenangan dan keindahan alam yang alami.',
        gambar: 'assets/images/telukijo.jpg',
        lokasi: 'Pesanggaran, Banyuwangi, Jawa Timur',
        tipe: 'Pantai',
        rating: 4.7,
      ),
      Wisata(
        nama: 'Air Terjun Jagir',
        deskripsi:
            'Air Terjun Jagir dikenal sebagai "air terjun kembar" karena memiliki dua aliran yang berdampingan. Airnya yang jernih dan suasananya yang sejuk membuat tempat ini populer di kalangan wisatawan lokal dan internasional. Air Terjun Jagir adalah tempat yang ideal untuk bersantai dan menikmati suasana alam yang asri.',
        gambar: 'assets/images/terjunjagir.jpg',
        lokasi: 'Glagah, Banyuwangi, Jawa Timur',
        tipe: 'Air Terjun',
        rating: 4.8,
      ),
      Wisata(
        nama: 'Pantai Wedi Ireng',
        deskripsi:
            'Pantai Wedi Ireng adalah pantai yang masih alami dan belum terlalu ramai dikunjungi. Pantai ini memiliki pasir putih dan air laut yang bersih. Pengunjung dapat melakukan snorkeling atau sekadar menikmati keindahan alam yang damai. Untuk mencapai pantai ini, pengunjung dapat trekking atau naik perahu dari Pantai Pulau Merah.',
        gambar: 'assets/images/wediireng.jpg',
        lokasi: 'Pesanggaran, Banyuwangi, Jawa Timur',
        tipe: 'Pantai',
        rating: 4.6,
      ),
      Wisata(
        nama: 'Pantai Boom',
        deskripsi:
            'Pantai Boom adalah pantai yang mudah diakses karena berada di pusat kota Banyuwangi. Pantai ini memiliki dermaga unik yang menjorok ke laut dan sering menjadi lokasi acara budaya seperti tari Gandrung. Pemandangan gunung di kejauhan dan dermaga yang unik menjadikan Pantai Boom populer sebagai tempat untuk menikmati matahari terbit.',
        gambar: 'assets/images/pantaiboom.jpg',
        lokasi: 'Kota Banyuwangi, Banyuwangi, Jawa Timur',
        tipe: 'Pantai',
        rating: 4.5,
      ),
    ];
  }
}
