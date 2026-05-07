import 'dart:async';
import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:icons_plus/icons_plus.dart';

const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

class SignInDemo extends StatefulWidget {
  const SignInDemo({super.key});

  @override
  State<SignInDemo> createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount? _currentUser;
  bool _isAuthorized = false;
  String _contactText = '';

  @override
  void initState() {
    super.initState();

    final GoogleSignIn signIn = GoogleSignIn.instance;
    unawaited(
      signIn.initialize().then((_) {
        signIn.authenticationEvents.listen(_handleAuthenticationEvent);
        signIn.attemptLightweightAuthentication();
      }),
    );
  }

  Future<void> _handleAuthenticationEvent(
    GoogleSignInAuthenticationEvent event,
  ) async {
    final GoogleSignInAccount? user = switch (event) {
      GoogleSignInAuthenticationEventSignIn() => event.user,
      GoogleSignInAuthenticationEventSignOut() => null,
    };

    final authorization = await user?.authorizationClient.authorizationForScopes(
      scopes,
    );

    setState(() {
      _currentUser = user;
      _isAuthorized = authorization != null;
    });

    if (user != null && authorization != null) {
      unawaited(_handleGetContact(user));
    }
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = 'Loading contact info...';
    });

    final headers = await user.authorizationClient.authorizationHeaders(scopes);
    if (headers == null) {
      setState(() {
        _contactText = 'No autorizado para leer contactos.';
      });
      return;
    }

    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: headers,
    );

    if (response.statusCode != 200) {
      setState(() {
        _contactText =
            'People API devolvio ${response.statusCode}. Revisa permisos.';
      });
      return;
    }

    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    final String? namedContact = _pickFirstNamedContact(data);

    setState(() {
      _contactText =
          namedContact != null ? 'I see you know $namedContact!' : 'No contacts to display.';
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections
        ?.cast<Map<String, dynamic>>()
        .firstWhere((c) => c['names'] != null, orElse: () => <String, dynamic>{});

    final List<dynamic>? names = contact?['names'] as List<dynamic>?;
    if (names == null || names.isEmpty) return null;

    final Map<String, dynamic>? name = names
        .cast<Map<String, dynamic>>()
        .firstWhere((n) => n['displayName'] != null, orElse: () => <String, dynamic>{});

    return name?['displayName'] as String?;
  }

  Future<void> _handleSignIn() async {
    try {
      if (GoogleSignIn.instance.supportsAuthenticate()) {
        await GoogleSignIn.instance.authenticate();
      }
    } catch (_) {}
  }

  Future<void> _handleAuthorizeScopes() async {
    final GoogleSignInAccount? user = _currentUser;
    if (user == null) return;

    try {
      await user.authorizationClient.authorizeScopes(scopes);
      setState(() {
        _isAuthorized = true;
      });
      unawaited(_handleGetContact(user));
    } catch (_) {}
  }

  Future<void> _handleSignOut() => GoogleSignIn.instance.disconnect();

  Widget _buildBody() {
    final GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(identity: user),
            title: Text(user.displayName ?? ''),
            subtitle: Text(user.email),
          ),
          const Text('Signed in successfully.'),
          if (_isAuthorized) ...<Widget>[
            Text(_contactText),
            ElevatedButton(
              onPressed: () => _handleGetContact(user),
              child: const Text('REFRESH'),
            ),
          ],
          if (!_isAuthorized) ...<Widget>[
            const Text('Additional permissions needed to read your contacts.'),
            ElevatedButton(
              onPressed: _handleAuthorizeScopes,
              child: const Text('REQUEST PERMISSIONS'),
            ),
          ],
          ElevatedButton(
            onPressed: _handleSignOut,
            child: const Text('SIGN OUT'),
          ),
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const Text('You are not currently signed in.'),
        SignInButton(onPressed: _handleSignIn),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Google Sign In'),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: _buildBody(),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Bootstrap.google),
          SizedBox(width: 12.0),
          Text('Sign In with Google'),
        ],
      ),
    );
  }
}
