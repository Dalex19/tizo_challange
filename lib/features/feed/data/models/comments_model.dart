
class CommentsModel {
  final int id;
  final String name;
  final String email;
  final String body;

  CommentsModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.body});

  factory CommentsModel.fromJson(Map<String, dynamic> map) {
    return CommentsModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      body: map['body'].replaceAll('\n', ' '),
    );
  }
}
