import 'package:papasi/domain/model/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CityDAL {
  void saveCity({City city}) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    _sp.setString('cityId', city.id);
    _sp.setString('cityName', city.name);
  }

  Future<City> getCity() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    final id = _sp.getString('cityId');
    final name = _sp.getString('cityName');
    return City(id: id, name: name);
  }

  void removeCity() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    _sp.remove('cityId');
    _sp.remove('cityName');
  }
}
