import 'package:flutter/material.dart';
import 'package:minegociomenu/presentation/Screens/globals/04Login/presentation/Screen/qr_view_example.dart';
import 'package:minegociomenu/presentation/widgets/botones/EnterButton.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Registrar"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 48.0, right: 48.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const QRViewExample(),
                  ));
                },
                child: const Image(
                  height: 96.0,
                  image: AssetImage('assets/icon/qr_logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Nombre del cliente'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Apellido completos'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Número Telefonico'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Correo Electrónico'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Dirección'),
                obscureText: true,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Datos del balon de gas'),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              const EnterButton(
                buttonText: 'Registrar',
                route: '',

                //dasboardscreen
              ),
            ],
          ),
        ),
      ),
    );
  }
}
