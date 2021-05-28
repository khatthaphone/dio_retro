// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDao _$PostDaoFromJson(Map<String, dynamic> json) {
  return PostDao(
    userId: json['userId'] as int,
    id: json['id'] as int,
    title: json['title'] as String,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$PostDaoToJson(PostDao instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
