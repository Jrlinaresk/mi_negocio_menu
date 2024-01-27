mixin BaseEntity {
  // Funciones comunes
  BaseEntity fromJson(Map<String, dynamic> json) {
    return this;
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  BaseEntity copyWith(Map<String, dynamic> updatedData) {
    return this;
  }

  Map<String, dynamic> toMap() {
    return {};
  }
}
