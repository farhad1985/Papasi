import 'package:graphql/client.dart';
import 'package:papasi/data/api/route/config_graph.dart';
import 'package:papasi/data/graphql/mutations/registeration_mutation.dart';
import 'package:papasi/data/graphql/operations/registeration_query.dart';
import 'package:papasi/domain/model/response/registeration/login.dart';
import 'package:papasi/domain/model/response/registeration/login_otp_step1.dart';
import 'package:papasi/domain/model/response/registeration/login_otp_step2.dart';
import 'package:papasi/domain/usecase/api/usecases.dart';
import 'package:uuid/uuid.dart';

class RegisterationService extends IRegisteration {
  @override
  Future<LoginOTPStep1> loginOTPStep1(
      String nickName, String email, String password) async {
    final _client = await GraphQLConfig().getClient();

    final option = MutationOptions(
      documentNode: gql(RegisterationMutation.loginOTPStep1()),
      variables: {"firstName": nickName, "email": email, "password": password},
    );

    final result = await _client.mutate(option);
    if (result.hasException) {
      throw result.exception;
    }
    final data = result.data['register'];
    return LoginOTPStep1.fromJSON(data);
  }

  @override
  Future<LoginOTPStep2> loginOTPStep2(
      String token, String email, String password) async {
    final _client = await GraphQLConfig().getClient();

    final option = MutationOptions(
        documentNode: gql(RegisterationMutation.verifyCode),
        variables: {"token": token, "email": email, "password": password});

    final result = await _client.mutate(option);

    if (result.hasException) {
      throw result.exception;
    }

    final data = result.data['verifyEmailWithTokenAndLogin'];
    return LoginOTPStep2.fromJSON(data);
  }

  @override
  Future<LoginResult> singin({String email, String password}) async {
    final _client = await GraphQLConfig().getClient();

    final option = QueryOptions(
        documentNode: gql(RegisterationQuery.login),
        variables: {"email": email, "password": password});

    final result = await _client.query(option);

    if (result.hasException) {
      throw result.exception;
    }

    final data = result.data['login'];
    return LoginResult.fromJSON(data);
  }

  @override
  Future<LoginResult> singinGuest(
      {double lat, double long, String cityId}) async {
    final _client = await GraphQLConfig().getClient();
    final uid = Uuid();

    final option = QueryOptions(
        documentNode: gql(RegisterationQuery.loginGuest),
        variables: {
          "uid": uid.v1(),
          "cityId": cityId ?? "",
          "lat": lat,
          "long": long,
        });

    final result = await _client.query(option);

    if (result.hasException) {
      throw result.exception;
    }

    final data = result.data['loginGuest'];
    return LoginResult.fromJSON(data);
  }

  @override
  Future<bool> resetPassword({String email}) async {
    final _client = await GraphQLConfig().getClient();

    final option = QueryOptions(
        documentNode: gql(RegisterationQuery.resetPassword),
        variables: {"email": email});

    final result = await _client.query(option);

    return !result.hasException;
  }

  @override
  Future<bool> setNewPassword(
      {String code, String email, String password}) async {
    final _client = await GraphQLConfig().getClient();

    final option = QueryOptions(
        documentNode: gql(RegisterationMutation.resetPassword),
        variables: {"email": email, "code": code, "password": password});

    final result = await _client.query(option);

    if (result.hasException) {
      throw result.exception;
    }

    return !result.hasException;
  }
}
