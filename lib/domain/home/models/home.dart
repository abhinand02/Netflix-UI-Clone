// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home.freezed.dart';
part 'home.g.dart';

@freezed
class Home with _$Home {
  const factory Home({
    @JsonKey(name: 'poster_path') required String? posterPath,
    @JsonKey(name: 'title') required String? title,
    @JsonKey(name: 'backdrop_path') required String? bannerImage,
  }) = _Home;

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);
}
