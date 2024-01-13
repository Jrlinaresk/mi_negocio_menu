class Categoria {
  final int? id;
  final String? alias;
  final String? nombre;
  final String? descripcion;
  final String? icono;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  //recien agregados a la api
  String? background;

  Categoria({
    this.id,
    this.alias,
    this.nombre,
    this.descripcion,
    this.icono,
    this.createdAt,
    this.updatedAt,
    this.background,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['id'] ?? 0,
      alias: json['alias'] ?? '',
      nombre: json['nombre'] ?? '',
      descripcion: json['descripcion'] ?? '',
      icono: json['icono'] ?? '',
      createdAt: DateTime.parse(json['created_at'] ?? ''),
      updatedAt: DateTime.parse(json['updated_at'] ?? ''),
      background: json['background'] ?? '', //imagen por defecto
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'alias': alias,
      'nombre': nombre,
      'descripcion': descripcion,
      'icono': icono,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'background': background,
    };
  }
}
