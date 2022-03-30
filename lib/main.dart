import 'package:flutter/material.dart';
import 'package:shpotify/widgets/artist_page/artist_page_widget.dart';
import 'package:shpotify/widgets/auth/auth_widget.dart';
import 'package:shpotify/widgets/main_screen/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          foregroundColor: Color.fromRGBO(0, 0, 0, 1)
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          textStyle: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.w700),
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 32)),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black45
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Color.fromRGBO(30, 215, 96, 1.0))
      ),
      routes: {
        '/auth': (context) => AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(),
        '/main_screen/artist_page': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments as int;
          if (arguments is int) {
            return ArtistPageWidget(
              artistId: arguments,
            );
          } else {
            return ArtistPageWidget(
              artistId: 1,
            );
          }
        },
      },
      initialRoute: '/auth',
    );
  }
}