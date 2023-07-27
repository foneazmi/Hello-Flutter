part of services;

class PocketBaseService {
  final pb = PocketBase('https://pb.khan.my.id');

  Future list(collectionName) async {
    final resultList = await pb.collection(collectionName).getList(
          page: 1,
          perPage: 50,
        );
    return resultList.items;
  }

  Future delete(collectionName, id) async {
    await pb.collection(collectionName).delete(id);
  }
}
