import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class DataModel {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  DataModel(
      {required this.id,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.avatar});

  factory DataModel.fromJson(Map<String, dynamic> data) =>
      _$DataModelFromJson(data);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
