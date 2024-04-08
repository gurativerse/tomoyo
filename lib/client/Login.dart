// ignore: file_names
import 'package:flutter/material.dart';
import 'package:tomoyo/client/Signup.dart';
import '../theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  // final _firestore = FirebaseFirestore.instance;
  String _email = '';
  String _password = '';
  String _username = '';

  Future<void> _registerAccount() async {
    if (_formKey.currentState!.validate()) {
      try {
        final newUser = await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);

        final user = newUser.user;
        if (user != null) {

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      } on FirebaseAuthException catch (e) {
        print('Firebase Auth Error: $e');
        _showErrorDialog(e.message ?? 'An unknown error occurred');
      } catch (e) {
        print('General Error: $e');
        _showErrorDialog('An unknown error occurred');
      }
    } else {
      _showErrorDialog('Passwords do not match');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Signin Failed'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(ColorPalatte.color['base']!),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              Center(child: Image.asset('./asset/logo2.png', width: 300)),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New to Tomoyo?',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: Text('Sign up',
                          style: TextStyle(
                              color: Color(ColorPalatte.color['button']!),
                              fontSize: 16)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEmailField(),
                    SizedBox(height: 15),
                    _buildPasswordField(),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color(ColorPalatte.color['button']!)),
                ),
                onPressed: _trySubmitForm,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 8),
        Container(
          width: 350,
          child: TextFormField(
            onChanged: (value) => _email = value,
            decoration: InputDecoration(
              labelText: 'Email',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide:
                    BorderSide(color: Color(ColorPalatte.color['line']!)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 8),
        Container(
          width: 350,
          child: TextFormField(
            onChanged: (value) => _password = value,
            decoration: InputDecoration(
              labelText: 'Password',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide:
                    BorderSide(color: Color(ColorPalatte.color['line']!)),
              ),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  void _trySubmitForm() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save(); // Save the form
      _registerAccount();
    }
  }
}
