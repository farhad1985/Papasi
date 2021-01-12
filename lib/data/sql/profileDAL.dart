import 'package:papasi/domain/model/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDAL {
  factory ProfileDAL.shared() => ProfileDAL._();

  ProfileDAL._();

  Future save({Profile profile}) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    _sp.setString('token', profile.token);
    _sp.setBool('isGuest', profile.isGuest);
  }

  Future<Profile> getProfile() async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    final token = _sp.getString('token');
    final isGuest = _sp.getBool('isGuest');
    return Profile(token: token, isGuest: isGuest);
  }
}
