import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String apiUrl;

  AuthService(this.apiUrl);

  Future<bool> login(String username, String password) async {
    try {
      var response = await http.post(Uri.parse('$apiUrl/login'), body: {
        'email': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        // Aquí puedes procesar la respuesta según las necesidades de tu aplicación
        Map<String, dynamic> responseMap = json.decode(response.body);

        // Obtén el token del mapa
        String? token = responseMap['token'];
        String? message = responseMap['message'];
        String? status = responseMap['status'];

        // Guarda el token en las preferencias de usuario
        await guardarTokenEnPreferencias(token!);
        return true; // Indica éxito en el inicio de sesión
      } else {
        // Aquí puedes manejar el error según las necesidades de tu aplicación
        print("Error en el inicio de sesión: ${response.statusCode}");
        return false; // Indica fallo en el inicio de sesión
      }
    } catch (error) {
      // Manejar errores de red u otros
      print("Error en la solicitud HTTP: $error");
      return false; // Indica fallo en el inicio de sesión
    }
  }

  // Función para obtener el token desde las preferencias
  Future<String?> getTokenFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Recupera el token almacenado en las preferencias
    String? token = prefs.getString('token');

    return token;
  }

  // Guarda el token en las preferencias después de iniciar sesión
  Future<void> guardarTokenEnPreferencias(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Guarda el token en las preferencias
    prefs.setString('token', token);

    print("Token guardado en las preferencias: $token");
  }

  // Uso de la función para obtener el token-------------------------
  void obtenerYUsarToken() async {
    String? token = await getTokenFromPreferences();

    if (token != null) {
      // Aquí puedes usar el token según tus necesidades
      print("Token almacenado en las preferencias: $token");

      // Por ejemplo, puedes enviar el token en las solicitudes HTTP
      // ...
    } else {
      // Manejar el caso donde el token no está presente en las preferencias
      print("No se encontró el token en las preferencias.");
    }
  }
}
