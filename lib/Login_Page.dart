import 'package:flutter/material.dart';
import 'package:kuis_124200042/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _Logo(),
              _usernameField(),
              _passwordField(),
              _loginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Logo() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15.0, 0, 25.0),
      child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 120.0,
      child: Image.asset(
        'assets/Logo.png',
        //   width: 200,
        //   height: 200,
        //   fit: BoxFit.contain,
      ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Input Username',
          label: Text('Username'),
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: (Colors.blue)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
          hintText: 'Input Password',
          label: Text('Password'),
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return SecondScreen(username: username, password: password);
          // }));
          String text = "";
          if (password == "Ghana") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return HomePage(username: username);
                }));
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }

          SnackBar snackBar = SnackBar(
              content: Text(text)
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text("Login"),
        style: ElevatedButton.styleFrom(
          primary: (isLoginSuccess) ? Colors.blue : Colors.blue,
          onPrimary: Colors.white,
        ),
      ),
    );
  }
}
