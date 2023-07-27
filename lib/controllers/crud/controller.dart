part of controllers;

class CrudController extends GetxController {
  var service = Get.put(PocketBaseService());

  var isLoading = false.obs;
  var isError = "".obs;
  var result = [].obs;

  list() async {
    isLoading.value = true;
    try {
      var res = await service.list("notes");
      result.value = res;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      isError.value = e.toString();
    }
  }

  delete(id) async {
    isLoading.value = true;
    try {
      await service.delete("notes", id);
      list();
    } catch (e) {
      isLoading.value = false;
      isError.value = e.toString();
    }
  }

  @override
  void onInit() {
    list();
    super.onInit();
  }
}
