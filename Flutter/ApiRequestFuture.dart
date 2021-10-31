
class ApiManager
{
  static String baseUrl = 'YOU_BASE_URL';

  static Future<User> loginUser(String username, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl + '/users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password
      }),
    );
    var responseJson = catchServerError(response);    //For correct gest error go to error handling
    if (response.statusCode == 200) {
      return User(name: username, password: password);
    } else {
      throw Exception(responseJson.toString());
    }
  }
}
