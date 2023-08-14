import 'package:json_annotation/json_annotation.dart';

part 'support.g.dart';

@JsonSerializable()
class SupportModel {
  final String url;
  final String text;

  SupportModel({required this.url, required this.text});

  factory SupportModel.fromJson(Map<String, dynamic> data) =>
      _$SupportModelFromJson(data);

  Map<String, dynamic> toJson() => _$SupportModelToJson(this);
}
