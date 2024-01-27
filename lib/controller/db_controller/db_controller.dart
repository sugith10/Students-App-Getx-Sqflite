abstract class DataBaseController<T> {
  //Open database;
  Future<void> openDB();

  //Add data to database
  Future<void> post(T data);

  //Get data from the database
  Future<void> get();

  //Edit existing data of the database
  Future<void> put(int id, Map<String, dynamic> updateData);

  //Delete data from the database
  Future<void> delete(String id);
}
