class CarPrice {
  String? gross;

  CarPrice({this.gross});

  factory CarPrice.fromJson(Map<String, dynamic> json) => CarPrice(
        gross: json["gross"],
      );

  Map<String, dynamic> toJson() => {"gross": gross};
}
