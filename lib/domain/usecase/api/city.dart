import 'package:papasi/domain/model/response/city/city.dart';

abstract class ICityService {
  Future<List<City>> fetchCity({String name});
}
