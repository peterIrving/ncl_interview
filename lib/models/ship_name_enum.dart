enum ShipName {
  sky,
  bliss,
  escape,
}

extension Getters on ShipName {
  String get apiRequestTitle {
    switch (this) {
      case ShipName.sky:
        return "SKY";
      case ShipName.bliss:
        return "BLISS";
      case ShipName.escape:
        return "ESCAPE";
    }
  }

  String get displayTitle {
    switch (this) {
      case ShipName.sky:
        return "Sky";
      case ShipName.bliss:
        return "Bliss";
      case ShipName.escape:
        return "Escape";
    }
  }
}
