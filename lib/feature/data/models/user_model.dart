import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_user_project/feature/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String email;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String avatar;

  const UserModel({
    required this.id,
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.avatar = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserEntity toEntity() => UserEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        avatar: avatar,
      );
}
