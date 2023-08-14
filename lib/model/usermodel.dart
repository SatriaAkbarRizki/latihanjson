import 'package:json_annotation/json_annotation.dart';
import 'package:latihanjson/model/data/data.dart';
import 'package:latihanjson/model/support/support.dart';

part 'usermodel.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  final DataModel data;
  final SupportModel support;

  UserModel({required this.data, required this.support});

  factory UserModel.fromJson(Map<String, dynamic> data) =>
      _$UserModelFromJson(data);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
