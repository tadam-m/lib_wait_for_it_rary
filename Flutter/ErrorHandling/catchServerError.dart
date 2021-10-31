// USAGE var responseJson = catchServerError(response);

//   if (response.statusCode == 200) -> return content;
//   else
//     throw Exception(responseJson.toString());

// Custom your execptions on custom_exeptions.dart

static dynamic catchServerError(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 401:
        throw BadRequestException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
}
