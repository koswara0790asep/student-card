import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        leading: InkWell(child: const Icon(Icons.compare_arrows),onTap: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.clear();
          Navigator.pushReplacementNamed(context, "/login");
        },),
        title: Text(
          "Lear With Us",
          style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 18, letterSpacing: 1)),
        ),
        backgroundColor: Colors.black87,
        centerTitle: true,
        actions: const <Widget>[

        ],
      ),
      body: Stack(
        children: [
          WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://rrtutors.com/language/Flutter',
            onPageFinished:(value){
          setState(() {
            isLoading=true;
          });

            },

          ),
          (!isLoading)?const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green,
            ),
          ):Container()
        ],

      ),
    );
  }
}
