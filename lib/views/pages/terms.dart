
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsAndConditon extends StatelessWidget {
  const TermsAndConditon ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            size: 20,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Back",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.edit_document,
                      size: 30,
                      color: Color(0xFFA2C90C),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Terms & Condition",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ), 
              Padding(
                padding: 
                EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
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
                ),
                )    
            ]
          ),
        ),
      ),
    );
  }
}