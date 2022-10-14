import 'package:barberapp/api.dart';
import 'package:barberapp/controllers/snackbar.dart';
import 'package:barberapp/model/g.model.dart';
import 'package:barberapp/model/newsmodel.dart';
import 'package:barberapp/utils/values.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

    RxBool loginError = false.obs;
  RxList<NewsFeedModel> classList = RxList<NewsFeedModel>();
  var classS = NewsFeedModel();
 // RxBool buttonPressed = false.obs;
  RxBool forward = false.obs;
  RxBool complete = false.obs;
  RxBool loading = false.obs;
  RxBool showCounter = false.obs;
  RxBool userAgreed = true.obs;
  Duration duration = Duration(seconds: 60);

Future<void> loadData() async {
    try {
      if (!loading.value) {
        loading(true);
        await ApiRequest.postRequest(
                baseURL +
                    'https://hostrelic.com/sys/wowonder/api/posts?access_token=d5f72a349b37d297ce9cf6ad3ef8886433d974fb2d5aada1722a3cba1fcc7f7a7141fa0684650167df1a336b7e0b0cb186de6e66800c43a9',
                () {
                })
            .then((value) async {
          if (value != null) {
       print(value);
            if (value.toString() == 'Unauthorized') {
              showSnackbarError('Session Expired',
                  'Your session expired. Please login again.');
             // Get.offAll(const LoginScreen());
            } else {
              if (value['data'] != null) {
                classList.value = newsFeedModelFromJson(value['data']);
                print(classList.length);
              }
            }
          }
        });   
      }
      // } catch (e) {
      //   print('Error Caught $e');
    } finally {
     loading(false);
    }
  }
 }
