class Producto {
  int? id;
  String? modelo;
  String? precio;
  String? garantia;
  int? disponibilidad;
  String? descripcion;
  int? mayorista;
  String? nota;
/*   Estado? estado;
  FormaDePago? formaDePago;
  Moneda? moneda;
  List<Localizable>? localizable; */
  //logica de negocio
  bool? favorito;
  String? image1;
  String? image2;
  String? nombre;
  List<String>? types;
  //recien agregados a la api
  String? background;
  String? alias;

  Producto({
    this.id,
    this.modelo,
    this.precio,
    this.garantia,
    this.disponibilidad,
    this.descripcion,
    this.mayorista,
    this.nota,
/*     this.estado,
    this.formaDePago,
    this.moneda,
    this.localizable, */
    this.image1,
    this.image2,
    this.background,
    this.alias,
    this.nombre,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'],
      modelo: json['modelo'],
      precio: json['precio'],
      garantia: json['garantia'],
      disponibilidad: json['disponibilidad'],
      descripcion: json['descripcion'],
      mayorista: json['mayorista'],
      nota: json['nota'],
/*       estado: json['estado'] != null && json['estado'] is Map<String, dynamic>
          ? Estado.fromJson(json['estado'])
          : Estado(), // Si no es un mapa, asignar un objeto Estado predeterminado
      formaDePago: json['formaDePago'] != null &&
              json['formaDePago'] is Map<String, dynamic>
          ? FormaDePago.fromJson(json['formaDePago'])
          : FormaDePago(), // Objeto FormaDePago predeterminado en caso de nulo o tipo incorrecto
      moneda: json['moneda'] != null && json['moneda'] is Map<String, dynamic>
          ? Moneda.fromJson(json['moneda'])
          : Moneda(), // Objeto Moneda predeterminado en caso de nulo o tipo incorrecto
      localizable: (json['localizable'] as List<dynamic>?)
              ?.map((localizableJson) => Localizable.fromJson(localizableJson))
              .toList() ??
          [], // Lista vacía si 'localizable' es nulo o no es una lista */
      image1: json['image1'] ?? "",
      image2: json['image2'] ?? "",
      background: json['background'] ?? '', //imagen por defecto
      alias: json['alias'] ?? 'Desconocido',
      nombre: json['nombre'] ?? 'Desconocido',
    );
  }

  bool matchesSearch(String searchTerm) {
    final lowercaseSearch = searchTerm.toLowerCase();
    final lowercaseName = nombre!.toLowerCase();
    return lowercaseName.contains(lowercaseSearch);
  }
}
