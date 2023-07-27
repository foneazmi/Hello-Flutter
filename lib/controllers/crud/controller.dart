part of controllers;

const collectionName = "notes";

class CrudController extends GetxController {
  var service = Get.put(PocketBaseService());
  var isLoading = false.obs;
  var isError = "".obs;
  var result = [].obs;

  getList() async {
    isLoading.value = true;
    try {
      var res = await service.getList(collectionName);
      result.value = res;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      isError.value = e.toString();
    }
  }

  createData(body) async {
    isLoading.value = true;
    try {
      await service.createData(collectionName, body);
      await getList();
    } catch (e) {
      isLoading.value = false;
      isError.value = e.toString();
    }
  }

  updateData(id, body) async {
    isLoading.value = true;
    try {
      await service.updateData(collectionName, id, body);
      await getList();
    } catch (e) {
      isLoading.value = false;
      isError.value = e.toString();
    }
  }

  deleteData(id) async {
    isLoading.value = true;
    try {
      await service.deleteData(collectionName, id);
      await getList();
    } catch (e) {
      isLoading.value = false;
      isError.value = e.toString();
    }
  }
  // @override
  // void onInit() {
  //   getList();
  //   super.onInit();
  // }
}
