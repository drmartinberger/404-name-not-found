part of "main.dart";

Future<http.Response> callBackend(path, params) async {
  Uri apiUrl = new Uri(
      scheme: 'http',
      host: '172.27.64.179',
      port: 8000,
      path: "api/mobility-platform/" + path);

  print(apiUrl);

  return await http.post(apiUrl, body: json.encode(params), headers: {HttpHeaders.CONTENT_TYPE: "application/json"},);
}

acceptOffer(offerId) async {
  var resp =
      await callBackend('mobile/accept-proposed-offer', {"offerId": offerId});
  return json.decode(resp.body);
}

declineOffer(offerId) async {
  var resp =
      await callBackend('mobile/decline-proposed-offer', {"offerId": offerId});
  return json.decode(resp.body);
}
