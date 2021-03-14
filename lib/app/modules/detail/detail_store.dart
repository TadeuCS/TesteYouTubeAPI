import 'package:mobx/mobx.dart';

part 'detail_store.g.dart';

class DetailStore = _DetailStoreBase with _$DetailStore;

abstract class _DetailStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
