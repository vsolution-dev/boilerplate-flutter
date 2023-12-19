import 'package:freezed_annotation/freezed_annotation.dart';

part 'recruit.freezed.dart';
part 'recruit.g.dart';

@freezed
class Recruit with _$Recruit {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  factory Recruit({
  @Default('') String url,
  @Default('') String hash,
  @Default('') String title,
  @Default('') String provider,
  @Default('') String company_name,
  @Default('') String company_image,
  @Default('') String expires_at,
  }) = _Recruit;

  factory Recruit.fromJson(Map<String, dynamic> json) => _$RecruitFromJson(json);
}
