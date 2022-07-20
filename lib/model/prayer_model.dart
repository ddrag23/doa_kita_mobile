// To parse this JSON data, do
//
//     final PrayerModel = PrayerModelFromMap(jsonString);

import 'dart:convert';

class PrayerModel {
    PrayerModel({
        required this.id,
        required this.title,
        required this.textArab,
        required this.textLatin,
        required this.translate,
        this.deskripsi,
        this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String title;
    String textArab;
    String textLatin;
    String translate;
    dynamic deskripsi;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;

    PrayerModel copyWith({
        int? id,
        String? title,
        String? textArab,
        String? textLatin,
        String? translate,
        dynamic deskripsi,
        dynamic deletedAt,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        PrayerModel(
            id: id ?? this.id,
            title: title ?? this.title,
            textArab: textArab ?? this.textArab,
            textLatin: textLatin ?? this.textLatin,
            translate: translate ?? this.translate,
            deskripsi: deskripsi ?? this.deskripsi,
            deletedAt: deletedAt ?? this.deletedAt,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory PrayerModel.fromJson(String str) => PrayerModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PrayerModel.fromMap(Map<String, dynamic> json) => PrayerModel(
        id: json["id"],
        title: json["title"],
        textArab: json["text_arab"],
        textLatin: json["text_latin"],
        translate: json["translate"],
        deskripsi: json["deskripsi"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "text_arab": textArab,
        "text_latin": textLatin,
        "translate": translate,
        "deskripsi": deskripsi,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
