import 'package:flutter/material.dart';
import 'package:tomoyo/client/Home.dart';
import 'package:tomoyo/client/Signup.dart';
import '../theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(ColorPalatte.color['base']!),
        ),
        body: Column(children: [
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
          Stack(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: 350,
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Color(ColorPalatte.color['line']!)),
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 350,
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      BorderSide(color: Color(ColorPalatte.color['line']!)),
                                ),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Forgot password?',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 20)),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(
                  Color(ColorPalatte.color['button']!)),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
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
        ]));
  }
}
