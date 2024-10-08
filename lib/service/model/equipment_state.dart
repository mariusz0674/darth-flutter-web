class Item {
  String name;
  String iconPath;

  Item(this.name, this.iconPath);
}

class EquipmentItem {
  String itemIdentifier;

  EquipmentItem(this.itemIdentifier);
}

class EquipmentState {
  static final List<EquipmentItem> initialItems = [EquipmentItem("pretzel")];
  final List<EquipmentItem> _items = [];

  EquipmentState._();

  static initializeEquipment() {
    var equipmentState = EquipmentState._();
    equipmentState._items.addAll(initialItems);
    return equipmentState;
  }

  void addItem(EquipmentItem item) {
    _items.add(item);
  }

  List<EquipmentItem> getItems() {
    return _items;
  }
}
