class DataModel {
  final String year;
  final double kerala;
  final double tamilNadu;
  final double tripura;
  final double assam;
  final double meghalaya;
  final double karnataka;
  final double otherStates;
  final double total;

  DataModel({
    required this.year,
    required this.kerala,
    required this.tamilNadu,
    required this.tripura,
    required this.assam,
    required this.meghalaya,
    required this.karnataka,
    required this.otherStates,
    required this.total,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      year: json['_year'],
      kerala: json['kerala'].toDouble(),
      tamilNadu: json['tamil_nadu'].toDouble(),
      tripura: json['tripura'].toDouble(),
      assam: json['assam'].toDouble(),
      meghalaya: json['meghalaya'].toDouble(),
      karnataka: json['karnataka'].toDouble(),
      otherStates: json['other_states'].toDouble(),
      total: json['_total'].toDouble(),
    );
  }
}
