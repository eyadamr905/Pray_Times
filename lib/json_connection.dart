import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

import 'data.dart';

class JsonConnection {

  late Future   pLat;
  late Future pLong;

  late Data list;

  Future getPTLocation() async {

    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);

    pLat = position.latitude as Future;
    pLong = position.longitude as Future;

    String date = DateTime.now().toIso8601String();
    int method = 4;

    final url = "http://api.aladhan.com/v1/timings/$date?latitude=$pLat&longitude=$pLong&method=$method";

    http.Response res = await http.get(Uri.encodeFull(url), headers: {
      "Accept":
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });

    final data = json.decode(res.body);

    list = new Data.fromJson(data);

    return list;
  }
}