import 'apiInterface.dart';

class ApiMock implements ApiInterface {
  ApiMock() : super();
  @override
  String getJson() {
    return "{}";
  }
}
