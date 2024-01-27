class ApiConfig {
  static const String apiUrl =
      'http://134.209.76.247:50000/api'; //hosting del caribe bakend con node mas expres
  static const String user = 'tu_usuario';
  static const String password = 'tu_contraseña';

  //nombres de los endpoints.
  //negocios
  static const String negociosEndpoint = '/negocios';
  //producto
  static const String productosEndpoint = '/productos';
  static const String productos_x_categoria_Endpoint =
      '$productosEndpoint/categoria';
  //carrito
  static const String carritoEndpoint = '/carrito';
  //categorias
  static const String categoriasEndpoint = '/categorias';

  //ordenes
  static const String ordenesEndpoint = '/ordenes';
  //usuario
  static const String loginEndpoint = '/login';
}
