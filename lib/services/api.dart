import 'package:dio/dio.dart';
import 'package:youtube_ui_meetup/models/video.dart';
import 'package:youtube_ui_meetup/shared/constants.dart';

class Api {
  var dio = Dio();
  String _query;
  String _nextToken;

  Future<List<Video>> search({String query = ''}) async {
    try {
      _query = query;
      var response = (await dio.get("https://www.googleapis.com/youtube/v3/search?part=snippet&q=$query&type=video&key=$API_KEY&maxResults=10")).data;
      _nextToken = response['nextPageToken'];
      print(response['items']);
      return (response['items'] as List).map((video) => Video.fromJsonn(video)).toList();
    } catch (e) {
      print('Falha na requisição: $e');
    }
  }
  
  Future<List<Video>> nextPage() async {
    try {
      var response = (await dio.get("https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_query&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken")).data;
      _nextToken = response['nextPageToken'];
      return (response['items'] as List).map((video) => Video.fromJsonn(video)).toList();
    } catch (e) {
      print('Falha na requisição: $e');
    }
  }
}