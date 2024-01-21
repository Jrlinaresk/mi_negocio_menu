class Negocio {
  final String id;
  final String nombre;
  final String descripcion;
  final String direccion;
  final String telefono;
  final String email;
  final String img1;
  final String img2;
  //control interno de la apk
  final bool? favorito;
  final String categoria;

  Negocio(
      {required this.id,
      required this.nombre,
      required this.descripcion,
      required this.direccion,
      required this.telefono,
      required this.email,
      required this.img1,
      required this.img2,
      this.favorito,
      required this.categoria});

  factory Negocio.fromJson(Map<String, dynamic> json) {
    return Negocio(
        id: json['id'],
        nombre: json['nombre'],
        descripcion: json['descripcion'],
        direccion: json['direccion'],
        telefono: json['telefono'],
        email: json['email'],
        img1: json['img1'],
        img2: json['img2'],
        categoria: json['categoria']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'direccion': direccion,
      'telefono': telefono,
      'email': email,
      'img1': img1,
      'img2': img2,
      'categoria': categoria
    };
  }

  Negocio copyWith(
      {String? id,
      String? nombre,
      String? descripcion,
      String? direccion,
      String? telefono,
      String? email,
      String? img1,
      String? img2,
      bool? favorito,
      String? categoria}) {
    return Negocio(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      direccion: direccion ?? this.direccion,
      telefono: telefono ?? this.telefono,
      email: email ?? this.email,
      img1: img1 ?? this.img1,
      img2: img2 ?? this.img2,
      favorito: favorito ?? this.favorito,
      categoria: categoria ?? this.categoria,
    );
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }
}
