import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:heytorus/config/global.dart';
import 'package:heytorus/models/user.dart';
import 'package:heytorus/services/interceptors.dart';
import 'package:heytorus/services/local-storage.dart';

class AuthService {
  final dio = Dio();
  JsonCodec codec = const JsonCodec();
  Future<Map> loginOrRegisterWithPhone({required phone}) async {
    try {
      Response r = await dio.post(
        '${HTConfig['apiEndpoint']}/auth?type=phone',
        data: {"entity": phone},
      );
      //print(r.data);
      return r.data;
    } on DioException catch (e) {
      print(e.response);
      //  print(e.error);
      //print(e.response);
      return {'success': false};
    }
  }

  Future<Map> getUser() async {
    try {
      dio.interceptors.add(AddJWT());
      Response r = await dio.get(
        '${HTConfig['apiEndpoint']}/users/me',
      );
      Map uData = r.data['data'];
      User u = User();
      u.firstName = uData['first_name'];
      u.phone = uData['phone'];
      u.email = uData['email'];
      if (uData['onboarding'] != null) {
        u.kyc.PAN = uData['onboarding']['pan_number'];
        // u.kyc = uData['onboarding']['pan_number'];
      }
      return {'success': true, 'user': u};
    } on DioException catch (e) {
      print(e.response);
      return {'success': false};
    }
  }

  Future<Map> verifyOTP({
    required int entityId,
    required String phone,
    required String OTP,
  }) async {
    try {
      Response r2 = await dio.post(
        '${HTConfig['apiEndpoint']}/auth/verify?type=phone&jwt=true',
        data: {
          "id": entityId,
          "entity": phone,
          "otp": OTP.toString(),
        },
      );

      await securedStorageService.write(
        key: 'accessToken',
        value: r2.data['jwt'],
      );
      return {
        'success': true,
        'jwt': r2.data['jwt'],
      };
    } on DioException catch (e) {
      print(e.response);
      return {'success': false};
    }
  }

  Future<Map> logout() async {
    try {
      await securedStorageService.delete(
        key: 'accessToken',
      );
      return {'success': true};
    } catch (e) {
      return {'success': false};
    }
  }
}

AuthService auth = AuthService();
