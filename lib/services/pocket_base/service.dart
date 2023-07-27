part of services;

class PocketBaseService {
  final pb = PocketBase('https://pb.khan.my.id');

  Future getList(collectionName) async {
    final resultList = await pb.collection(collectionName).getList(
          page: 1,
          perPage: 50,
        );
    return resultList.items;
  }

  Future createData(collectionName, body) async {
    final record = await pb.collection(collectionName).create(body: body);
    return record;
  }

  Future getOne(collectionName, id) async {
    final result = await pb.collection(collectionName).getOne(id);
    return result;
  }

  Future updateData(collectionName, id, body) async {
    final record = await pb.collection(collectionName).update(id, body: body);
    return record;
  }

  Future deleteData(collectionName, id) async {
    await pb.collection(collectionName).delete(id);
  }
}
