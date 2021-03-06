import 'dart:convert';
import 'package:edupauee/Explorar/explorar_view.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:edupauee/Explorar/explorar_model.dart';
import 'package:edupauee/Explorar/explorar_controller.dart';

class ExplorarController extends GetxController {
  Future<List<Explore>> getExplorargeById(int idStore) async {
    //String baseUrl ="https://www.puntoshot.com.mx/api/offers/store/${idStore.toString()}.json";
    // final response = await http.get(baseUrl);
    final response = await rootBundle.loadString('assets/exploreStores.json');
    if (response == '') {
      //print(baseUrl);
      print("<<<< FATAL ERROR  API>>>>");
      return null;
    } else {
      return allExplorarFromJson(response);
    }
  }
}

// <String loadJson;
// Future loadAsset() async {
//   loadJson = await rootBundle.loadString('assets/stores.json');
//   print(loadJson);
//   await getAllStores();
// }>
//final response = await rootBundle.loadString('assets/stores.json');
//store = allStoresFromJson(/response.body/ response);

/*Future<void> getJson() async {
    dataString = await rootBundle.loadString('stores.json');
    getStore(dataString);
  }
  List<StoreModel> store = [];
  Future<void> getStore(String _data) async {
    if (_data == '') {
      print("Error en el sistema xd"); //Widget Mensaje error
    } else {
      store = storeModelfromJson(_data) as List<StoreModel>;
      print(store[0].id);
      print(store[0].name);
      print(store[0].image);
    }
  } */
