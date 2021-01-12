import 'package:papasi/domain/model/models.dart';

abstract class IAccountService {
  Future<User> fetchProfile();
}
