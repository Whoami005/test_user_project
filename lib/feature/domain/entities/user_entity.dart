import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  @Entity(realClass: UserEntity)
  const factory UserEntity({
    @Id(assignable: true) required int id,
    @Default('') String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String avatar,
  }) = _UserEntity;
}
