import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'equipment.g.dart';

@JsonSerializable()
class Equipment extends Equatable {
  final String id;
  final String name;
  final bool isSelected;

  const Equipment({
    required this.id,
    required this.name,
    required this.isSelected,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) => _$EquipmentFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentToJson(this);

  @override
  List<Object?> get props => [id, name, isSelected];
}
