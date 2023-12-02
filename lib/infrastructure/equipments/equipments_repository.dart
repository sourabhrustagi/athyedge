import 'package:athyedge/core/persistent_store.dart';
import 'package:athyedge/domain/equipments/equipment.dart';
import 'package:injectable/injectable.dart';

abstract class EquipmentRepository {
  List<Equipment> getEquipments();

  void setEquipments(List<Equipment> equipments);

  void setEquipmentIsSelected(Equipment equipment);

  void setEquipmentIsDeselected(Equipment equipment);
}

@Injectable(as: EquipmentRepository)
class EquipmentRepositoryImpl implements EquipmentRepository {
  final PersistentStore persistentStore;

  EquipmentRepositoryImpl(this.persistentStore);

  @override
  List<Equipment> getEquipments() {
    return persistentStore.getEquipments();
  }

  @override
  void setEquipmentIsDeselected(Equipment equipment) {
    persistentStore.setEquipmentIsDeselected(equipment);
  }

  @override
  void setEquipmentIsSelected(Equipment equipment) {
    persistentStore.setEquipmentIsSelected(equipment);
  }

  @override
  void setEquipments(List<Equipment> equipments) {
    persistentStore.setEquipments(equipments);
  }
}
