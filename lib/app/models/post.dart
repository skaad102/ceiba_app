class PostDTO {
  int userId;
  int id;
  String title;
  String body;

  PostDTO({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostDTO.fromJson(Map<String, dynamic> json) {
    return PostDTO(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
