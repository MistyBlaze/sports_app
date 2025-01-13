class DrillModel {
  final String name;
  final int totalCount;
  final String imageUrl;
  final String duration;
  final String description;

  DrillModel({
    required this.name,
    required this.totalCount,
    required this.imageUrl,
    this.duration = '5 mins',
    this.description = '',
  });

  factory DrillModel.fromJson(Map<String, dynamic> json, String imageUrl) {
    return DrillModel(
      name: json['name'] ?? '',
      totalCount: json['totalCount'] ?? 0,
      imageUrl: imageUrl,
      duration: json['duration'] ?? '5 mins',
      description: json['description'] ?? '',
    );
  }
}
