import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (UniversalPlatform.isWeb) {
      debugPrint("Web");
      
      return cupertinoWidget(context, 'Hi Android with Cupertino!');
    } 
    // iOS
    else if (UniversalPlatform.isAndroid) {
      debugPrint("iOS");
      // Cupertino UI Presentation
      return cupertinoWidget(context, 'Hi iOS with Cupertino!');
    } 
    // Other platforms (web, desktop, etc.)
    else {
      return materialWidget(context, 'Hi from other platform with Material!');
    }
  }

  Widget materialWidget(BuildContext context, String message) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MaterialLoginPage(),
    );
  }

  Widget cupertinoWidget(BuildContext context, String message) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
        brightness: Brightness.light,  // Configurar el modo claro
      ),
      home: CupertinoLoginPage(),
    );
  }
}



class MaterialLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'imgLo.png',
                      fit: BoxFit.cover,
                      height: 200, // Altura de la imagen
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Username',
                                filled: true,
                                fillColor: Color(0xFFE0E0E0),
                                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                filled: true,
                                fillColor: Color(0xFFE0E0E0),
                                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                              ),
                              obscureText: true,
                            ),
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: 300,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF6000EE)),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 20)),
                              ),
                              onPressed: () {
                                // Handle login
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                              // Handle reset passphrase action
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                // Handle sign up action
              },
              child: Text(
                'Sign up here',
                style: TextStyle(
                  color: Color(0xFF6000EE),
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CupertinoLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'logo.jpg', // Ajusta la ruta de la imagen según tu proyecto
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    CupertinoTextField(
                      placeholder: 'Username',
                      placeholderStyle: TextStyle(
                        color: Color(0xFFB4B9BC), // Color del placeholder #B4B9BC
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12), // Aumenta la altura y espacio a la izquierda
                    ),
                    SizedBox(height: 16),
                    CupertinoTextField(
                      placeholder: 'Password',
                      placeholderStyle: TextStyle(
                        color: Color(0xFFB4B9BC), // Color del placeholder #B4B9BC
                      ),
                      obscureText: true,
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12), // Aumenta la altura y espacio a la izquierda
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        color: Color(0xFF60AACB), // Color personalizado #60AACB
                        padding: EdgeInsets.symmetric(vertical: 20), // Aumenta la altura
                        child: Text('Sign In'),
                        onPressed: () {
                          // Handle login
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        // Handle reset passphrase action
                      },
                      child: Text(
                        'Reset your passphrase?',
                        style: TextStyle(
                          color: Color(0xFFB4B9BC), // Color #B4B9BC
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

