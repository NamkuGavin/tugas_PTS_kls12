import 'package:api_list_tuto/home.dart';
import 'package:api_list_tuto/register.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();
  bool _visible = false;
  FocusNode _isSelected1 = FocusNode();
  FocusNode _isSelected2 = FocusNode();
  bool showError = false;

  @override
  void initState() {
    super.initState();
    _user.addListener(() {
      if (EmailValidator.validate(_user.text)) {
        showError = false;
      } else {
        showError = true;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  headerLogin(),
                  inputLogin(),
                  buttonLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  inputLogin() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 20),
          child: Material(
            elevation: _isSelected1.hasFocus ? 15 : 0,
            shadowColor: Colors.grey[100],
            child: Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ThemeData().colorScheme.copyWith(
                        primary: Colors.green,
                      )),
              child: TextFormField(
                validator: (value) {
                  if (value != "admin@gmail.com") {
                    return 'Please enter some text';
                  }
                  return null;
                },
                focusNode: _isSelected1,
                controller: _user,
                autofocus: true,
                style: TextStyle(
                    color: _isSelected1.hasFocus ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.w900),
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    labelText: "EMAIL",
                    prefixIcon: showError
                        ? Icon(Icons.error_outline, color: Colors.red)
                        : Icon(Icons.email_outlined),
                    fillColor: Colors.grey[50],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey.shade50))),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
          child: Material(
            elevation: _isSelected2.hasFocus ? 15 : 0,
            shadowColor: Colors.grey[100],
            child: Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ThemeData().colorScheme.copyWith(
                        primary: Colors.green,
                      )),
              child: TextFormField(
                validator: (value) {
                  if (value != "admin") {
                    return 'Please enter some text';
                  }
                  return null;
                },
                focusNode: _isSelected2,
                controller: _pass,
                autofocus: true,
                style: TextStyle(
                    color: _isSelected2.hasFocus ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.w900),
                obscureText: !_visible,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    labelText: "PASSWORD",
                    prefixIcon: IconButton(
                      icon: Icon(
                        _visible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _visible = !_visible;
                        });
                      },
                    ),
                    fillColor: Colors.grey[50],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey.shade50))),
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
              ),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Padding(
          padding: EdgeInsets.only(left: 190, bottom: 40),
          child: Text(
            "Forgot Password?",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green),
          ),
        ),
      ],
    );
  }

  headerLogin() {
    return Column(
      children: [
        Icon(
          Icons.account_circle_outlined,
          size: 125,
          color: Colors.grey[300],
        ),
        Text(
          "Welcome Back",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text(
          "Sign to Continue",
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ],
    );
  }

  buttonLogin() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            child: Text('LOGIN'),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                SharedPreferences _prefs =
                    await SharedPreferences.getInstance();
                _prefs.setString('email', _user.text);
                _prefs.setString('password', _pass.text);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false);
              }
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green)),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have account? ",
              style: TextStyle(fontSize: 13),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text(
                "create a new account",
                style: TextStyle(fontSize: 13, color: Colors.green),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
