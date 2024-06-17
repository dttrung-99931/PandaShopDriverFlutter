enum LocationType {
  // Pcikup package from shops
  pickup, // value = 2

  // Delivery to customers
  delivery, // value = 4

  // Delivery partner location
  deliveryPartner; // value = 8

  static List<LocationType> get valuesInOrder {
    return [pickup, delivery, deliveryPartner];
  }

  static List<int> get intValues {
    return [2, 4, 8];
  }

  static LocationType fromInt(int value) {
    int valueIndex = intValues.indexOf(value);
    return valuesInOrder[valueIndex];
  }

  int toInt() {
    int valueIndex = valuesInOrder.indexOf(this);
    return intValues[valueIndex];
  }
}
