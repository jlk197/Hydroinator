class ImageData {
  DateTime? dateTime;
  String image;
  ImageData({this.image = "", this.dateTime});

  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime?.toIso8601String(),
      'image': image,
    };
  }

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      image: json["image"] as String,
      dateTime: DateTime.tryParse(json["dateTime"] as String? ?? ""),
    );
  }
}
