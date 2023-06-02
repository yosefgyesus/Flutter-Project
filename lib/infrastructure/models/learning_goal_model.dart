class LearningGoalModel {
  final String userId;
  final String title;
  final String description;

  LearningGoalModel({
    required this.userId,
    required this.title,
    required this.description,
  });

  get id => null;

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'title': title,
      'description': description,
    };
  }

  factory LearningGoalModel.fromJson(Map<String, dynamic> json) {
    return LearningGoalModel(
      userId: json['userId'],
      title: json['title'],
      description: json['description'],
    );
  }
}
