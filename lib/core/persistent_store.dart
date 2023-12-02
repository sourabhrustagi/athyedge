import 'dart:convert';

import 'package:athyedge/domain/equipments/equipment.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String kEquipmentsKey = "EQUIPMENTS_K";

abstract class PersistentStore {
  List<Equipment> getEquipments();

  void setEquipments(List<Equipment> equipments);

  void setEquipmentIsSelected(Equipment equipment);

  void setEquipmentIsDeselected(Equipment equipment);
}

@Injectable(as: PersistentStore)
class PersistentStoreImpl implements PersistentStore {
  final SharedPreferences sharedPreferences;

  PersistentStoreImpl(this.sharedPreferences);

  @override
  List<Equipment> getEquipments() {
    List<String> jsonStrings =
        sharedPreferences.getStringList(key(kEquipmentsKey)) ?? List.empty();
    try {
      List<Equipment> equipments =
          jsonStrings.map((e) => Equipment.fromJson(jsonDecode(e))).toList();
      return equipments;
    } catch (e) {
      debugPrint(
          "Error > getEquipments ${e.toString()} jsonStrings: ${jsonStrings.toString()}");
    }
    return List.empty();
  }

  @override
  void setEquipmentIsDeselected(Equipment equipment) {
    List<Equipment> equipments = getEquipments();
    equipments.remove(equipment);
    equipments.add(equipment);
  }

  @override
  void setEquipmentIsSelected(Equipment equipment) {
    List<Equipment> equipments = getEquipments();
    equipments.remove(equipment);
    equipments.add(equipment);
  }

  @override
  void setEquipments(List<Equipment> equipments) {
    List<String> jsonStrings =
        equipments.map((e) => jsonEncode(e.toJson())).toList();
    sharedPreferences.setStringList(key(kEquipmentsKey), jsonStrings);
  }

  String key(String key) {
    return "v1_$key";
  }
}
