import 'package:flutter_test/flutter_test.dart';
import 'package:teste_slidy/app/modules/detail/detail_store.dart';

void main() {
  DetailStore store;

  setUpAll(() {
    store = DetailStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
