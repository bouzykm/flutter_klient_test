import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_klient_lightbox_test/.Global/global_variables.dart'
    as globalVariables;
import 'package:shared_preferences/shared_preferences.dart';

//request pobrania karuzeli z wyborem diet na homepage
Future<List<Diet>> carouselDietsListRequest(context) async {
  final uri = '${globalVariables.httpRequest}/menu/diety_wybrane_dla_ciebie';
  Response response;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var _sessionToken = prefs.getString('sessionToken');

  final headers = {
    //naglowek wysylany w ramach requestu:
    'Content-Type': 'application/json',
    'sessionToken': _sessionToken
  };

  Map<String, dynamic> body = {
    //body wysylane w ramach requestu, przyklad:
    //'login': 'test',

    //tu puste body
  };

  try {
    //String jsonBody = json.encode(body); // wylacz dla metody get
    response = await get( //<------------------------WAZNE!!! Metoda requestu
      uri,
      headers: headers,
      //body: jsonBody, //wylacz dla metody get
    ).timeout(const Duration(seconds: 15));
  } on TimeoutException {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Nie można załadować obiektu carousel_diets_list. Przekroczony limit czasu żądania.'),
        action: SnackBarAction(
            label: 'Zamknij',
            onPressed: Scaffold.of(context).hideCurrentSnackBar),
      ),
    );
  } 
  catch (e) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Nie można załadować obiektu carousel_diets_list. ${e.toString()}'),
        action: SnackBarAction(
            label: 'Zamknij',
            onPressed: Scaffold.of(context).hideCurrentSnackBar),
      ),
    );
  }

  //***************************************************************************** */
  //============================ response =========================================
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi && response != null) {
    // jezeli polaczenie jest ok
    if (response.statusCode == 200) // jezeli HTTP OK
    {
      var parsedJson = (json.decode(response.body));
      var jsonResponse = DietsList.fromJson(parsedJson);
      print('CarouselDietsList request HTTP CODE: ${response.statusCode}, retCode: ${jsonResponse.retCode}, retMessage: ${jsonResponse.retMessage}');

      if (jsonResponse.retCode == 0) {
        // jezeli retCode OK
        return jsonResponse.diets; // zwroc liste diet
      } else // jezeli blad
      {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Nie można załadować obiektu carousel_diets_list. ${jsonResponse.retMessage}'),
            action: SnackBarAction(
                label: 'Zamknij',
                onPressed: Scaffold.of(context).hideCurrentSnackBar),
          ),
        );
      }
    } else {
      print('CarouselDietsList request HTTP CODE: ${response.statusCode}, BODY: ${response.body}');
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Nie można załadować obiektu carousel_diets_list. Kod błędu HTTP: ${response.statusCode}'),
          action: SnackBarAction(
              label: 'Zamknij',
              onPressed: Scaffold.of(context).hideCurrentSnackBar),
        ),
      );
    }
  } else {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Brak połączenia z Internetem. Sprawdź, czy masz włączone dane mobilne lub połączenie WiFi.'),
        action: SnackBarAction(
            label: 'Zamknij',
            onPressed: Scaffold.of(context).hideCurrentSnackBar),
      ),
    );
  }
}

class DietsList {
  final int retCode;
  final String retMessage;
  final List<Diet> diets;

  //dodaj wszystkie zmienne otrzymywane z JSONa w ramach odpowiedzi
  DietsList({this.retCode, this.retMessage, this.diets});

  factory DietsList.fromJson(Map<String, dynamic> json) {
    var list = json['arrDiety'] as List;
    List<Diet> dietsList = list.map((i) => Diet.fromJson(i)).toList();

    return DietsList(
      retCode: json['RET_CODE'],
      retMessage: json['RET_MESSAGE'],
      diets: dietsList,
    );
  }
}

class Diet {
  final int id;
  final String name;
  final int caloricityMin;
  final int caloricityMax;
  final String imgURL;

  Diet(
      {this.id,
      this.name,
      this.caloricityMin,
      this.caloricityMax,
      this.imgURL});

  factory Diet.fromJson(Map<String, dynamic> json) {
    return Diet(
      id: json['idDieta'],
      name: json['nazwaDiety'],
      caloricityMin: json['kalorycznoscMin'],
      caloricityMax: json['kalorycznoscMax'],
      imgURL: json['imgURL'],
    );
  }
}
