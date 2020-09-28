import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:infoveapp/src/login_state.dart';
import 'package:infoveapp/src/pages/networking.dart';
import 'package:provider/provider.dart';
import 'package:infoveapp/src/pages/menu_page.dart';
import 'package:infoveapp/src/pages/consulta_documento_screen.dart';
import 'package:infoveapp/src/pages/busqueda_documento_page.dart';
import 'package:infoveapp/src/pages/busqueda_placa_page.dart';
import 'package:infoveapp/src/pages/login_pages.dart';
import 'package:infoveapp/src/pages/sugerencias_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginState>(
      builder: (BuildContext context) => LoginState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF2172af),
          scaffoldBackgroundColor: Colors.white,
          buttonColor: Color(0xFF2172af),
        ),
        //initialRoute: 'login2',
        routes: {
          '/': (BuildContext context) {
            var state = Provider.of<LoginState>(context);
            if (state.isLoggedIn()) {
              return MenuPage();
            }else{
              return LoginPage();
            }
          },
          'Consulta por número de documento': (BuildContext context) => DocumentoPage(),

          'Consulta por placa y fecha': (BuildContext context) => PlacaPage(),
          'menu': (BuildContext context) => MenuPage(),
          'Sugerencias y/o peticiones': (BuildContext context) => SugerenciasPage(),
        },
        supportedLocales: [
          Locale('en'),
          Locale('es'),
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}