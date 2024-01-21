class Envio {
  final int id;
  final String productId;
  final String name;
  final String price;
  final String description;
  final List<String> nota; // instrucciones especiales
  final int formaDePagoId;
  final int empresaId;
  final String createdAt;
  final String updatedAt;
  final String monedaId;
  final String image1;
  //para control interno
  final List<String> types; //naturaleza del producto
  final String tamanno;
  final String peso;
  final String IdMensajero;
  final String pricePKT;
  final String distancia;

  Envio({
    required this.IdMensajero,
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.description,
    required this.nota,
    required this.formaDePagoId,
    required this.empresaId,
    required this.createdAt,
    required this.updatedAt,
    required this.monedaId,
    required this.image1,
    required this.types,
    required this.tamanno,
    required this.peso,
    required this.pricePKT,
    required this.distancia,
  });

  factory Envio.fromJson(Map<String, dynamic> json) {
    return Envio(
      id: json['id'],
      productId: json['codigo_producto'],
      name: json['nombre'],
      price: json['precio'],
      description: json['descripcion'],
      nota: json['nota'],
      formaDePagoId: json['forma_de_pago_id'],
      empresaId: json['empresa_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      monedaId: json['moneda_id'],
      image1: json['image1'],
      types: json['types'],
      tamanno: json['tamanno'],
      peso: json['peso'],
      IdMensajero: json['IdMensajero'],
      pricePKT: json['pricePKT'],
      distancia: json['distancia'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codigo_producto': productId,
      'nombre': name,
      'precio': price,
      'descripcion': description,
      'nota': nota,
      'forma_de_pago_id': formaDePagoId,
      'empresa_id': empresaId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'moneda_id': monedaId,
      'image1': image1,
      'types': types,
      'tamanno': tamanno,
      'peso': peso,
      'IdMensajero': IdMensajero,
      'pricePKT': pricePKT,
      'distancia': distancia,
    };
  }

  Envio copyWith(
      {int? id,
      String? productId,
      String? name,
      String? modelo,
      String? price,
      String? garantia,
      int? disponibilidad,
      String? description,
      int? mayorista,
      List<String>? nota,
      int? unidadMedidaId,
      int? estadoId,
      int? formaDePagoId,
      int? empresaId,
      String? createdAt,
      String? updatedAt,
      String? monedaId,
      String? image1,
      String? image2,
      int? mensajeria,
      bool? favorito,
      String? tamanno,
      String? peso,
      String? IdMensajero,
      String? pricePKT,
      String? distancia,
      List<String>? types}) {
    return Envio(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      nota: nota ?? this.nota,
      formaDePagoId: formaDePagoId ?? this.formaDePagoId,
      empresaId: empresaId ?? this.empresaId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      monedaId: monedaId ?? this.monedaId,
      image1: image1 ?? this.image1,
      types: types ?? this.types,
      tamanno: tamanno ?? this.tamanno,
      peso: peso ?? this.peso,
      IdMensajero: IdMensajero ?? this.IdMensajero,
      pricePKT: pricePKT ?? this.pricePKT,
      distancia: distancia ?? this.distancia,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'name': name,
      'price': price,
      'description': description,
      'nota': nota,
      'formaDePagoId': formaDePagoId,
      'empresaId': empresaId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'monedaId': monedaId,
      'image1': image1,
      'types': types,
      'tamanno': tamanno,
      'peso': peso,
      'IdMensajero': IdMensajero,
      'pricePKT': pricePKT,
      'distancia': distancia,
    };
  }

  bool matchesSearch(String searchTerm) {
    final lowercaseSearch = searchTerm.toLowerCase();
    final lowercaseName = name.toLowerCase();
    return lowercaseName.contains(lowercaseSearch);
  }
}
