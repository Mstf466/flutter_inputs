import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  const TextFormFieldKullanimi({super.key});

  @override
  State<TextFormFieldKullanimi> createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  String _email = '', _password = '', _userName = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Textform Field Kullanimi'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //initialValue: 'mustafasamierol',
                  decoration: InputDecoration(
                      //errorStyle: TextStyle(color: Colors.blue.shade900),
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Username'),
                  onSaved: (deger) {
                    _userName = deger!;
                  },
                  validator: (deger) {
                    if (deger!.length < 4) {
                      return 'Username en az 4 karakter olmalı';
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  //initialValue: 'mustafasamierol@outlook.com',
                  decoration: InputDecoration(
                      //errorStyle: TextStyle(color: Colors.blue.shade900),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Email'),
                  onSaved: (deger) {
                    _email = deger!;
                  },
                  validator: (deger) {
                    if (!EmailValidator.validate(deger!)) {
                      return 'Geçerli mail giriniz';
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  //initialValue: 'mustafasamierol@outlook.com',
                  decoration: InputDecoration(
                      //errorStyle: TextStyle(color: Colors.blue.shade900),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Password'),
                  onSaved: (deger) {
                    _password = deger!;
                  },
                  validator: (deger) {
                    if (deger!.length < 6) {
                      return 'Şifre en az 6 karakter olmali';
                    } else
                      return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    bool _validate = _formKey.currentState!.validate();
                    if (_validate) {
                      _formKey.currentState!.save();
                      String result =
                          'username:$_userName\n email :$_email\n sifre :$_password ';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            result,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      );
                      _formKey.currentState!.reset();
                    }
                  },
                  child: Text('Onayla'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
