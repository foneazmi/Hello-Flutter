part of controllers;

class HttpController extends GetxController {
  var service = Get.put(HttpService());

  var isLoading = false.obs;
  var isError = "".obs;
  var result = "".obs;

  hello() async {
    isLoading.value = true;
    try {
      var res = await service.hello();
      result.value = res.toJson().toString();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      isError.value = e.toString();
    }
  }

  @override
  void onInit() {
    hello();
    super.onInit();
  }
}
