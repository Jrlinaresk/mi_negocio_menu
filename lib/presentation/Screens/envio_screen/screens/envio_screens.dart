import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:minegociomenu/presentation/Screens/categorias/presentation/widgets/lista_categorias.dart';
import 'package:minegociomenu/core/utils/comunicacion.dart';
import 'package:minegociomenu/core/utils/connection.dart';

class EnvioScreen extends ConsumerStatefulWidget {
  const EnvioScreen({super.key});

  @override
  _EnvioScreenState createState() => _EnvioScreenState();
}

class _EnvioScreenState extends ConsumerState<EnvioScreen> {
  @override
  void initState() {
    super.initState();
    checkLocationPermission(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recivir envío'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  '\Costo final de la entrega',
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
                ),
                Center(
                  child: Text(
                    '\$0.50 USD',
                    style:
                        TextStyle(color: Colors.green.shade300, fontSize: 48),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
/*             Text(
              'Información de envío: ',
              style: TextStyle(fontSize: 22.0, color: Colors.grey.shade600),
            ),
            const CardLocation(), */
            FormaPagoWidget(),
            const SizedBox(height: 16.0),
            Text(
              'Seleccione categorias: ',
              style: TextStyle(fontSize: 22.0, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 8.0),
            ListaCategorias(),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 48.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                height: 48.0,
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("SOLICITAR ",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 18.0)),
                      GestureDetector(
                        onTap: () {
                          try {
                            whatsapp(context, "51979128");
                            //_launchWhatsapp(context, product.telefono);
                            launchURL('whatsapp://send?phone=+${"5351979128"}');
                          } catch (e) {
                            print('Error al abrir la URL de WhatsApp: $e');
                          }
                        },
                        child: const Icon(
                          Bootstrap.whatsapp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
                height: 48.0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("SOLICITAR ",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 18.0)),
                      GestureDetector(
                        onTap: () {
                          launchURL('tel:${51979128}');
                        },
                        child: const Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}

class FormaPagoWidget extends StatefulWidget {
  @override
  _FormaPagoWidgetState createState() => _FormaPagoWidgetState();
}

class _FormaPagoWidgetState extends State<FormaPagoWidget> {
  String formaPago = '';
  bool esDivisa = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Selecciona la forma de pago:'),
        Row(
          children: [
            Radio(
              value: 'Efectivo',
              groupValue: formaPago,
              onChanged: (value) {
                setState(() {
                  formaPago = value.toString();
                });
              },
            ),
            Text('Efectivo'),
            SizedBox(width: 20),
            Radio(
              value: 'Transferencia',
              groupValue: formaPago,
              onChanged: (value) {
                setState(() {
                  formaPago = value.toString();
                });
              },
            ),
            Text('Transferencia'),
          ],
        ),
        if (formaPago.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text('¿En qué moneda deseas realizar el pago?'),
              Row(
                children: [
                  Checkbox(
                    value: esDivisa,
                    onChanged: (value) {
                      setState(() {
                        esDivisa = value ?? false;
                      });
                    },
                  ),
                  const Text('Divisa'),
                  const SizedBox(width: 20),
                  Checkbox(
                    value: !esDivisa,
                    onChanged: (value) {
                      setState(() {
                        esDivisa = value ?? false;
                      });
                    },
                  ),
                  Text('Moneda Nacional'),
                ],
              ),
            ],
          ),
      ],
    );
  }
}
