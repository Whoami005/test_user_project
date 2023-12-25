import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    @Default('') String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String avatar,
  }) = _UserEntity;
}
