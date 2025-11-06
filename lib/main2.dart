import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Login',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Halaman Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title = "Login Page"}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final String _correctUsername = "shafnat";
  final String _correctPassword = "607012400075";

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitLogin() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      _showSnackBar('Data tidak boleh kosong', Colors.red);
      return;
    }

    if (username == _correctUsername && password == _correctPassword) {
      _showSnackBar('Login Berhasil! Selamat datang, $username', Colors.green);
    } else {
      _showSnackBar('Username atau Password salah', Colors.red);
    }
  }

  void _showSnackBar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }

// Main
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange, title: Text(widget.title)),
      body: Padding(
        
        padding: const EdgeInsets.all(24.0),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Image.network(
              'https://placehold.co/150x150/FF9800/FFFFFF?text=LOGO',
              height: 150,
              width: 150,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey[200],
                  child: Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey[400],
                  ),
                );
              },
            ),
            SizedBox(height: 32),

            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                hintText: 'Masukkan username (nama) Anda',
              ),
            ),
            SizedBox(height: 16),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Masukkan password (NIM) Anda',
              ),
            ),
            SizedBox(height: 32),

            ElevatedButton(
              onPressed: _submitLogin,
              child: Text('Kirim'),
            ),
          ],
        ),
      ),
    );
  }
}