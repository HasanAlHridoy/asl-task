class HomeResponseModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  HomeResponseModel({required this.userId, required this.id, required this.title, required this.body});

  // Factory constructor to create a HomeResponseModel from JSON
  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeResponseModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  // Method to convert a HomeResponseModel to JSON
  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'body': body};
  }
}
