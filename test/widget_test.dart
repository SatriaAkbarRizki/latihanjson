import 'package:http/http.dart' as http;

void main() async {
  await getDataUser();
}

Future getDataUser() async {
  Uri url = Uri.parse('https://reqres.in/api/users/23');
  var response = await http.get(url);

  print('Status Code: ${response.statusCode}');
  if (response.statusCode != 200) {
    print('Data tidak ditemukan');
  } else {
    print(response.body);
  }
}
