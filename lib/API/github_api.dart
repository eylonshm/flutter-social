import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.github.com";

final _random = new Random();

class GitHubApi {
  Future<dynamic> _request(String resource) async {
    var response = await http.get(Uri.parse("$baseUrl/$resource"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to retrieve response for $resource');
    }
  }

  int _next() => 2000 + _random.nextInt(15000);

  Future<List<dynamic>> getUserRepositories(String userLoginId) async =>
      _request('users/$userLoginId/repos?per_page=250') as List<dynamic>;

  Future<List<dynamic>> getUserOrganisations(String userLoginId) async =>
      _request('users/$userLoginId/orgs?per_page=250') as List<dynamic>;

  Future<List<dynamic>> getOrganisationsRepositories(String orgLoginId) async =>
      _request('orgs/$orgLoginId/repos?per_page=250') as List<dynamic>;

  Future<dynamic> getUserInformation(String userLoginId) async =>
      _request('users/$userLoginId');

  Future<List<dynamic>> getRandomUsers() async =>
      _request('users?since=${_next()}') as List<dynamic>;
}
