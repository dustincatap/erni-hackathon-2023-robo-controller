import 'package:robo_controller/core/domain/models/data_object.dart';

abstract interface class LocalDataSource<T extends DataObject> {
  Future<T?> get(int id);

  Future<Iterable<T>> getAll();

  Future<void> addOrUpdate(T object);

  Future<void> addOrUpdateAll(Iterable<T> objects);

  Future<void> delete(T object);

  Future<void> deleteAll();
}
