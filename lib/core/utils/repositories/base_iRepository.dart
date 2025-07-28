import 'dart:core';

import '../../resources/data_state.dart';

abstract class BaseIRepository<T> {
  Future<DataState<List<T>>> getMany();
}
