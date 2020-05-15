import 'package:http/http.dart' show Client;
import 'package:primerappflutter/src/model/Photos.dart';

class Api {
  static const baseUrl = 'https://jsonplaceholder.typicode.com/photos';

  final Client _client = Client();

  Future<List<Photos>> getPhotos() async{
    List<Photos> photosList;

    final response = await _client.get(baseUrl);
    photosList = photosFromJson(response.body);

    return photosList;
  }
}