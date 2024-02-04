import '../../models/admin_panel/item_conf_entity.dart';

List<ItemAdminPanel> items_config_admin_panel = [
  ItemAdminPanel(
    buttonText: 'Datos del negocio',
    route: '/config_datos_del_negocio',
    Image: 'administracion/datos_del_negocio.jpg',
  ),
  ItemAdminPanel(
    buttonText: 'Mis clientes',
    route: '/config_clientes',
    Image: 'administracion/clientes.jpg',
  ),
  ItemAdminPanel(
    buttonText: 'Administrar Productos',
    route: '/config_productos',
    Image: 'administracion/productos.jpg',
  ),
  ItemAdminPanel(
    buttonText: 'Editar Categorias',
    route: '/config_categoria',
    Image: 'administracion/categoria.jpg',
  ),
  ItemAdminPanel(
    buttonText: 'Analizar Ventas',
    route: '/config_ventas',
    Image: 'administracion/ventas.jpg',
  ),
  ItemAdminPanel(
    buttonText: 'Enviar mensajes',
    route: '/config_mensajes',
    Image: 'administracion/mensajes.jpg',
  ),
];