class CarImage {
  String? uri;
  String? set;

  CarImage({this.uri, this.set});

  factory CarImage.fromJson(Map<String, dynamic> json) => CarImage(
        uri: json["uri"],
        set: json["set"],
      );

  Map<String, dynamic> toJson() => {"uri": uri, "set": set};
}
