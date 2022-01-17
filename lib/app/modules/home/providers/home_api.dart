import 'package:get/get.dart';
import 'package:test_tyba/app/data/database/search_db.dart';
import 'package:test_tyba/app/data/models/search.dart';

class HomeAPI extends GetConnect {
  Future<List> search(Search search) async {
    await SearchDB.insertSearch(search);
    final coordinates = await getCoordinates(search.search);
    final places = await getPlaces(coordinates);
    return places;
  }

  Future<List> loadHistory() async {
    final history = await SearchDB.bringSearchs();
    return history;
  }

  Future<Map<String, dynamic>> getCoordinates(String search) async {
    try {
      final uriUrl = Uri.http('api.openweathermap.org', 'geo/1.0/direct', {
        'q': search,
        'limit': '10',
        'appid': 'd794a807b47983abc118af639215e420'
      });
      Response response = await get(uriUrl.toString());
      return {'lat': response.body[0]['lat'], 'lon': response.body[0]['lon']};
    } catch (e) {
      throw new Exception(e);
    }
  }

  Future<List> getPlaces(Map<String, dynamic> coordinates) async {
    try {
      final lat = coordinates['lat'];
      final lon = coordinates['lon'];
      final uriUrl =
          Uri.https('places.ls.hereapi.com', 'places/v1/discover/around', {
        'at': '$lat,$lon',
        'apiKey': 'zfHW1sNpLlJD_cSP1r9H58BX5rMK2uIfvQniYRGOd0M',
        'cat': 'restaurant'
      });
      Response response = await get(uriUrl.toString());
      final sites = response.body['results']['items'];
      return sites;
    } catch (e) {
      throw new Exception(e);
    }
  }
}
