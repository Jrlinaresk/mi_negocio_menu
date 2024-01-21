class Product {
  final int id;
  final String productId;
  final String name;
  final String modelo;
  final String price;
  final String garantia;
  final int disponibilidad;
  final String description;
  final int mayorista;
  final String nota;
  final int unidadMedidaId;
  final int estadoId;
  final int formaDePagoId;
  final int empresaId;
  final String createdAt;
  final String updatedAt;
  final String monedaId;
  final String image1;
  final String image2;
  final int mensajeria;
  //para control interno
  final bool favorito;
  final List<String> types;

  Product({
    required this.id,
    required this.productId,
    required this.name,
    required this.modelo,
    required this.price,
    required this.garantia,
    required this.disponibilidad,
    required this.description,
    required this.mayorista,
    required this.nota,
    required this.unidadMedidaId,
    required this.estadoId,
    required this.formaDePagoId,
    required this.empresaId,
    required this.createdAt,
    required this.updatedAt,
    required this.monedaId,
    required this.image1,
    required this.image2,
    required this.mensajeria,
    required this.favorito,
    required this.types,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        productId: json['codigo_producto'],
        name: json['nombre'],
        modelo: json['modelo'],
        price: json['precio'],
        garantia: json['garantia'],
        disponibilidad: json['disponibilidad'],
        description: json['descripcion'],
        mayorista: json['mayorista'],
        nota: json['nota'],
        unidadMedidaId: json['unidad_medida_id'],
        estadoId: json['estado_id'],
        formaDePagoId: json['forma_de_pago_id'],
        empresaId: json['empresa_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        monedaId: json['moneda_id'],
        image1: json['image1'],
        image2: json['image2'],
        mensajeria: json['mensajeria'],
        favorito: false,
        types: json['types']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codigo_producto': productId,
      'nombre': name,
      'modelo': modelo,
      'precio': price,
      'garantia': garantia,
      'disponibilidad': disponibilidad,
      'descripcion': description,
      'mayorista': mayorista,
      'nota': nota,
      'unidad_medida_id': unidadMedidaId,
      'estado_id': estadoId,
      'forma_de_pago_id': formaDePagoId,
      'empresa_id': empresaId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'moneda_id': monedaId,
      'image1': image1,
      'image2': image2,
      'mensajeria': mensajeria,
      'favorito': favorito,
      'types': types
    };
  }

  Product copyWith(
      {int? id,
      String? productId,
      String? name,
      String? modelo,
      String? price,
      String? garantia,
      int? disponibilidad,
      String? description,
      int? mayorista,
      String? nota,
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
      List<String>? types}) {
    return Product(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      modelo: modelo ?? this.modelo,
      price: price ?? this.price,
      garantia: garantia ?? this.garantia,
      disponibilidad: disponibilidad ?? this.disponibilidad,
      description: description ?? this.description,
      mayorista: mayorista ?? this.mayorista,
      nota: nota ?? this.nota,
      unidadMedidaId: unidadMedidaId ?? this.unidadMedidaId,
      estadoId: estadoId ?? this.estadoId,
      formaDePagoId: formaDePagoId ?? this.formaDePagoId,
      empresaId: empresaId ?? this.empresaId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      monedaId: monedaId ?? this.monedaId,
      image1: image1 ?? this.image1,
      image2: image2 ?? this.image2,
      mensajeria: mensajeria ?? this.mensajeria,
      favorito: favorito ?? this.favorito,
      types: types ?? this.types,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'name': name,
      'modelo': modelo,
      'price': price,
      'garantia': garantia,
      'disponibilidad': disponibilidad,
      'description': description,
      'mayorista': mayorista,
      'nota': nota,
      'unidadMedidaId': unidadMedidaId,
      'estadoId': estadoId,
      'formaDePagoId': formaDePagoId,
      'empresaId': empresaId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'monedaId': monedaId,
      'image1': image1,
      'image2': image2,
      'mensajeria': mensajeria,
      'favorito': favorito,
      'types': types
    };
  }

  bool matchesSearch(String searchTerm) {
    final lowercaseSearch = searchTerm.toLowerCase();
    final lowercaseName = name.toLowerCase();
    return lowercaseName.contains(lowercaseSearch);
  }
}
