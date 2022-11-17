abstract class ApiConsumer {
  Future<dynamic> get({required String path, Map<String, dynamic>? query});
}
