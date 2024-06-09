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
      
      return cupertinoWidget(context, 'Hi from web with Cupertino!');
    } 
  
    else if (UniversalPlatform.isAndroid) {
      debugPrint("Android");
      
      return materialWidget(context, 'Hi Android with Material!');
    } 
  
    else if (UniversalPlatform.isIOS) {
      debugPrint("iOS");
  
      return cupertinoWidget(context, 'Hi iOS with Cupertino!');
    } 
    
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
      home: MaterialSearchPage(),
    );
    
  }

  Widget cupertinoWidget(BuildContext context, String message) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
        brightness: Brightness.light,
      ),
      home: CupertinoSearchPage(),
    );
  }
}

class MaterialSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (String value) {
                debugPrint('Search text: $value');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CupertinoSearchPage extends StatefulWidget {
  @override
  State<CupertinoSearchPage> createState() => _CupertinoSearchPageState();
}

class _CupertinoSearchPageState extends State<CupertinoSearchPage> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Search'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CupertinoSearchTextField(
                onChanged: (String value) {
                  setState(() {
                    text = 'The text has changed to: $value';
                  });
                },
                onSubmitted: (String value) {
                  setState(() {
                    text = 'Submitted text: $value';
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
