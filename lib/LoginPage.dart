import 'package:flutter/material.dart';
import 'DashboardPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),

              // Judul
              Center(
                child: Text(
                  "Daily Activity Tracker",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 40),
              Text(
                "Login",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 40),
              //username
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Username",
                  prefixIcon: Icon(Icons.person), // untuk icon gambar orang
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 16),
              //password
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock), // untuk icon gambar kunci
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 24),
              //tombol login
              SizedBox(
                width: double.infinity, //tombol full lebar
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // validasi username dan passsword
                    if (usernameController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Username dan Password wajib diisi"),
                        ),
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        '/dashboard',
                        arguments: {
                          'username': usernameController.text,
                          'password': passwordController.text,
                        },
                      );
                    }
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
