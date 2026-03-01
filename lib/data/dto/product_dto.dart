import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@Freezed()
class ProductDto with _$ProductDto {
  const factory ProductDto({
    required int id,
    required String title,
    required double price,
    required String imageUrl,
    required DateTime createdAt,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}
