import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter_klient_lightbox_test/Login/Widgets/box_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_klient_lightbox_test/Home/home_page.dart';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_klient_lightbox_test/.Global/global_variables.dart'
    as globalVariables;
import 'package:shared_preferences/shared_preferences.dart';

//request logowania użytkownika do aplikacji
Future<void> loginRequest(context) async {
  final uri = '${globalVariables.httpRequest}/app/login';
  final headers = {'Content-Type': 'application/json'};
  Response response;

  Map<String, dynamic> body = {
    'login': loginController.text,
    'password': passwordController.text
  };

  //deklaracja odpowiedzi
  try {
    String jsonBody = json.encode(body);
    response = await post(
      uri,
      headers: headers,
      body: jsonBody,
    ).timeout(const Duration(seconds: 10));
  } on TimeoutException {
    //====================ALERT DIALOG - EXCEPTION=====================
    //przycisk potwierdzajacy
    Widget okButton = FlatButton(
      textColor: Color.fromRGBO(102, 153, 51, 1),
      child: Text("Potwierdź"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context); // zamknij ladowanie ekranu
      },
    );
    //dialog
    AlertDialog alert = AlertDialog(
      title: Text("Błąd"),
      content: Text(
          "Nie można połączyć się z serwerem. Przekroczony limit czasu żądania."),
      actions: [
        okButton,
      ],
    );
    //pokaz komunikat
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
    //===========================================================================
  } catch (e) {
    //====================ALERT DIALOG - EXCEPTION=====================
    //przycisk potwierdzajacy
    Widget okButton = FlatButton(
      textColor: Color.fromRGBO(102, 153, 51, 1),
      child: Text("Potwierdź"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context); // zamknij ladowanie ekranu
      },
    );
    //dialog
    AlertDialog alert = AlertDialog(
      title: Text("Błąd"),
      content: Text(e.toString()),
      actions: [
        okButton,
      ],
    );
    //pokaz komunikat
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
    //===========================================================================
  }

  //============================ response =========================================
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi && response != null) {
    // jezeli polaczenie jest ok

    if (response.statusCode == 200) // jezeli HTTP OK
    {
      var parsedJson = (json.decode(response.body));
      var jsonResponse = LoginResponse.fromJson(parsedJson);
      print(
          'Login request HTTP CODE: ${response.statusCode}, retCode: ${jsonResponse.retCode}, retMessage: ${jsonResponse.retMessage}');

      if (jsonResponse.retCode == 0) // jezeli retCode OK
      {
        // ===przypisz do shared preferences (dane nie znikaja nawet po wylaczeniu appki)===
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs?.setBool("isLoggedIn",
            true); // potrzebne do wyboru ekranu przy starcie appki (niezalogowany - loginpage, zalogowany - homepage)
        prefs?.setString(
            "sessionToken",
            jsonResponse
                .sessionToken); // potrzebne do wysylania requestow po wznowieniu appki
        print('User logged in');
        //=======================================
        Navigator.pop(context); // zamknij ladowanie ekranu
        Get.to(HomePage()); // przejdz do nastepnej strony
      } else // jezeli blad
      {
        //====================ALERT DIALOG=====================
        //przycisk potwierdzajacy
        Widget okButton = FlatButton(
          textColor: Color.fromRGBO(102, 153, 51, 1),
          child: Text("Potwierdź"),
          onPressed: () {
            Navigator.pop(context); // zamknij komunikat
            Navigator.pop(context); // zamknij ladowanie ekranu
          },
        );

        //dialog
        AlertDialog alert = AlertDialog(
          title: Text("Uwaga"),
          content: Text(jsonResponse.retMessage),
          actions: [
            okButton,
          ],
        );

        //pokaz komunikat
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return alert;
          },
        );
        //======================================================
      }
    } else {
      print(
          'Login request HTTP CODE: ${response.statusCode}, BODY: ${response.body}');
      //====================ALERT DIALOG=====================
      //przycisk potwierdzajacy
      Widget okButton = FlatButton(
        textColor: Color.fromRGBO(102, 153, 51, 1),
        child: Text("Potwierdź"),
        onPressed: () {
          Navigator.pop(context); // zamknij komunikat
          Navigator.pop(context); // zamknij ladowanie ekranu
        },
      );

      //dialog
      AlertDialog alert = AlertDialog(
        title: Text('Błąd'),
        content: Text(
            'Kod błędu HTTP: ${response.statusCode}. Jeżeli problem będzie się powtarzał, skontaktuj się z administratorem systemu.'),
        actions: [
          okButton,
        ],
      );

      //pokaz komunikat
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return alert;
        },
      );
      //======================================================
    }
  } else {
    print("No internet connection");
    Navigator.pop(context); // nie pokazuj komunikatu exception
    //====================ALERT DIALOG=====================
    //przycisk potwierdzajacy
    Widget okButton = FlatButton(
      textColor: Color.fromRGBO(102, 153, 51, 1),
      child: Text("Potwierdź"),
      onPressed: () {
        Navigator.pop(context); // zamknij komunikat
        Navigator.pop(context); // zamknij ladowanie ekranu
      },
    );

    //dialog
    AlertDialog alert = AlertDialog(
      title: Text('Błąd'),
      content: Text(
          'Brak połączenia z Internetem. Sprawdź, czy masz włączone dane mobilne lub połączenie WiFi.'),
      actions: [
        okButton,
      ],
    );

    //pokaz komunikat
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class LoginResponse {
  final int retCode;
  final String retMessage;
  final String sessionToken;

  //dodaj wszystkie zmienne otrzymywane z JSONa w ramach odpowiedzi
  LoginResponse({this.retCode, this.retMessage, this.sessionToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        //dodaj wszystkie zmienne otrzymywane z JSONa w ramach odpowiedzi
        retCode: json['RET_CODE'],
        retMessage: json['RET_MESSAGE'],
        sessionToken: json['SESSION_TOKEN']);
  }
}
