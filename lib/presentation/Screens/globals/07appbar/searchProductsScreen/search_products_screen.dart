import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minegociomenu/domain/models/dto_producto.dart';
import 'package:minegociomenu/domain/provider/producto_x_categoria.dart';

class SearchProductsScreen extends ConsumerStatefulWidget {
  const SearchProductsScreen({Key? key}) : super(key: key);

  @override
  _SearchProductsScreenState createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends ConsumerState<SearchProductsScreen> {
  late List<Producto> productos = [];
  final TextEditingController _searchController = TextEditingController();
  List<Producto> _filteredProducts =
      []; // Lista para almacenar los productos filtrados

  @override
  void initState() {
    super.initState();
    //plist = ref.watch(ProductoStateNotifierProvider);
    // Inicializa _filteredProducts con todos los productos al principio
    _filteredProducts = [];
  }

  void _performSearch() {
    final searchTerm = _searchController.text.toLowerCase();
    if (searchTerm.isEmpty) {
      // Si el campo de búsqueda está vacío, muestra todos los productos
      _filteredProducts = productos;
    } else {
      // Filtra los productos que coinciden con el término de búsqueda
      _filteredProducts = productos
          .where((product) => product.matchesSearch(searchTerm))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    var plist = ref.watch(productosProvider);
    // Accede al valor dentro de AsyncValue usando el método maybeWhen
    var productos = plist.maybeWhen(
      data: (data) => data,
      orElse: () => [], // Devuelve una lista vacía si no hay datos
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Productos'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Buscar productos por nombre',
              ),
              onChanged: (value) {
                _performSearch();
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                final product = _filteredProducts[index];
                return ListTile(
                  title: Text(product.nombre!),
                  // Mostrar más detalles del producto aquí
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
