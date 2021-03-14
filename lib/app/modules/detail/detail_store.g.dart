// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailStore on _DetailStoreBase, Store {
  final _$valueAtom = Atom(name: '_DetailStoreBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_DetailStoreBaseActionController =
      ActionController(name: '_DetailStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_DetailStoreBaseActionController.startAction(
        name: '_DetailStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_DetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
