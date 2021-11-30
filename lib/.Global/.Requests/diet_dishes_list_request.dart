import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_klient_lightbox_test/.Global/global_variables.dart'
    as globalVariables;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_klient_lightbox_test/Diet/Widgets/body_diet_details.dart';
import 'package:intl/intl.dart';

//request z pobraniem listy 5 dań dla diety na dany dzień
Future<List<Dish>> dishesListRequest(context) async {
  final uri = '${globalVariables.httpRequest}/menu/flex';
  Response response;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var _sessionToken = prefs.getString('sessionToken');

  final headers = {
    //naglowek wysylany w ramach requestu
    'Content-Type': 'application/json',
    'sessionToken': _sessionToken
  };

  Map<String, dynamic> body = {
    //body wysylane w ramach requestu, przyklad:
    'dataDiety': DateFormat('yyyy-MM-dd').format(DateFormat('dd.MM.yyyy').parse(chosenDate)), 
    // w aplikacji jest format 'dd.MM.yyyy', ale w requescie trzeba wyslac date w formacie 'yyyy-MM-dd'
  };

  try {
    String jsonBody = json.encode(body);
    response = await post( //<------------------------WAZNE!!! Metoda requestu
      uri,
      headers: headers,
      body: jsonBody,
    ).timeout(const Duration(seconds: 15));
  } on TimeoutException {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Nie można załadować obiektu list_dishes. Przekroczony limit czasu żądania.'),
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
            'Nie można załadować obiektu list_dishes. ${e.toString()}'),
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
      var jsonResponse = DishesList.fromJson(parsedJson);
      print('DishesList request HTTP CODE: ${response.statusCode}, retCode: ${jsonResponse.retCode}, retMessage: ${jsonResponse.retMessage}');

      if (jsonResponse.retCode == 0) {
        // jezeli retCode OK
        return jsonResponse.dishes; // zwroc liste dań
      } else // jezeli blad
      {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Nie można załadować obiektu list_dishes. ${jsonResponse.retMessage}'),
            action: SnackBarAction(
                label: 'Zamknij',
                onPressed: Scaffold.of(context).hideCurrentSnackBar),
          ),
        );
      }
    } else {
      print('DishesList request HTTP CODE: ${response.statusCode}, BODY: ${response.body}');
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Nie można załadować obiektu list_dishes. Kod błędu HTTP: ${response.statusCode}'),
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

class DishesList {
  final int retCode;
  final String retMessage;
  final List<Dish> dishes;

  //dodaj wszystkie zmienne otrzymywane z JSONa w ramach odpowiedzi
  DishesList({this.retCode, this.retMessage, this.dishes});

  factory DishesList.fromJson(Map<String, dynamic> json) {
    List<Dish> dishesList=[];
    var list = json['arrPosilkiFlex'] as List;
    if (list!=null)
      dishesList = list.map((i) => Dish.fromJson(i)).toList();
    return DishesList(
      retCode: json['RET_CODE'],
      retMessage: json['RET_MESSAGE'],
      dishes: dishesList,
    );
  }
}

class Dish {
  final int id;
  final String container;
  final String name;

  Dish(
      {this.id,
      this.container,
      this.name
      });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['idPosilku'],
      container: json['kontener'],
      name: json['nazwaPosilku'],
    );
  }
}
