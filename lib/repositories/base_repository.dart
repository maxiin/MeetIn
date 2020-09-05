abstract class CommonRepository<T> {
  /// Throws [NetworkException].
  Future<T> getOne(int eventId);

  /// Throws [NetworkException].
  Future<List<T>> getMany();
}
