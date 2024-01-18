import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:heytorus/config/global.dart';
import 'package:heytorus/services/interceptors.dart';
import 'package:heytorus/services/local-storage.dart';

class OnBoardingService {
  final dio = Dio();
  JsonCodec codec = const JsonCodec();

  Future<Map<String, dynamic>> panCheck({required String pan}) async {
    dio.interceptors.clear();
    dio.interceptors.add(AddJWT());

    Map pData = {};

    try {
      Response r2 = await dio.post(
        '${HTConfig['apiEndpoint']}/users/onboarding/pancheck',
        data: {
          "pan": pan,
        },
      );

      pData = r2.data['data']['pan_details']['result']['data']['panData'];
      return {
        'error': false,
        'name': pData['name'],
        'is_kra': r2.data['data']['is_kra'],
        'dob': pData['dateOfBirth'],
        'pan': pData['pan']
      };
    } on DioException catch (e) {
      print(e.response?.data);
      return {'error': true};
    }
  }

  Future<Map<String, dynamic>> pennyDrop(
      {required String accountNumber, required String ifsc}) async {
    dio.interceptors.clear();

    try {
      Response r2 = await dio.post(
        'https://ind-verify.hyperverge.co/api/checkBankAccount',
        data: {
          "accountNumber": accountNumber,
          "ifsc": ifsc,
        },
        options: Options(
          headers: {
            'transactionId': 'ga_1234',
            'appId': '9hntlc',
            'appKey': 'bpxnoji3kz3933pwlik2'
          },
        ),
      );

      print(r2.data);

      return {
        'success': true,
        'ifsc': r2.data['result']['ifsc'],
        'accountNumber': r2.data['result']['accountNumber'],
        'accountName': r2.data['result']['accountName'],
      };
    } on DioException catch (e) {
      print(e);
      return {'success': false};
    }
  }

  Future<Map<String, dynamic>> initEsign() async {
    dio.interceptors.clear();
    dio.interceptors.add(AddJWT());
    try {
      Response r2 = await dio.post(
        '${HTConfig['apiEndpoint']}/users/onboarding/1/generate-aof',
        data: {
          "expire_in_days": 1,
          "display_on_page": "HELO",
          "send_sign_link": false,
          "notify_signers": false
        },
      );

      return {
        'error': false,
        'result': r2,
      };
    } on DioException catch (e) {
      print(e.response?.data);
      return {'error': true};
    }
  }

  Future<Map<String, dynamic>> createOnboarding(
      {required String pan, required String dob}) async {
    dio.interceptors.clear();
    dio.interceptors.add(AddJWT());
    try {
      Response r2 = await dio.post(
        '${HTConfig['apiEndpoint']}/users/onboarding',
        data: {
          "dob": dob,
          "pan": pan,
        },
      );

      await securedStorageService.write(
          key: 'ob_id', value: r2.data['data']['id'].toString());
      //print();
      return {
        'error': false,
      };
    } on DioException catch (e) {
      print(e.response?.data);
      return {'error': true};
    }
  }

  Future<Map<String, dynamic>> requestDigioKYC() async {
    dio.interceptors.clear();
    dio.interceptors.add(AddJWT());
    try {
      Response r2 = await dio.post(
        '${HTConfig['apiEndpoint']}/users/onboarding/digio/request/kyc',
      );

      return {
        'error': false,
        'number': r2.data['customer_identifier'],
        'id': r2.data['access_token']['entity_id'],
        'tokenId': r2.data['access_token']['id']
      };
    } on DioException catch (e) {
      print(e.response?.data);
      return {'error': true};
    }
  }
}

OnBoardingService obService = OnBoardingService();
