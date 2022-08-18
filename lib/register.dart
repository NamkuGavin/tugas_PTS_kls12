import 'package:api_list_tuto/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _userReg = TextEditingController();
  TextEditingController _passReg = TextEditingController();
  TextEditingController _confPass = TextEditingController();
  FocusNode _isSelected1 = FocusNode();
  FocusNode _isSelected2 = FocusNode();
  FocusNode _isSelected3 = FocusNode();
  FocusNode _isSelected4 = FocusNode();
  FocusNode _isSelected5 = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _visible = false;
  bool _visibleConfirm = false;
  bool showErrorEmail = false;
  bool _showErrorPass = true;

  @override
  void initState() {
    super.initState();
    _userReg.addListener(() {
      if (EmailValidator.validate(_userReg.text)) {
        showErrorEmail = false;
      } else {
        showErrorEmail = true;
      }
      setState(() {});
    });
    _confPass.addListener(() {
      if (_passReg.text == _confPass.text) {
        _showErrorPass = false;
      } else {
        _showErrorPass = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  headerRegis(),
                  inputRegis(),
                  buttonRegis(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  headerRegis() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 290, bottom: 40, top: 30),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false);
              },
              child: Icon(
                size: 30,
                Icons.arrow_back,
                color: Colors.green,
              )),
        ),
        Text(
          "Create Account",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text(
          "Create a new account",
          style: TextStyle(fontSize: 15, color: Colors.grey[700]),
        ),
      ],
    );
  }

  inputRegis() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Colors.green,
                    )),
            child: TextFormField(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              focusNode: _isSelected1,
              autofocus: true,
              style: TextStyle(
                  color: _isSelected1.hasFocus ? Colors.green : Colors.grey,
                  fontWeight: FontWeight.w900),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  labelText: "NAME",
                  prefixIcon: Icon(Icons.person_outline),
                  fillColor: Colors.grey[50],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.grey.shade50))),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Colors.green,
                    )),
            child: TextFormField(
              controller: _userReg,
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              focusNode: _isSelected2,
              autofocus: true,
              style: TextStyle(
                  color: _isSelected2.hasFocus ? Colors.green : Colors.grey,
                  fontWeight: FontWeight.w900),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  labelText: "EMAIL",
                  prefixIcon: showErrorEmail
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
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Colors.green,
                    )),
            child: TextFormField(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              focusNode: _isSelected3,
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: TextStyle(
                  color: _isSelected3.hasFocus ? Colors.green : Colors.grey,
                  fontWeight: FontWeight.w900),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  labelText: "PHONE",
                  prefixIcon: Icon(Icons.phone_android),
                  fillColor: Colors.grey[50],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.grey.shade50))),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Colors.green,
                    )),
            child: TextFormField(
              controller: _passReg,
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              focusNode: _isSelected4,
              autofocus: true,
              style: TextStyle(
                  color: _isSelected4.hasFocus ? Colors.green : Colors.grey,
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
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 40),
          child: FlutterPwValidator(
            controller: _passReg,
            minLength: 6,
            width: 300,
            height: 30,
            onSuccess: () {},
            onFail: () {},
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 20),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Colors.green,
                    )),
            child: TextFormField(
              controller: _confPass,
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              focusNode: _isSelected5,
              autofocus: true,
              style: TextStyle(
                  color: _isSelected5.hasFocus ? Colors.green : Colors.grey,
                  fontWeight: FontWeight.w900),
              obscureText: !_visibleConfirm,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  labelText: "CONFIRM PASSWORD",
                  prefixIcon: IconButton(
                    icon: Icon(
                      _visibleConfirm ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _visibleConfirm = !_visibleConfirm;
                      });
                    },
                  ),
                  fillColor: Colors.grey[50],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.grey.shade50))),
            ),
          ),
        ),
        _showErrorPass
            ? Padding(
                padding: EdgeInsets.only(left: 40, bottom: 50),
                child: Text("Password didn't match",
                    style: TextStyle(color: Colors.red, fontSize: 13)),
              )
            : Container(),
      ],
    );
  }

  buttonRegis() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            child: Text('CREATE ACCOUNT'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false);
              }
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green)),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have account? ",
                style: TextStyle(fontSize: 13),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false);
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 13, color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
