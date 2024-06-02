part of 'pages.dart';

class TermsAndConditonsPage extends StatelessWidget {
  const TermsAndConditonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Terms & Conditions", icon: Icons.edit_document),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1. Informasi Penjemputan dan Tujuan: Pengguna wajib memberikan informasi lengkap dan akurat mengenai alamat penjemputan dan tujuan yang ditentukan sebelum menggunakan Layanan Scooter.\n\n"
                "2. Pembatasan Barang yang Dibawa: Pengguna dilarang membawa barang-barang yang dilarang oleh peraturan perundang-undangan yang berlaku, termasuk barang-barang ilegal atau berbahaya seperti narkotika, obat-obatan terlarang, atau barang berat melebihi kapasitas scooter.\n\n"
                "3. Bukan Layanan Pengiriman Barang: Layanan Scooter bukanlah layanan untuk pengiriman barang atau kurir instan. Sehingga dilarang menggunakan scooter untuk melakukan pengiriman barang.\n\n"
                "4. Ketentuan umur: pengguna dibawah umur 14 tahun dilarang menggunakan scooter.\n\n"
                "5. Keselamatan Penumpang: Penumpang bertanggung jawab atas keselamatannya sendiri dan wajib mematuhi peraturan lalu lintas.\n\n"
                "6. Biaya Layanan: Biaya Layanan Scooter akan ditawarkan dan ditampilkan pada Aplikasi scooter sebelum penggunaan layanan. Penawaran dan biaya dapat berubah dari waktu ke waktu berdasarkan faktor seperti lokasi, waktu, dan peraturan yang berlaku.\n\n"
                "7. Hak Kekayaan Intelektual: Skuter, merek dagang, dan materi lain yang terkait dengan layanan ini tetap menjadi milik penyedia layanan. Pengguna tidak diperbolehkan menggunakan, menyalin, atau mendistribusikan materi tersebut tanpa izin tertulis dari penyedia layanan.\n\n"
                "8. Pengembalian scooter: Pengguna harus mengembalikan skuter ke lokasi yang ditentukan dalam kondisi yang baik dan dalam waktu yang telah ditentukan. Keterlambatan dalam pengembalian dapat dikenakan biaya tambahan.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
