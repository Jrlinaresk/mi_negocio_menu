import 'dart:convert';

class Service_dto {
  final int? id;
  final String? nombre;
  final String? descripcion;
  final String? horario;
  final int? mensajeria;
/*   final Empresa? empresa;
  final FormaDePago? formaDePago; */
  final String? perfilImage;
  final String? portadaImage;
/*   final List<Localizable>? localizable;
  final List<ServiceCategoria>? categoriasServicios; */

  Service_dto({
    this.id,
    this.nombre,
    this.descripcion,
    this.horario,
    this.mensajeria,
/*     this.empresa,
    this.formaDePago, */
    this.perfilImage,
    this.portadaImage,
/*     this.localizable,
    this.categoriasServicios, */
  });

  factory Service_dto.fromJson(Map<String, dynamic> json) {
    return Service_dto(
      id: json['id'] ?? 0,
      nombre: json['nombre'] ?? '',
      descripcion: json['descripcion'] ?? '',
      horario: json['horario'] ?? '',
      mensajeria: json['mensajeria'] ?? 0,
/*       empresa: Empresa.fromJson(json['empresa'] ?? {}),
      formaDePago: FormaDePago.fromJson(json['formaDePago'] ?? {}), */
      perfilImage: json['perfilImage'] ?? '',
      portadaImage: json['portadaImage'] ?? '',
/*       localizable: (json['localizable'] as List<dynamic>?)
              ?.map((e) => Localizable.fromJson(e))
              .toList() ??
          [],
      categoriasServicios: (json['categoriasServicios'] as List<dynamic>?)
              ?.map((e) => ServiceCategoria.fromJson(e))
              .toList() ??
          [], */
    );
  }

  bool matchesSearch(String searchTerm) {
    final lowercaseSearch = searchTerm.toLowerCase();
    final lowercaseName = nombre!.toLowerCase();
    return lowercaseName.contains(lowercaseSearch);
  }
}
