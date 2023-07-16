class Buku {
  int? id;
  String? cover;
  String? judul;
  String? penulis;
  int? halaman;
  String? sinopsis;
  String? isi;
  String? kategori;

  Buku({
    this.id,
    this.cover,
    this.judul,
    this.penulis,
    this.halaman,
    this.sinopsis,
    this.isi,
    this.kategori,
  });

  factory Buku.fromJson(Map<String, dynamic> json) => Buku(
        id: int.parse(json["id"].toString()), // Mengubah string menjadi int
        cover: json["cover"],
        judul: json["judul"],
        penulis: json["penulis"],
        halaman: int.parse(
            json["halaman"].toString()), // Mengubah string menjadi int
        sinopsis: json["sinopsis"],
        isi: json["isi"],
        kategori: json["kategori"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cover": cover,
        "judul": judul,
        "penulis": penulis,
        "halaman": halaman,
        "sinopsis": sinopsis,
        "isi": isi,
        "kategori": kategori,
      };
}
