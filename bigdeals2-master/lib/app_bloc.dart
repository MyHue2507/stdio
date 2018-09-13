import 'package:rxdart/rxdart.dart';
import 'package:bigdeals2/app_state.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bigdeals2/tabs/tabs.dart';

class AppBloc {
  int check = 0;
  final _app_state = BehaviorSubject<AppState>();
  updateUser(AppState state) {
    _app_state.add(state);
  }

  Stream<AppState> get appState => _app_state.stream;
  bool isLoading = false;
  Future<bool> saveLogged() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLoadingSave =
        (sharedPreferences.getBool('isLoadingSave') ?? isLoading);
    if (check == 1) isLoadingSave = isLoading;
    await sharedPreferences.setBool('isLoadingSave', isLoadingSave);
    return isLoadingSave;
  }

  String _accessTokenLogin;
  Future<String> postLodgin(String email, String password) async {
    var response =
        await http.post("https://bigdeal.stdiohue.com/api/v1/login", headers: {
      "Content-Type": "application/x-www-form-urlencoded"
    }, body: {
      'grant_type': 'password',
      'client_id': '4',
      'client_secret': 'zGSTyJyXTMXFGQok1aLXA3tU8zO8ShtS16RcKEtN',
      'device_type': '1',
      'identifier':
          'ce777617da7f548fe7a9ab6febb56cf39fba6d382000c0395666288d961ee566',
      'email': email,
      'password': password
    });
    if (response.statusCode == 200) {
      if (json.decode(response.body)["message"] == "success") {
        String _accessTokenLogin =
            json.decode(response.body)["data"]["access_token"];
        print(_accessTokenLogin);
        isLoading = true;
        check = 1;
        saveLogged();
      } else {
        isLoading = false;
        check = 1;
        saveLogged();
      }
      print(_accessTokenLogin);
      updateUser(AppState(isLoading));
      return _accessTokenLogin;
    }
    updateUser(AppState(isLoading));
    return Future.error("error");
  }

  String _accessTokenRegister;
  Future<String> postRegister(String email, String password) async {
    var response = await http
        .post("https://bigdeal.stdiohue.com/api/v1/register", headers: {
      "Content-Type": "application/x-www-form-urlencoded"
    }, body: {
      'email': email,
      'password': password,
      'birth_day': '123456',
      'gender': '0',
      'client_id': '4',
      'device_type': '0',
      'name': 'abc',
      'identifier':
          'ce777617da7f548fe7a9ab6febb56cf39fba6d382000c0395666288d961ee566',
      'client_secret': 'zGSTyJyXTMXFGQok1aLXA3tU8zO8ShtS16RcKEtN',
    });
    if (response.statusCode == 200) {
      if (json.decode(response.body)["message"] == "success") {
        _accessTokenRegister =
            json.decode(response.body)["data"]["access_token"];
        isLoading = true;
        check = 1;
        saveLogged();
      } else {
        isLoading = false;
        check = 1;
        saveLogged();
      }
      updateUser(AppState(isLoading));
      return _accessTokenRegister;
    }
    return Future.error("error");
  }

  bool getIsLoading() {
    saveLogged().then((value) {
      isLoading = value;
    });
    saveLogged();
    return isLoading;
  }

  Future<String> postForgotPassword(String email) async {
    String messageForgot;
    BuildContext context;
    var response = await http.post(
        "https://bigdeal.stdiohue.com/api/v1/forgot-password",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {'email': email});
    if (response.statusCode == 200) {
      messageForgot = json.decode(response.body)["message"];
      if (messageForgot == "success")
        Navigator.of(context).pushReplacementNamed('/');
      return "success";
    }
    return Future.error("error");
  }

  void dangXuat() {
    isLoading = false;
    check = 1;
    saveLogged();
    updateUser(AppState(isLoading));
  }

  Future<String> postCheckProduct(
      String idProduct, String idDeal, String quantity) async {
    String message;
    var response = await http
        .post("https://bigdeal.stdiohue.com/api/v1/check-product", headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImJjNTMzMzlkNzEwYjg5OWM5YWRlNzZlYmMzOWM1NGEzMTQ4YmRiMDk3NTUzODBhYTNmNTU1MGFkOWViYzY2MGVmNWI5NDAwYjMzZDQ2OTFlIn0.eyJhdWQiOiI0IiwianRpIjoiYmM1MzMzOWQ3MTBiODk5YzlhZGU3NmViYzM5YzU0YTMxNDhiZGIwOTc1NTM4MGFhM2Y1NTUwYWQ5ZWJjNjYwZWY1Yjk0MDBiMzNkNDY5MWUiLCJpYXQiOjE1MzY1NTA0NzEsIm5iZiI6MTUzNjU1MDQ3MSwiZXhwIjoxNTY4MDg2NDcxLCJzdWIiOiIxNjIiLCJzY29wZXMiOltdfQ.LfXi25g4klgOKYOnh69J-x_M7fF06SECaWOIJJ8GSiu3hCV_8W4QYrEXa-_VQM1r1M0w1gjbtsPkvCmLKpAWuR6QA3anuNXaFx_JO7HQhR5-0SiR9XF2Ia8Y5Qc2A2lIwDfmLP0lwz4rvXlPi-7hRMKqiVqdSqANITsB_6vq4E0Jdto4WMJVNkPKYMl6EValJ0TZSZ1bRuX26D0yRs-lJn_qtZXEcs-LISuwMSGdhn-IoKPPzYTPcO4jmNUPSH21I6bVu8VM3jOkSYi6eyn6f8l9vsOoh10XD-cAvkhajgDR-cSTWevWGZTXjgtuz7PpoqMw6NdCc-dN76lW8UgLEOjF7ZAhz3WfckZkPdim5tIsp7gU5AxwyB5B_MUrj-Z3tQFJo6apG5xRQLg9pDJoD9oJXljdtrOP1xO_xelE9GSIkEC1BBDU459xAdLVvcur9fstfJS56MLibXqR3JEdXVsm0XtqyYBzyjzE90XMpl0d8gFxIck_f4lqaLL-ZWHt3anEuzguPGM6rCddyOBvfJR2TDAiKwJg7aaxHIc7v10VfKM4Ie8i6HrmydFI0TgaSzUrXrDeiPZNFBE31ZpGm9PbndBYRwfUvnV_jIetFeQ-j3Kau-UQurbMcOvcrRBew2kd-lcRvjP6-8Qp_sG_NINpnYUQIOCNzTZ-8b6f9b0"
    }, body: {
      'product_id': idProduct,
      'deal_id': idDeal,
      'quantity': quantity
    });
    if (response.statusCode == 200) {
      message = json.decode(response.body)["message"];
      return message;
    }
    return Future.error("error");
  }

  Future<String> changePassWord(
      String new_password, String current_password) async {
    String message;
    var response = await http.post(
        "https://bigdeal.stdiohue.com/api/v1/user/change_password",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization":
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImJhZDNjMmNlMmQxOTczNjc1NWYxNzljMjhlMTQ3MjJjN2NkMGY1MGFlODM4MjY0NmNhNDZlMDU5MTYyY2RiNzlmNzE4ODRhNzhjZmU1ZWNjIn0.eyJhdWQiOiI0IiwianRpIjoiYmFkM2MyY2UyZDE5NzM2NzU1ZjE3OWMyOGUxNDcyMmM3Y2QwZjUwYWU4MzgyNjQ2Y2E0NmUwNTkxNjJjZGI3OWY3MTg4NGE3OGNmZTVlY2MiLCJpYXQiOjE1MzY4MjQ5MzUsIm5iZiI6MTUzNjgyNDkzNSwiZXhwIjoxNTY4MzYwOTM1LCJzdWIiOiIxNjIiLCJzY29wZXMiOltdfQ.y8ezaeDy_FgjFXQAL7i_XGKThkmHUT-xUBk1pZ6Uc71khEqen4SBCcUrM-BMH6zjTMhZiQzisaiWYbwEj1EMRilM-6vVqwyP-4QZquVIuonuqiCQkvJj8-EgttknB_9EBfS-CjFUtaXSq4FJzUN6TTQ6Onbo1CKtvT-RGzcrIKWg3LsmR6_jd5NCfHdH98kt3opJLFMn0H9QQD_2RVyfuo-8a1n10QcBLSEXWHSUdym0wgDH9qTySzVydjRmcgbIwfysMiO9Q-mlu_CvxZ-QpQl5QGMQTQ-ZxUpugNMc9lTFnqeOfZO1MqUQS8HZ0zke8Id5UuHi_0Mjy1O5_qScRwS96m7pDTsq74j2E3sBUoPmVefl-VnXD2IOzJwaIXrw67AQpaQCHXxp1BtunI6or4Du2IQq4lsPHEDAUYXJ6f40UtjdI3_AEkzgrY1LFCrw9XJXVrqLRbNg0LHiBltcv1g_-lYjvNPuZouclaQzXKRRHj2XxbcPVS05U7mcIoXu8yruhDpPeDTrQgfrGyFTs8xdl-yVY-wVKHXfQRYOS1IlZvgRxDe89IPSMtIjtlbE9nCGCI0kksj0lVn3Gz1x4pTwpZFMYSgHGfxWMnUuU7kK3UYfDgKN2RFxNXiEXLnlEvyfSFP02mYqt2PhUlXn39w-9mt3TZngUGunNeIOTa0"
        },
        body: {
          'new_password': new_password,
          'current_password': current_password,
        });
    if (response.statusCode == 200) {
      message = json.decode(response.body)["message"];
      return message;
    }
    return Future.error("error");
  }
}
