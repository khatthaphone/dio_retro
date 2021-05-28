import 'package:json_annotation/json_annotation.dart';

part 'post_dao.g.dart';

@JsonSerializable()
class PostDao {
  PostDao({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostDao.fromJson(Map<String, dynamic> json) => _$PostDaoFromJson(json);

  Map<String, dynamic> toJson() => _$PostDaoToJson(this);

  @override
  String toString() {
    return 'PostDao{userId: $userId, id: $id, title: $title, body: $body}';
  }
}